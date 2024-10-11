// Clock 1 Hz
/*
module Div_Freq (input CLOCK_50MHz, output reg Clk_1Hz);
	reg [25:0] counter = 0;
	always @(posedge CLOCK_50MHz) begin
		if (counter == 25000000) begin
			counter <= 0; //Reinicia o contador
			Clk_1Hz <= ~Clk_1Hz; //Inverte o clock de 1Hz
		end else begin //Código executado se a condição for falsa
			counter <= counter + 1; //Incrementa o contador
		end
	end
endmodule
*/

// Clock 3 Hz
module Div_Freq (input CLOCK_50MHz, output reg Clk_3Hz);

	reg [25:0] counter = 0;
	
	always @(posedge CLOCK_50MHz) begin
		if (counter == 8333333) begin
			counter <= 0; //Reinicia o contador
			Clk_3Hz <= ~Clk_3Hz; //Inverte o clock de 2Hz
		end else begin //Código executado se a condição for falsa
			counter <= counter + 1; //Incrementa o contador
		end
	end
endmodule
