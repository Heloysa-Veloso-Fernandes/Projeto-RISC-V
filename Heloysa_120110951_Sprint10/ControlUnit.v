//ControlUnit: Decodifica a instrução e gera os sinais de controle.

module ControlUnit (
    //Entradas
    input [6:0] Op,          // Opcode (bits 6:0)
    input [2:0] Funct3,      // Funct3 (bits 14:12)
    input [6:0] Funct7,      // Funct7 (bits 31:25)
    
	 // Saídas
	 output reg RegWrite,     			// Sinal de escrita no registrador
    output reg ULASrc,       			// Sinal para o MUX que seleciona o segundo operando da ULA
    output reg [2:0] ULAControl,    // Sinal de controle da ULA
	 output reg [1:0] ImmSrc,			// Seleciona o tipo de imediato
	 output reg MemWrite,				// Habilita a escrita na memória de dados
	 output reg [1:0] ResultSrc,				// Seleciona a origem do resultado (da ULA ou memória)
	 output reg Branch,					// Sinal de branch para instruções de salto condicional
	 output reg PCSrc,
	 output reg Jump 					
);

	reg [16:0] IN_unControl;
	 
	always @(*) begin
	
	IN_unControl = {Op, Funct3, Funct7};

		casex (IN_unControl)
			
			// ADD - Tipo R
			17'b0110011_000_0000000: begin
			RegWrite = 1'b1; ImmSrc = 2'bxx; ULASrc = 1'b0;
			ULAControl = 3'b000; MemWrite = 1'b0; ResultSrc = 2'b00;
			Branch = 1'b0; Jump = 1'b0; PCSrc = 1'b0;
			end
		
			// SUB - Tipo R
			17'b0110011_000_0100000: begin 
			RegWrite = 1'b1; ImmSrc = 2'bxx; ULASrc = 1'b0;
			ULAControl = 3'b001; MemWrite = 1'b0; ResultSrc = 2'b00;
			Branch = 1'b0; Jump = 1'b0; PCSrc = 1'b0;
			end
		
			// AND - Tipo R
			17'b01100111110000000: begin
			RegWrite = 1'b1; ImmSrc = 2'bxx; ULASrc = 1'b0;
			ULAControl = 3'b010; MemWrite = 1'b0; ResultSrc = 2'b00;
			Branch = 1'b0; Jump = 1'b0; PCSrc = 1'b0;
			end
		
			// OR - Tipo R
			17'b01100111100000000: begin
			RegWrite = 1'b1; ImmSrc = 2'bxx; ULASrc = 1'b0;
			ULAControl = 3'b011; MemWrite = 1'b0; ResultSrc = 2'b00;
			Branch = 1'b0; Jump = 1'b0; PCSrc = 1'b0;
			end
			
			// XOR - Tipo R
			17'b0110011_100_0000000: begin
			RegWrite = 1'b1; ImmSrc = 2'bxx; ULASrc = 1'b0;
			ULAControl = 3'b100; MemWrite = 1'b0; ResultSrc = 2'b00;
			Branch = 1'b0; Jump = 1'b0; PCSrc = 1'b0;
			end
		
			// SLT - Tipo R
			17'b0110011_010_0000000: begin
			RegWrite = 1'b1; ImmSrc = 2'bxx; ULASrc = 1'b0;
			ULAControl = 3'b101; MemWrite = 1'b0; ResultSrc = 2'b00;
			Branch = 1'b0; Jump = 1'b0; PCSrc = 1'b0;
			end
		
			// ADDI - Tipo I
			17'b0010011_000_xxxxxxx: begin
			RegWrite = 1'b1; ImmSrc = 2'b00; ULASrc = 1'b1;
			ULAControl = 3'b000; MemWrite = 1'b0; ResultSrc = 2'b00;
			Branch = 1'b0; Jump = 1'b0; PCSrc = 1'b0;
			end 
			
			// LB - Tipo S
			17'b0000011_000_xxxxxxx: begin
			RegWrite = 1'b1; ImmSrc = 2'b00; ULASrc = 1'b1;
			ULAControl = 3'b000; MemWrite = 1'b0; ResultSrc = 2'b01;
			Branch = 1'b0; Jump = 1'b0; PCSrc = 1'b0;
			end
			
			// SB - Tipo S
			17'b0100011_000_xxxxxxx: begin
			RegWrite = 1'b0; ImmSrc = 2'b01; ULASrc = 1'b1;
			ULAControl = 3'b000; MemWrite = 1'b1; ResultSrc = 2'bxx;
			Branch = 1'b0; Jump = 1'b0; PCSrc = 1'b0;
			end
			
			//BEQ - Tipo B
			17'b1100011_000_xxxxxxx: begin
			RegWrite = 1'b0; ImmSrc = 2'b10; ULASrc = 1'b0;
			ULAControl = 3'b001; MemWrite = 1'b0; ResultSrc = 2'bxx;
			Branch = 1'b1; Jump = 1'b0; PCSrc = 1'b1;
			end
			
			//BNE - Tipo B
			17'b1100011_001_xxxxxxx: begin
			RegWrite = 1'b0; ImmSrc = 2'b10; ULASrc = 1'b0;
			ULAControl = 3'b001; MemWrite = 1'b0; ResultSrc = 2'bxx;
			Branch = 1'b1; Jump = 1'b0; PCSrc = 1'b1;
			end

			//JAL - Tipo J
			17'b1101111_xxx_xxxxxxx: begin
			RegWrite = 1'b1; ImmSrc = 2'b11; ULASrc = 1'bx;
			ULAControl = 3'bxxx; MemWrite = 1'b0; ResultSrc = 2'b10;
			Branch = 1'b0; Jump = 1'b1; PCSrc = 1'b1;
			end

			// ORI - Tipo I
			17'b0010011_110_xxxxxxx: begin
			RegWrite = 1'b1; ImmSrc = 2'b00; ULASrc = 1'b1;
			ULAControl = 3'b011; MemWrite = 1'b0; ResultSrc = 2'b00;
			Branch = 1'b0; Jump = 1'b0; PCSrc = 1'b0;
			end
			
			default: begin
			RegWrite = 1'b0; ImmSrc = 2'b00; ULASrc = 1'b0;
			ULAControl = 3'b000; MemWrite = 1'b0; ResultSrc = 2'b00;
			Branch = 1'b0; Jump = 1'b0; PCSrc = 1'b0;
			end
		endcase
	end

endmodule
