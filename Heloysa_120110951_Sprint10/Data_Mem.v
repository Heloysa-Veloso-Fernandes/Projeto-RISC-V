module Data_Mem(
	
	//ENTRADAS
	input [7:0] A,		// Entrada de endereço
	input [7:0] WD,	// Entrada de dados (Escrita)
	input rst,			// Reset
	input clk,			// Clock
	input WE,			//Enable de escrita
	
	//SAÍDAS
	output [7:0] RD	// Saída de dados (Leitura)
);

// Declara um array de registradores de 8 bits, com 256 endereços
reg [7:0] armazenamento8bits [255:0];

// Variável inteira usada para iteração no loop
integer i;

	always @ (posedge clk or negedge rst)
		begin
				// Caso aperte reset, reseta-se todos os registradores
				if (!rst) // Se o sinal de reset estiver ativo (nível baixo)
				begin
				// Inicializa todos os endereços da memória com 0
					for(i = 0; i < 255; i = i+1)
						begin
							armazenamento8bits[i] <= 0; // Define o valor de cada local de memória como 0
						end

				end
				else if (WE == 1 && A != 8'hFF) 
					armazenamento8bits[A] <= WD; // Escreve o dado WD no endereço A
		end

			
assign RD = armazenamento8bits[A]; // Lê o valor armazenado no endereço A e o fornece como saída RD

endmodule
