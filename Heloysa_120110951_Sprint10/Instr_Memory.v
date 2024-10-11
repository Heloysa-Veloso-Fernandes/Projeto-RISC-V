//Instr_Memory: Armazena o programa e fornece as instruções com base no PC.

module Instr_Memory (
    input [7:0] A,       // Endereço de 8 bits
    output reg [31:0] RD // Saída de dados de 32 bits
);

    always @(*) begin
        case (A)
		  
				8'h00: RD = 32'h00000013;
				8'h04: RD = 32'h00006093;
            8'h08: RD = 32'h00106113;
				8'h0C: RD = 32'h00006313;	
            8'h10: RD = 32'h00a06393;
				8'h14: RD = 32'h0ff06293;	
				8'h18: RD = 32'h002081b3;
				8'h1C: RD = 32'h00328023;
				8'h20: RD = 32'h000100b3;	
            8'h24: RD = 32'h00018133;
				8'h28: RD = 32'h00130313;	
				8'h2C: RD = 32'hfe7316e3;
				8'h30: RD = 32'h0040006f;
				8'h34: RD = 32'h00006093;	
				8'h38: RD = 32'h00106113;	
				8'h3C: RD = 32'h00006313;	
				8'h40: RD = 32'h0ff06293;	
				8'h44: RD = 32'hfd5ff06f;	
				
            default: RD = 32'h00000000; // NOP (No Operation) por padrão
        endcase
    end
endmodule
