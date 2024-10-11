module ParallelOUT (
  input [7:0] Address,		// Endereço (pode ser usado para diferentes saídas)
  input [7:0] RegData,  	// Dados da sequência de Fibonacci (dado a ser enviado)
  input EN,						// Enable - Habilitação de escrita no display
  input clk,					// Clock
  input rst,					// Reset
  output reg [7:0] DataOut	// Saída de dados para o display
);


reg aux;
reg aux2;

always @(*) begin
  // Checa se o endereço é 8'hFF
  aux = (Address == 8'hFF) ? 1'b1 : 1'b0;
  // Habilita a escrita na saída se o endereço for correto e EN estiver ativo
  aux2 = EN & aux;
end

// Bloco que reage à borda de subida do clock ou à borda de descida do reset
always @ (posedge clk or negedge rst) begin
  if (!rst) begin
    // Reseta a saída para 0 se o reset for ativado
    DataOut <= 8'h00;
  end else begin
    if (aux2 == 1'b1) begin
      // Se o enable estiver ativo e o endereço for correto, carrega o RegData na saída
      DataOut <= RegData;
    end
  end
end
endmodule


