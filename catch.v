module catch (clk, in, out, my_clk, score, can);

input clk;
input [9:0] in;
output reg [9:0] out;
output reg [6:0] score;
output reg [6:0] can;
output reg my_clk;

reg [99:0] counter;

reg asdf;
reg var, rav;

	initial begin
		
		out = 10'b0000000001;
		counter = 100'b0;
		can = 7'b0000011;
		asdf = 0;
		var = 0;
		rav = 0;
		
	end
	
	always @(posedge clk) begin
		
		if (counter <= 4999999) begin
			counter <= counter + 1;
		end else begin
			my_clk <= ~my_clk;
			counter <= 100'b0;
		end
		
	end
	
	always @(posedge my_clk) begin
		if ( can != 0) begin
			if(in == 10'b0) begin
				rav <= 0;
				var <= 0;
				
				if(out == 10'b0100000000) begin
				
					asdf <= 1;
						
				end else if (out == 10'b0000000010) begin
				
					asdf <= 0;
					
				end
				
				if (asdf == 0) begin
				
					out <= {out[8:0],1'b0};
					
				end else begin
				
					out <= {1'b0,out[9:1]};
					
				end
				
			end else begin
			
				if( out == in ) begin
					
					if (var == 0) begin
					
						score <= score + 1;
					
					end
					
					var <= 1;
					
				end else begin
				
					if (rav == 0) begin
					
						can <= can - 1;
						
					end
					
					rav <= 1;
					
				end
			end
			
		end else begin
			
				out <= 10'b1111111111;
				
		end
		
	end

endmodule
		
		