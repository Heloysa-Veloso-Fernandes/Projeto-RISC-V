module hex7seg (input [3:0] hex, output reg [6:0] seg);

	// Bloco always para definir os segmentos do display com base na entrada hexadecimal
	always @(*) begin
		case(hex)
			4'h0: seg = 7'b0000001; // 0
			4'h1: seg = 7'b1001111; // 1
			4'h2: seg = 7'b0010010; // 2
			4'h3: seg = 7'b0000110; // 3
			4'h4: seg = 7'b1001100; // 4
			4'h5: seg = 7'b0100100; // 5
			4'h6: seg = 7'b0100000; // 6
			4'h7: seg = 7'b0001111; // 7
			4'h8: seg = 7'b0000000; // 8
			4'h9: seg = 7'b0000100; // 9
			4'hA: seg = 7'b0001000; // A
			4'hB: seg = 7'b1100000; // b
			4'hC: seg = 7'b0110001; // C
			4'hD: seg = 7'b1000010; // d
			4'hE: seg = 7'b0110000; // E
			4'hF: seg = 7'b0111000; // F
			default: seg = 7'b0000001; // Valor padrão para apagar o display
		endcase
	end
endmodule
