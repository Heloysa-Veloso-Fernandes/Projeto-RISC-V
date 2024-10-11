module ParallelIN (
  input [7:0] Address,
  input [7:0] MemData,  
  input [7:0] DataIn,
  output reg [7:0] RegData
);

always @(*) begin
  // Se o endereço for diferente de 8'hFF, usa o dado da memória (MemData),
  //caso contrário usa o dado de entrada (DataIn)
  RegData = (Address != 8'hFF) ? MemData : DataIn;
end

endmodule

