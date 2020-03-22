// VGA����ģ��  ���ݵ�ǰɨ�赽�ĵ�����һ���������Ӧ��ɫ
module VGA_Control
(
	input clk,
	input rst,
	
	input [1:0]snake,
	input [5:0]apple_x,
	input [4:0]apple_y,
	output reg[9:0]x_pos,
	output reg[9:0]y_pos,	
	output reg hsync,//��Ϊclk
	output reg vsync,//��Ϊdata
	output reg [11:0] color_out//�����VGA��RGB������
);

	reg [19:0]clk_cnt;
	reg [9:0]line_cnt;
	reg clk_25M;
	
	localparam NONE = 2'b00;
	localparam HEAD = 2'b01;
	localparam BODY = 2'b10;
	localparam WALL = 2'b11;
	
	localparam HEAD_COLOR = 12'b000011110000;//����ͷɫ�����RGB��ֵ����ɫ��
	localparam BODY_COLOR = 12'b000011111111;//������ɫ�����RGB��ֵ������ɫ��
	
	reg [3:0]lox;
	reg [3:0]loy;
		
	always@(posedge clk or negedge rst) begin
		if(rst) begin
			clk_cnt <= 0;
			line_cnt <= 0;
			hsync <= 1;
			vsync <= 1;
		end
		else begin
		    x_pos <= clk_cnt - 144;
			y_pos <= line_cnt - 33;	
			if(clk_cnt == 0) begin
			    hsync <= 0;
				clk_cnt <= clk_cnt + 1;
            end
			else if(clk_cnt == 96) begin
				hsync <= 1;
				clk_cnt <= clk_cnt + 1;
            end
			else if(clk_cnt == 799) begin
				clk_cnt <= 0;
				line_cnt <= line_cnt + 1;
			end
			else clk_cnt <= clk_cnt + 1;
			
			if(line_cnt == 0) begin
				vsync <= 0;
            end
			else if(line_cnt == 2) begin
				vsync <= 1;
			end
			else if(line_cnt == 521) begin
				line_cnt <= 0;
				vsync <= 0;
			end
			
			if(x_pos >= 0 && x_pos < 640 && y_pos >= 0 && y_pos < 480) begin
			    lox = x_pos[3:0];
				loy = y_pos[3:0];
				
				//���ݵ�ǰɨ�赽�ĵ�����һ���������Ӧ��ɫ						
				if(x_pos[9:4] == apple_x && y_pos[9:4] == apple_y)//ɨ�赽�ĵ��Ƿ�Ϊƻ��
					case({loy,lox})
						8'b00000000:color_out = 12'b000000000000;
						default:color_out = 12'b000000001111;//ƻ����ɫΪ��ɫ
					endcase						
				else if(snake == NONE)
					color_out = 12'b0000_0000_0000;
				else if(snake == WALL)
					color_out = 3'b101;
				else if(snake == HEAD|snake == BODY) begin   
					case({lox,loy})
						8'b0000_0000:color_out = 12'b0000_0000_0000;
						default:color_out = (snake == HEAD) ?  HEAD_COLOR : BODY_COLOR;
					endcase
				end
			end
		    else
			    color_out = 12'b0000_0000_0000;
		end
    end
endmodule