//RegisterFile_NEW: Banco de registradores que armazena valores temporários.

module RegisterFile_NEW(
	//ENTRADAS
	input clk,	// Entrada de clock (1 bit)
	input rst,	// Reseta o valor dos registradores, em nível baixo (0) (1 bit)
	input we3,	// Habilita ou desabilita a gravação de dados nos registradores de $1 a $7 (1 bit)
	input [2:0] ra1,	// Seleção de qual registrador será disponibilizado na saída rd1 (3 bits)
	input [2:0] ra2,	// Seleção de qual registrador será disponibilizado na saída rd2 (3 bits)
	input [2:0] wa3,	// Seleção do registrador que armazenará o dado proveniente de wd3 (3 bits)
	input [7:0] wd3,  // Entrada de dados (8 bits)
	
	//SAÍDAS
	output [7:0] rd1,	// Barramento de saída - exibindo no LCD 1 (8 bits)
	output [7:0] rd2,  // Barramento de saída - exibindo no LCD 2 (8 bits)
	
	//SAÍDAS AUXILIARES PARA DEBUG
	output [7:0] x0,    // Saída auxiliar para monitorar o valor do registrador $0
	output [7:0] x1,    // Saída auxiliar para monitorar o valor do registrador $1
	output [7:0] x2,    // Saída auxiliar para monitorar o valor do registrador $2
	output [7:0] x3,    // Saída auxiliar para monitorar o valor do registrador $3
	output [7:0] x4,    // Saída auxiliar para monitorar o valor do registrador $4
	output [7:0] x5,    // Saída auxiliar para monitorar o valor do registrador $5
	output [7:0] x6,    // Saída auxiliar para monitorar o valor do registrador $6
	output [7:0] x7     // Saída auxiliar para monitorar o valor do registrador $7
);

	reg [7:0] registrador [7:0]; // Declaração dos registradores de $0 a $7
	integer i; // Variável de índice para loops

	// Bloco always para operações de escrita e reset assíncrono
	// Dentro do bloco, o reset inicializa todos os registradores para zero, incluindo $0.
	// A escrita ocorre apenas se we3 estiver ativo e wa3 não for zero, garantindo que o registrador $0 não seja escrito.
	always @ (posedge clk or negedge rst) // Realizar as ações no pulso do clk ou reset = false;
		begin
				if (rst != 1) begin  // Se o RESET (rst) estiver no STATUS false, realiza a operação a seguir
					for(i = 0; i < 8; i = i + 1) begin
						registrador[i] <= 0; // Reseta todos os registradores para 0
					end
				end else if (we3 && wa3 != 0) begin
					// Caso o ENABLE esteja ativado e o endereço de escrita não seja zero
					registrador [wa3] <= wd3; // Salva o valor de wd3 na posição definida pelo endereçamento
				end
	end
	
	// Bloco combinacional para leitura dos registradores
	assign rd1 = registrador[ra1]; //Imprime no LCD (rd1) o valor do registrador[z], sendo z a posição definida em ra1
	assign rd2 = registrador[ra2]; //Imprime no LCD (rd2) o valor do registrador[z], sendo z a posição definida em ra2
	
	// Saídas auxiliares para debug
	assign x0 = registrador[0]; // Valor do registrador $0
	assign x1 = registrador[1]; // Valor do registrador $1
	assign x2 = registrador[2]; // Valor do registrador $2
	assign x3 = registrador[3]; // Valor do registrador $3
	assign x4 = registrador[4]; // Valor do registrador $4
	assign x5 = registrador[5]; // Valor do registrador $5
	assign x6 = registrador[6]; // Valor do registrador $6
	assign x7 = registrador[7]; // Valor do registrador $7
 
 endmodule
 