module Mux2x1_8bits(
	input sw17,	// Entrada de 1 bit usada para selecionar qual entrada será passada para a saída      
   input [7:0] w_rd2, // Entrada de 8 bits que pode ser selecionada para a saída   
   output reg [7:0] w_ScrB // Saída de 8 bits que vai receber o valor com base na seleção 
);

	always @(*)
		begin
			case(sw17)
				1'b0: w_ScrB = w_rd2; // Se sw17 for 0, w_ScrB recebe o valor de w_rd2
				1'b1: w_ScrB = 8'h07; // Se sw17 for 1, w_ScrB recebe o valor constante 8'h07
			endcase
	end
endmodule
