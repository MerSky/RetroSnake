//数码管计分模块
module Seg_Display
(
	input clk,
	input rst,
	
	input add_cube,
	inout [1:0]game_status,
	
	output reg[6:0]seg_out,
	output reg[7:0]sel//选择数码管的哪一位显示
);

    localparam RESTART = 2'b00;
    
	reg[31:0]point;
	reg[31:0]clk_cnt;
	
	always@(posedge clk or negedge rst)
	begin
		if(!rst)
			begin
				seg_out <= 0;
				clk_cnt <= 0;
				sel <= 0;
			end
	    else if (game_status == RESTART) begin
	    seg_out <= 0;
            clk_cnt <= 0; 
            sel<=0;               
        end
		else
			begin
				if(clk_cnt <= 40_0000)	
				begin
					clk_cnt <= clk_cnt+1;
					if(clk_cnt == 5_0000)
						begin
						sel<=8'b11111110;
							case(point[3:0])
								4'b0000:seg_out <= 7'b100_0000;
								4'b0001:seg_out <= 7'b111_1001;
								4'b0010:seg_out <= 7'b010_0100;
								4'b0011:seg_out <= 7'b011_0000;
								4'b0100:seg_out <= 7'b001_1001;
								4'b0101:seg_out <= 7'b001_0010;
								4'b0110:seg_out <= 7'b000_0010;
								4'b0111:seg_out <= 7'b111_1000;
								4'b1000:seg_out <= 7'b000_0000;
								4'b1001:seg_out <= 7'b001_0000;
								default;
							endcase					
						end					
					else if(clk_cnt == 10_0000)
						begin		
						sel <= 8'b11111101;				
							case(point[7:4])
						        4'b0000:seg_out <= 7'b100_0000;
                                4'b0001:seg_out <= 7'b111_1001;
                                4'b0010:seg_out <= 7'b010_0100;
                                4'b0011:seg_out <= 7'b011_0000;
                                4'b0100:seg_out <= 7'b001_1001;
                                4'b0101:seg_out <= 7'b001_0010;
                                4'b0110:seg_out <= 7'b000_0010;
                                4'b0111:seg_out <= 7'b111_1000;
                                4'b1000:seg_out <= 7'b000_0000;
                                4'b1001:seg_out <= 7'b001_0000;
								default;							
							endcase							
						end					
					else if(clk_cnt == 15_0000)
						begin
						sel <= 8'b11111011;
							case(point[11:8])
								4'b0000:seg_out <= 7'b100_0000;
                                4'b0001:seg_out <= 7'b111_1001;
                                4'b0010:seg_out <= 7'b010_0100;
                                4'b0011:seg_out <= 7'b011_0000;
                                4'b0100:seg_out <= 7'b001_1001;
                                4'b0101:seg_out <= 7'b001_0010;
                                4'b0110:seg_out <= 7'b000_0010;
                                4'b0111:seg_out <= 7'b111_1000;
                                4'b1000:seg_out <= 7'b000_0000;
                                4'b1001:seg_out <= 7'b001_0000;
								default;					
							endcase
						end					
					else if(clk_cnt == 20_0000)
						begin
						sel <= 8'b11110111;
							case(point[15:12])
								4'b0000:seg_out <= 7'b100_0000;
                                4'b0001:seg_out <= 7'b111_1001;
                                4'b0010:seg_out <= 7'b010_0100;
                                4'b0011:seg_out <= 7'b011_0000;
                                4'b0100:seg_out <= 7'b001_1001;
                                4'b0101:seg_out <= 7'b001_0010;
                                4'b0110:seg_out <= 7'b000_0010;
                                4'b0111:seg_out <= 7'b111_1000;
                                4'b1000:seg_out <= 7'b000_0000;
                                4'b1001:seg_out <= 7'b001_0000;
								default;					
							endcase
						end
					else if(clk_cnt == 25_0000)
                            begin        
                            sel <= 8'b11101111;                
                                case(point[19:16])
                                    4'b0000:seg_out <= 7'b100_0000;
                                    4'b0001:seg_out <= 7'b111_1001;
                                    4'b0010:seg_out <= 7'b010_0100;
                                    4'b0011:seg_out <= 7'b011_0000;
                                    4'b0100:seg_out <= 7'b001_1001;
                                    4'b0101:seg_out <= 7'b001_0010;
                                    4'b0110:seg_out <= 7'b000_0010;
                                    4'b0111:seg_out <= 7'b111_1000;
                                    4'b1000:seg_out <= 7'b000_0000;
                                    4'b1001:seg_out <= 7'b001_0000;
                                    default;                            
                                endcase                            
                            end
					else if(clk_cnt == 30_0000)
                                begin        
                                sel <= 8'b11011111;                
                                    case(point[23:20])
                                        4'b0000:seg_out <= 7'b100_0000;
                                        4'b0001:seg_out <= 7'b111_1001;
                                        4'b0010:seg_out <= 7'b010_0100;
                                        4'b0011:seg_out <= 7'b011_0000;
                                        4'b0100:seg_out <= 7'b001_1001;
                                        4'b0101:seg_out <= 7'b001_0010;
                                        4'b0110:seg_out <= 7'b000_0010;
                                        4'b0111:seg_out <= 7'b111_1000;
                                        4'b1000:seg_out <= 7'b000_0000;
                                        4'b1001:seg_out <= 7'b001_0000;
                                        default;                            
                                    endcase                            
                                end
					else if(clk_cnt == 35_0000)
                                    begin        
                                    sel <= 8'b10111111;                
                                        case(point[27:24])
                                            4'b0000:seg_out <= 7'b100_0000;
                                            4'b0001:seg_out <= 7'b111_1001;
                                            4'b0010:seg_out <= 7'b010_0100;
                                            4'b0011:seg_out <= 7'b011_0000;
                                            4'b0100:seg_out <= 7'b001_1001;
                                            4'b0101:seg_out <= 7'b001_0010;
                                            4'b0110:seg_out <= 7'b000_0010;
                                            4'b0111:seg_out <= 7'b111_1000;
                                            4'b1000:seg_out <= 7'b000_0000;
                                            4'b1001:seg_out <= 7'b001_0000;
                                            default;                            
                                        endcase                            
                                    end
					else if(clk_cnt == 40_0000)
                                        begin        
                                        sel <= 8'b01111111;                
                                            case(point[31:28])
                                                4'b0000:seg_out <= 7'b100_0000;
                                                4'b0001:seg_out <= 7'b111_1001;
                                                4'b0010:seg_out <= 7'b010_0100;
                                                4'b0011:seg_out <= 7'b011_0000;
                                                4'b0100:seg_out <= 7'b001_1001;
                                                4'b0101:seg_out <= 7'b001_0010;
                                                4'b0110:seg_out <= 7'b000_0010;
                                                4'b0111:seg_out <= 7'b111_1000;
                                                4'b1000:seg_out <= 7'b000_0000;
                                                4'b1001:seg_out <= 7'b001_0000;
                                                default;                            
                                            endcase                            
                                        end                                                                            										
				end				
				else
					clk_cnt <= 0;
			end		
	end
	
	reg addcube_state;
	
	always@(posedge clk or negedge rst)
		begin
			if(!rst)
				begin
					point <= 0;
					addcube_state <= 0;					
				end
			else if (game_status == RESTART) begin
                point <= 0;
                addcube_state <= 0;              
            end
			else begin
				case(addcube_state)				
				    0: begin
				    //得分后进行加分，对每个数码管进行判断				
					    if(add_cube) begin
					        if(point[3:0] < 9)
						        point[3:0] <= point[3:0] + 1;
					        else begin
						        point[3:0] <= 0;
							    if(point[7:4] < 9)
							 	    point[7:4] <= point[7:4] + 1;
							    else begin
								    point[7:4] <= 0;
								    if(point[11:8] < 9)
									    point[11:8] <= point[11:8] + 1;
								    else begin
								        point[11:8] <= 0;
								        if(point[15:12]<9)
								        point[15:12]<=point[15:12]+1;
							                 else begin
                                            point[15:12] <= 0;
                                            if(point[19:16] < 9)
                                                point[19:16] <= point[19:16] + 1;
                                                    else begin
                                                    point[19:16] <= 0;
                                                    if(point[23:20] < 9)
                                                        point[23:20] <= point[23:20] + 1;
                                                         else begin
                                                            point[23:20] <= 0;
                                                            if(point[27:24] < 9)
                                                                point[27:24] <= point[27:24] + 1;
                                                        		    else begin
                                                                    point[27:24] <= 0;
                                                                    if(point[31:28] < 9)
                                                                        point[31:28] <= point[31:28] + 1;
                                                     end
                                                end
                                            end
                                        end
								    end
							    end
						    end
					       addcube_state <= 1;
				        end
				    end				
				    1: begin
				        if(!add_cube)
					        addcube_state <= 0;
				    end				
				endcase			
			end										
	   end								
endmodule