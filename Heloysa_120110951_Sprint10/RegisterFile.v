module RegisterFile (
  input [7:0] wd3,         // Texto (8 bits)
  input [2:0] wa3,         // Enderaçamento (3 bits)
  input we3,               // Enable (1 bit)
  input clk,               // Clock (1 bit)
  input [2:0] ra1,         // Escrevendo no LCD1 (3 bits)
  input [2:0] ra2,         // Escrevendo no LCD2 (3 bits)
  input rst,               // Reset
  output [7:0] rd1,    		// Exibindo no LCD 1 (8 bits)
  output [7:0] rd2,   		// Exibindo no LCD 2 (8 bits)
  output [7:0] s_extra     // Exibindo no LCD EXTRA (8 bits)
);

reg [7:0] registrador [7:0]; //Vetor com elementos de 8 bits

integer i; // Variável tipo int que irá funcionar como ponteiro

	always @ (posedge clk or negedge rst) // Realizar as ações no pulso do clk ou reset = false;
		begin
				if (rst != 1) // Se o RESET (rst) estiver no STATUS false, realiza a operação a seguir
				begin
					for(i = 0; i < 8; i = i+1) begin
					registrador [i] <= 0; //Inicializa em 0 todos os registros
					end
				end
				
				else if (we3 == 1 && wa3 != 0) //Caso o ENABLE esteja ativado
					registrador [wa3] <= wd3; // Salva o valor de wd3 na posição definida pelo endereçamento
				else 
					registrador[0] <= 0; //Inserindo o valor 0x no registrador, em caso de erro, ou seja, wea (endereçamento) é 0.
				
		end


  //Escrevendo os valores dos registradores no LCD
  assign rd1 = registrador[ra1]; //Imprimindo no LCD (rd1) o valor do registrador[X], sendo X a posição definida em ra1
  assign rd2 = registrador[ra2]; //Imprimindo no LCD (rd1) o valor do registrador[X], sendo X a posição definida em ra1
  assign s_extra = registrador[0];

 endmodule
 