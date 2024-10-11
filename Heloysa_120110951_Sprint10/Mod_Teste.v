`default_nettype none //Comando para desabilitar declaração automática de wires
module Mod_Teste (
//Clocks
input CLOCK_27, CLOCK_50,
//Chaves e Botoes
input [3:0] KEY,
input [17:0] SW,
//Displays de 7 seg e LEDs
output [0:6] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
output [8:0] LEDG,
output [17:0] LEDR,
//Serial
output UART_TXD,
input UART_RXD,
inout [7:0] LCD_DATA,
output LCD_ON, LCD_BLON, LCD_RW, LCD_EN, LCD_RS,
//GPIO
inout [35:0] GPIO_0, GPIO_1
);
assign GPIO_1 = 36'hzzzzzzzzz;
assign GPIO_0 = 36'hzzzzzzzzz;
assign LCD_ON = 1'b1;
assign LCD_BLON = 1'b1;
wire [7:0] w_d0x0, w_d0x1, w_d0x2, w_d0x3, w_d0x4, w_d0x5,
w_d1x0, w_d1x1, w_d1x2, w_d1x3, w_d1x4, w_d1x5;
LCD_TEST MyLCD (
.iCLK ( CLOCK_50 ),
.iRST_N ( KEY[0] ),
.d0x0(w_d0x0),.d0x1(w_d0x1),.d0x2(w_d0x2),.d0x3(w_d0x3),.d0x4(w_d0x4),.d0x5(w_d0x5),
.d1x0(w_d1x0),.d1x1(w_d1x1),.d1x2(w_d1x2),.d1x3(w_d1x3),.d1x4(w_d1x4),.d1x5(w_d1x5),
.LCD_DATA( LCD_DATA ),
.LCD_RW ( LCD_RW ),
.LCD_EN ( LCD_EN ),
.LCD_RS ( LCD_RS )
);


//---------- modifique a partir daqui --------

// ---------------------------------------- Sprint 10 ----------------------------------------

wire w_PCSrc;
wire [1:0] w_ResultSrc;
wire w_MemWrite;
wire [2:0] w_ULAControl;
wire w_ULASrc;
wire [1:0] w_ImmSrc;
wire w_RegWrite;
wire w_Zero;

wire w_Branch;
wire w_Jump;
wire w_Funct3;

wire [7:0] w_PCp4;
wire [7:0] w_PC;
wire [7:0] w_rd1SrcA;
wire [7:0] w_rd2;
wire [7:0] w_SrcB;
wire [7:0] w_ULAResult;
wire [31:0] w_Inst;

wire [7:0] w_Wd3;
wire [7:0] w_Imm;
wire [7:0] w_RData;

wire [7:0] w_ImmPC;
wire [7:0] w_PCn;

wire [7:0] w_DataOut;
wire [7:0] w_Detain;
wire [7:0] w_RegData;

assign w_PCp4 = w_PC + 3'h4;

assign w_ImmPC = w_Imm + w_PC;

//assign w_PCSrc = w_Jump | (w_Branch & (w_Zero ^ w_Inst[14:12]));
//assign w_PCSrc = w_Zero & w_Branch;
//assign w_d1x1 = w_PCSrc;

// Divisor de frequência
//wire clk_3Hz = KEY[1];
wire clk_3Hz;
Div_Freq div_freq (.CLOCK_50MHz(CLOCK_50), .Clk_3Hz(clk_3Hz));

// Instanciação do Program Counter (PC)
ProgramCounter pc (.clk(clk_3Hz), .rst(KEY[2]), .PCin(w_PCn), .PC(w_PC));

// Instanciação da Memória de Instruções
Instr_Memory memory (.A(w_PC), .RD(w_Inst));

// Instanciação da Unidade de Controle
ControlUnit control_inst (
.Op(w_Inst[6:0]),
.Funct3(w_Inst[14:12]),
.Funct7(w_Inst[31:25]),
.Branch(w_Branch),
.ResultSrc(w_ResultSrc),
.MemWrite(w_MemWrite),
.ULAControl(w_ULAControl[2:0]),
.ULASrc(w_ULASrc),
.ImmSrc(w_ImmSrc),
.RegWrite(w_RegWrite),
.PCSrc(w_PCSrc),
.Jump(w_Jump)
);

// Instanciação do Banco de Registradores - New
RegisterFile_NEW registradores (
.clk(clk_3Hz),        
.rst(KEY[2]),    
.ra1(w_Inst[19:15]),
.ra2(w_Inst[24:20]),
.wa3(w_Inst[11:7]),
.wd3(w_Wd3),
.we3(w_RegWrite),            
.rd1(w_rd1SrcA),    
.rd2(w_rd2),    
// Saídas auxiliares para depuração, mostrando os valores dos registradores
.x0(),
.x1(),
.x2(),
.x3(),
.x4(),
.x5(),
.x6(),
.x7()
);

// Instanciação da ULA
ULA ula (
.SrcA(w_rd1SrcA),      
.SrcB(w_SrcB),        
.ULAControl(w_ULAControl[2:0]),    
.ULAResult(w_ULAResult),  
.Z(w_Zero)                
);

// Instanciação do ParallelOUT
ParallelOUT ParaOUT(
.Address(w_ULAResult),
.RegData(w_rd2),
.EN(w_MemWrite),
.clk(clk_3Hz),
.rst(KEY[2]),
.DataOut(w_DataOut)
);

// Instanciação do ParallelIN
ParallelIN ParaIN(
.Address(w_ULAResult),  
.MemData(w_RData),  
.DataIn(w_Detain),
.RegData(w_RegData)
);

//Instanciação da Data_Mem
Data_Mem data_Mem(
.A(w_ULAResult),
.WD(w_rd2),
.rst(KEY[2]),
.clk(clk_3Hz),
.WE(w_MemWrite),
.RD(w_RData)
);

// Instanciação do MUX 4x1 de 8 bits - MuxImmSrc
Mux_4x1 MuxImmSrc (
.in0(w_Inst[31:20]),
.in1({w_Inst[31:25], w_Inst[11:7]}),
.in2({w_Inst[7], w_Inst[30:25], w_Inst[11:8], 1'b0}),
.in3(),
.sel(w_ImmSrc),
.out(w_Imm)
);

// Instanciação do MUX 2x1 de 8 bits - MuxULASrc
mux2x1 MuxULASrc (.in0(w_rd2), .in1(w_Imm), .sel(w_ULASrc), .out(w_SrcB) );

// Instanciação do MUX 4x1 de 8 bits - MuxResSrc
Mux_4x1 MuxResSrc (
.in0(w_ULAResult),
.in1(w_RegData),
.in2(w_PCp4),
.in3(),
.sel(w_ResultSrc),
.out(w_Wd3)
);

// Instanciação do MUX 2x1 de 8 bits - MuxPCSrc
mux2x1 MuxPCSrc (.in0(w_PCp4), .in1(w_ImmPC), .sel(w_PCSrc), .out(w_PCn));

//assign w_PC = w_d0x4;

assign w_DataOut = w_d1x4;

assign w_Detain = SW[7:0];

// Conexão dos sinais de controle aos LEDs de depuração
//assign LEDR[0] = w_Branch;
//assign LEDR[1] = w_ResultSrc;
//assign LEDR[2] = w_MemWrite;
//assign LEDR[5:3] = w_ULAControl;
//assign LEDR[6] = w_ULASrc;
//assign LEDR[8:7] = w_ImmSrc;
//assign LEDR[9] = w_RegWrite;
//assign LEDR[17] = w_Zero;

// Instanciação do módulo hex7seg
hex7seg HX0 (.hex(w_Inst[3:0]), .seg(HEX0[0:6]));
hex7seg HX1 (.hex(w_Inst[7:4]), .seg(HEX1[0:6]));
hex7seg HX2 (.hex(w_Inst[11:8]), .seg(HEX2[0:6]));
hex7seg HX3 (.hex(w_Inst[15:12]), .seg(HEX3[0:6]));
hex7seg HX4 (.hex(w_Inst[19:16]), .seg(HEX4[0:6]));
hex7seg HX5 (.hex(w_Inst[23:20]), .seg(HEX5[0:6]));
hex7seg HX6 (.hex(w_Inst[27:24]), .seg(HEX6[0:6]));
hex7seg HX7 (.hex(w_Inst[31:28]), .seg(HEX7[0:6]));

assign LEDG[8] = clk_3Hz;

assign LEDG[5] = ~KEY[2];

endmodule
