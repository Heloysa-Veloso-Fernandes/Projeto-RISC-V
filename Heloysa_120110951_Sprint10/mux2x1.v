//mux2x1: MUX que seleciona entre um registrador ou um valor imediato para a ULA.

module mux2x1 (
    input [7:0] in0,      // Entrada 0 (8 bits)
    input [7:0] in1,      // Entrada 1 (8 bits)
    input sel,            // Sinal de seleção (1 bit) que decide qual entrada será passada para a saída
    output reg [7:0] out      // Saída do MUX (8 bits), refletindo a entrada selecionada
);

// Bloco always sensível a qualquer mudança nas entradas (combinacional)
/*
	always @(*) 
		begin
			if (!sel) // Se sel for 0 (ou seja, !sel é 1)
				out = in0; // out recebe i0
			else // Caso contrário (sel for 1)
				out = in1; // out recebe i1
	end
*/	
	// Bloco always sensível a qualquer mudança nas entradas (combinacional)
	always @(*) begin
		case(sel)
			1'b0: out = in0;
			1'b1: out = in1;
			default: out = 8'hFF;
		endcase
	end	
endmodule
