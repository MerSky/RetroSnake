//按键检测模块 延时消抖
	module Key
(	input clk,
	input rst,
	
	input left,
	input right,
	input up,
	input down,
	
	output reg left_key_press,
	output reg right_key_press,
	output reg up_key_press,
	output reg down_key_press
);

	reg [31:0]clk_cnt;
	reg left_key_last;
	reg right_key_last;
	reg up_key_last;
	reg down_key_last;
	
	//当有按键按下时，每100ms（cnt=5_0000） last=up，last输出比up滞后一个周期，若up_key_last==0&&up==1，则说明按键按下，press输出置1。
	always@(posedge clk or negedge rst) begin
		if(!rst) begin
			clk_cnt <= 0;
			left_key_press <= 0;
			right_key_press <= 0;
			up_key_press <= 0;
			down_key_press <= 0;
					
			left_key_last <= 0;
			right_key_last <= 0;
			up_key_last <= 0;
			down_key_last <= 0;					
		end	
		else begin
			if(clk_cnt == 5_0000) begin
				clk_cnt <= 0;
				left_key_last <= left;
				right_key_last <= right;
				up_key_last <= up;
				down_key_last <= down;
					
				if(left_key_last == 0 && left == 1) 
					left_key_press <= 1;
				if(right_key_last == 0 && right == 1)
					right_key_press <= 1;
				if(up_key_last == 0 && up == 1)
					up_key_press <= 1;
				if(down_key_last == 0 && down == 1)
					down_key_press <= 1;
			end						
			else begin
				clk_cnt <= clk_cnt + 1;
				left_key_press <= 0;
				right_key_press <= 0;
				up_key_press <= 0;
				down_key_press <= 0;
			end
		end	
	end				
endmodule