//ProgramCounter: Mantém e atualiza o endereço da próxima instrução.

module ProgramCounter (
    input clk,    		// Sinal de clock
    input rst,   			// Sinal de reset (ativa em nível baixo)
    input [7:0] PCin,   // Entrada de carregamento paralelo (8 bits)
    output reg [7:0] PC	// Saída paralela (8 bits)
);

    always @(posedge clk or negedge rst) begin
        if (!rst)
            PC <= 8'h00;  // Se reset estiver em nível baixo, zera o PC
        else
            PC <= PCin;  // Carrega o novo valor de PCin no registrador
    end
endmodule


/*
clk (clock): Este é o sinal de clock, e a mudança do valor
do PC ocorre na borda de subida do clock (posedge clk).

rst (reset): Este é um sinal de reset assíncrono ativo em nível baixo.
Se rst estiver em nível baixo (negedge rst), o valor do PC é zerado (PC <= 0).

PCin (entrada paralela): Este é o valor de entrada de 8 bits que
será carregado no PC a cada ciclo de clock, caso o reset não esteja ativo.

PC (saída paralela): Esta é a saída de 8 bits que reflete o valor
atual do contador de programa.

Este módulo é um registrador sequencial simples que atualiza seu valor na borda de
subida do clock, a menos que o reset seja ativado, o que zera o valor do PC.

*/