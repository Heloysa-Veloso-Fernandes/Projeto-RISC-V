// Testbench para a UC Sprint5
module UC_SP5_TB;
 
  //Definição das variáveis
  logic [21:0] 	Vetor_teste [7:0];
  logic [6:0] 	OP, Funct7;
  logic [4:0] 	Out_esperado;
  logic [3:0] 	Cont;
  logic [2:0] 	Funct3, ULAControl;
  logic 		RegWrite, ULASrc;

  //Instância da ULA
  ControlUnit UC_rv(.OP(OP), .Funct7(Funct7),.Funct3(Funct3), .RegWrite(RegWrite), .ULASrc(ULASrc), .ULAControl(ULAControl));

  initial
    begin
      $dumpfile("test.vcd"); $dumpvars(1);
      $readmemb("test_vector.txt", Vetor_teste);
      Cont = 0;
    end
  
  always
    begin
      {OP, Funct3, Funct7, Out_esperado} = Vetor_teste[Cont]; #10;
      if ({RegWrite, ULASrc, ULAControl} == Out_esperado)
        $display("PASSOU Cont=%h", Cont);
      else
        $display("FALHOU Cont=%h", Cont);
      if (Cont < 7) //quantidade de linhas de test_vector.txt - 1
      	Cont = Cont + 1'b1;
      else
        $finish();
    end

endmodule 
