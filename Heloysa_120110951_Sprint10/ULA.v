//ULA: Executa operações aritméticas ou lógicas.

module ULA (
	// ENTRADAS
	input [7:0] SrcA,         // Entrada de dados do operando A (8 bits)
	input [7:0] SrcB,         // Entrada de dados do operando B (8 bits)
	input [2:0] ULAControl,   // Controle da ULA - Entrada para seleção da operação realizada(3 bits)
	
	// SAÍDAS
	output reg [7:0] ULAResult, 	// Resultado da ULA - Saída do resultado da operação realizada (8 bits)
	output reg Z                 		// Flag Z (1 bit), indica se o resultado é zero
	// Bit de status que indica se a saída da operação realizada é zero (resultado igual a zero: Z=1;
	//resultado diferente de zero: Z=0).
);

    // Operações da ULA baseadas no controle
    always @(*) begin
        case (ULAControl)
            3'b000: ULAResult = SrcA + SrcB; // ADD
            3'b001: ULAResult = SrcA + ~SrcB + 1; // SUB
            3'b010: ULAResult = SrcA & SrcB; // AND
            3'b011: ULAResult = SrcA | SrcB; // OR
				3'b100: ULAResult = SrcA ^ SrcB; // XOR
            3'b101: ULAResult = (SrcA < SrcB) ? 8'b00000001 : 8'b00000000; // SLT (Set Less Than) - Comparação para definir se SrcA é menor que SrcB (Set Less Than), atribuindo 1 para verdadeiro e 0 para falso.
				
				default: ULAResult = 8'hFF; // Valor Padrão
        endcase
		// Atribuição da Flag Z
		// A flag Z é atribuída 1 se ULAResult for igual a 0, caso contrário, é atribuída 0
		Z = (ULAResult == 0) ? 1'b1 : 1'b0;
	 
	 end
endmodule
