module Mux_4x1 (
    input [11:0] in0,      
    input [11:0] in1,
	 input [11:0] in2,      
    input [11:0] in3,	 
    input [1:0] sel,            // Sinal de seleção (1 bit) que decide qual entrada será passada para a saída
    output reg [11:0] out      // Saída do MUX (8 bits), refletindo a entrada selecionada
);

	always @(*) begin
		case (sel)
			2'b00: out = in0; // Se sel = 00, out recebe in0
         2'b01: out = in1; // Se sel = 01, out recebe in1
         2'b10: out = in2; // Se sel = 02, out recebe in2
         2'b11: out = in3; // Se sel = 03, out recebe in3
			default: out = 8'hFF;
		endcase
	end
endmodule
