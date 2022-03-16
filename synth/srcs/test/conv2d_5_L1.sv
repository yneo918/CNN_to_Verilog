module conv2d_L1_top
	#(parameter WIDTH = 8, W = 28, H = 28, CIN = 1, COUT = 6, F = 5)
	(x, z);
	input [WIDTH-1:0] x[0:CIN-1][0:H-1][0:W-1];
	output [WIDTH*2+$clog2(CIN*F*F)-1:0] z[0:COUT-1][0:H-F][0:W-F];
	wire [WIDTH-1:0] x_in[0:H-1][0:W-1][0:CIN*F*F-1];
	genvar h, i, j, k;
	generate
		for (i = 0; i < H-(F-1); i++) begin
			for (j = 0; j < W-(F-1); j++) begin
				for (h = 0; h < CIN; h++) begin
					for (k = 0; k < F*F; k++) begin
						assign x_in[i][j][h*F*F+k] = x[h][i+k/F][j+k%F];
					end
				end
			end
		end
	endgenerate
	generate
		for (i = 0; i < H-(F-1); i++) begin
			for (j = 0; j < W-(F-1); j++) begin
				conv2d_5_L1_N0 #(.WIDTH(WIDTH), .F(5)) conv2d_5_L1_N0(.x(x_in[i][j]), .z(z[0][i][j]));
			end
		end
	endgenerate
	generate
		for (i = 0; i < H-(F-1); i++) begin
			for (j = 0; j < W-(F-1); j++) begin
				conv2d_5_L1_N1 #(.WIDTH(WIDTH), .F(5)) conv2d_5_L1_N1(.x(x_in[i][j]), .z(z[1][i][j]));
			end
		end
	endgenerate
	generate
		for (i = 0; i < H-(F-1); i++) begin
			for (j = 0; j < W-(F-1); j++) begin
				conv2d_5_L1_N2 #(.WIDTH(WIDTH), .F(5)) conv2d_5_L1_N2(.x(x_in[i][j]), .z(z[2][i][j]));
			end
		end
	endgenerate
	generate
		for (i = 0; i < H-(F-1); i++) begin
			for (j = 0; j < W-(F-1); j++) begin
				conv2d_5_L1_N3 #(.WIDTH(WIDTH), .F(5)) conv2d_5_L1_N3(.x(x_in[i][j]), .z(z[3][i][j]));
			end
		end
	endgenerate
	generate
		for (i = 0; i < H-(F-1); i++) begin
			for (j = 0; j < W-(F-1); j++) begin
				conv2d_5_L1_N4 #(.WIDTH(WIDTH), .F(5)) conv2d_5_L1_N4(.x(x_in[i][j]), .z(z[4][i][j]));
			end
		end
	endgenerate
	generate
		for (i = 0; i < H-(F-1); i++) begin
			for (j = 0; j < W-(F-1); j++) begin
				conv2d_5_L1_N5 #(.WIDTH(WIDTH), .F(5)) conv2d_5_L1_N5(.x(x_in[i][j]), .z(z[5][i][j]));
			end
		end
	endgenerate
endmodule

module conv2d_5_L1_N0
	#(parameter WIDTH = 8, F = 5, CIN = 1)
	(x, z);
	input [WIDTH-1:0] x[0:CIN*F*F-1];
	output [WIDTH*2+$clog2(CIN*F*F)-1:0] z;
	wire [WIDTH*2-1+0:0] tmp00[0:24];
	wire [WIDTH*2-1+1:0] tmp01[0:12];
	wire [WIDTH*2-1+2:0] tmp02[0:6];
	wire [WIDTH*2-1+3:0] tmp03[0:3];
	wire [WIDTH*2-1+4:0] tmp04[0:1];
	wire [WIDTH*2-1+5:0] tmp05[0:0];
	booth__030 #(.WIDTH(WIDTH)) mul00(.x(x[0]), .z(tmp00[0]));
	booth__024 #(.WIDTH(WIDTH)) mul01(.x(x[1]), .z(tmp00[1]));
	booth__036 #(.WIDTH(WIDTH)) mul02(.x(x[2]), .z(tmp00[2]));
	booth_0032 #(.WIDTH(WIDTH)) mul03(.x(x[3]), .z(tmp00[3]));
	booth_0048 #(.WIDTH(WIDTH)) mul04(.x(x[4]), .z(tmp00[4]));
	booth__032 #(.WIDTH(WIDTH)) mul05(.x(x[5]), .z(tmp00[5]));
	booth__040 #(.WIDTH(WIDTH)) mul06(.x(x[6]), .z(tmp00[6]));
	booth__032 #(.WIDTH(WIDTH)) mul07(.x(x[7]), .z(tmp00[7]));
	booth_0040 #(.WIDTH(WIDTH)) mul08(.x(x[8]), .z(tmp00[8]));
	booth_0056 #(.WIDTH(WIDTH)) mul09(.x(x[9]), .z(tmp00[9]));
	booth__040 #(.WIDTH(WIDTH)) mul10(.x(x[10]), .z(tmp00[10]));
	booth__032 #(.WIDTH(WIDTH)) mul11(.x(x[11]), .z(tmp00[11]));
	booth__012 #(.WIDTH(WIDTH)) mul12(.x(x[12]), .z(tmp00[12]));
	booth_0032 #(.WIDTH(WIDTH)) mul13(.x(x[13]), .z(tmp00[13]));
	booth_0040 #(.WIDTH(WIDTH)) mul14(.x(x[14]), .z(tmp00[14]));
	booth__040 #(.WIDTH(WIDTH)) mul15(.x(x[15]), .z(tmp00[15]));
	booth__016 #(.WIDTH(WIDTH)) mul16(.x(x[16]), .z(tmp00[16]));
	booth_0012 #(.WIDTH(WIDTH)) mul17(.x(x[17]), .z(tmp00[17]));
	booth_0024 #(.WIDTH(WIDTH)) mul18(.x(x[18]), .z(tmp00[18]));
	booth_0048 #(.WIDTH(WIDTH)) mul19(.x(x[19]), .z(tmp00[19]));
	booth__030 #(.WIDTH(WIDTH)) mul20(.x(x[20]), .z(tmp00[20]));
	booth__024 #(.WIDTH(WIDTH)) mul21(.x(x[21]), .z(tmp00[21]));
	booth_0008 #(.WIDTH(WIDTH)) mul22(.x(x[22]), .z(tmp00[22]));
	booth_0032 #(.WIDTH(WIDTH)) mul23(.x(x[23]), .z(tmp00[23]));
	booth_0018 #(.WIDTH(WIDTH)) mul24(.x(x[24]), .z(tmp00[24]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000000(.in0(tmp00[0]), .in1(tmp00[1]), .out(tmp01[0]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000001(.in0(tmp00[2]), .in1(tmp00[3]), .out(tmp01[1]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000002(.in0(tmp00[4]), .in1(tmp00[5]), .out(tmp01[2]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000003(.in0(tmp00[6]), .in1(tmp00[7]), .out(tmp01[3]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000004(.in0(tmp00[8]), .in1(tmp00[9]), .out(tmp01[4]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000005(.in0(tmp00[10]), .in1(tmp00[11]), .out(tmp01[5]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000006(.in0(tmp00[12]), .in1(tmp00[13]), .out(tmp01[6]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000007(.in0(tmp00[14]), .in1(tmp00[15]), .out(tmp01[7]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000008(.in0(tmp00[16]), .in1(tmp00[17]), .out(tmp01[8]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000009(.in0(tmp00[18]), .in1(tmp00[19]), .out(tmp01[9]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000010(.in0(tmp00[20]), .in1(tmp00[21]), .out(tmp01[10]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000011(.in0(tmp00[22]), .in1(tmp00[23]), .out(tmp01[11]));
	assign tmp01[12] = 8'(signed'(tmp00[24][WIDTH-1:1]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000012(.in0(tmp01[0]), .in1(tmp01[1]), .out(tmp02[0]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000013(.in0(tmp01[2]), .in1(tmp01[3]), .out(tmp02[1]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000014(.in0(tmp01[4]), .in1(tmp01[5]), .out(tmp02[2]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000015(.in0(tmp01[6]), .in1(tmp01[7]), .out(tmp02[3]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000016(.in0(tmp01[8]), .in1(tmp01[9]), .out(tmp02[4]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000017(.in0(tmp01[10]), .in1(tmp01[11]), .out(tmp02[5]));
	assign tmp02[6] = 8'(signed'(tmp01[12][WIDTH-1:1]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000018(.in0(tmp02[0]), .in1(tmp02[1]), .out(tmp03[0]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000019(.in0(tmp02[2]), .in1(tmp02[3]), .out(tmp03[1]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000020(.in0(tmp02[4]), .in1(tmp02[5]), .out(tmp03[2]));
	assign tmp03[3] = 8'(signed'(tmp02[6][WIDTH-1:1]));
	add2 #(.I_WIDTH(WIDTH*2+3), .O_WIDTH(WIDTH*2+4)) add000021(.in0(tmp03[0]), .in1(tmp03[1]), .out(tmp04[0]));
	add2 #(.I_WIDTH(WIDTH*2+3), .O_WIDTH(WIDTH*2+4)) add000022(.in0(tmp03[2]), .in1(tmp03[3]), .out(tmp04[1]));
	add2 #(.I_WIDTH(WIDTH*2+4), .O_WIDTH(WIDTH*2+5)) add000023(.in0(tmp04[0]), .in1(tmp04[1]), .out(tmp05[0]));
	relu #(.WIDTH(WIDTH*2+$clog2(CIN*F*F))) ReLU(.a(tmp05[0]), .b(21'h0), .sel(tmp05[0][WIDTH*2+$clog2(CIN*F*F)-1]), .out(z));
endmodule

module conv2d_5_L1_N1
	#(parameter WIDTH = 8, F = 5, CIN = 1)
	(x, z);
	input [WIDTH-1:0] x[0:CIN*F*F-1];
	output [WIDTH*2+$clog2(CIN*F*F)-1:0] z;
	wire [WIDTH*2-1+0:0] tmp00[0:24];
	wire [WIDTH*2-1+1:0] tmp01[0:12];
	wire [WIDTH*2-1+2:0] tmp02[0:6];
	wire [WIDTH*2-1+3:0] tmp03[0:3];
	wire [WIDTH*2-1+4:0] tmp04[0:1];
	wire [WIDTH*2-1+5:0] tmp05[0:0];
	booth_0032 #(.WIDTH(WIDTH)) mul00(.x(x[0]), .z(tmp00[0]));
	booth_0016 #(.WIDTH(WIDTH)) mul01(.x(x[1]), .z(tmp00[1]));
	booth__032 #(.WIDTH(WIDTH)) mul02(.x(x[2]), .z(tmp00[2]));
	booth__032 #(.WIDTH(WIDTH)) mul03(.x(x[3]), .z(tmp00[3]));
	booth__040 #(.WIDTH(WIDTH)) mul04(.x(x[4]), .z(tmp00[4]));
	booth_0020 #(.WIDTH(WIDTH)) mul05(.x(x[5]), .z(tmp00[5]));
	booth__010 #(.WIDTH(WIDTH)) mul06(.x(x[6]), .z(tmp00[6]));
	booth__032 #(.WIDTH(WIDTH)) mul07(.x(x[7]), .z(tmp00[7]));
	booth__016 #(.WIDTH(WIDTH)) mul08(.x(x[8]), .z(tmp00[8]));
	booth__024 #(.WIDTH(WIDTH)) mul09(.x(x[9]), .z(tmp00[9]));
	booth__008 #(.WIDTH(WIDTH)) mul10(.x(x[10]), .z(tmp00[10]));
	booth__016 #(.WIDTH(WIDTH)) mul11(.x(x[11]), .z(tmp00[11]));
	booth__020 #(.WIDTH(WIDTH)) mul12(.x(x[12]), .z(tmp00[12]));
	booth__048 #(.WIDTH(WIDTH)) mul13(.x(x[13]), .z(tmp00[13]));
	booth__048 #(.WIDTH(WIDTH)) mul14(.x(x[14]), .z(tmp00[14]));
	booth_0012 #(.WIDTH(WIDTH)) mul15(.x(x[15]), .z(tmp00[15]));
	booth__032 #(.WIDTH(WIDTH)) mul16(.x(x[16]), .z(tmp00[16]));
	booth__040 #(.WIDTH(WIDTH)) mul17(.x(x[17]), .z(tmp00[17]));
	booth__020 #(.WIDTH(WIDTH)) mul18(.x(x[18]), .z(tmp00[18]));
	booth__048 #(.WIDTH(WIDTH)) mul19(.x(x[19]), .z(tmp00[19]));
	booth__008 #(.WIDTH(WIDTH)) mul20(.x(x[20]), .z(tmp00[20]));
	booth__008 #(.WIDTH(WIDTH)) mul21(.x(x[21]), .z(tmp00[21]));
	booth__018 #(.WIDTH(WIDTH)) mul22(.x(x[22]), .z(tmp00[22]));
	booth__040 #(.WIDTH(WIDTH)) mul23(.x(x[23]), .z(tmp00[23]));
	booth__040 #(.WIDTH(WIDTH)) mul24(.x(x[24]), .z(tmp00[24]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000000(.in0(tmp00[0]), .in1(tmp00[1]), .out(tmp01[0]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000001(.in0(tmp00[2]), .in1(tmp00[3]), .out(tmp01[1]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000002(.in0(tmp00[4]), .in1(tmp00[5]), .out(tmp01[2]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000003(.in0(tmp00[6]), .in1(tmp00[7]), .out(tmp01[3]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000004(.in0(tmp00[8]), .in1(tmp00[9]), .out(tmp01[4]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000005(.in0(tmp00[10]), .in1(tmp00[11]), .out(tmp01[5]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000006(.in0(tmp00[12]), .in1(tmp00[13]), .out(tmp01[6]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000007(.in0(tmp00[14]), .in1(tmp00[15]), .out(tmp01[7]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000008(.in0(tmp00[16]), .in1(tmp00[17]), .out(tmp01[8]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000009(.in0(tmp00[18]), .in1(tmp00[19]), .out(tmp01[9]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000010(.in0(tmp00[20]), .in1(tmp00[21]), .out(tmp01[10]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000011(.in0(tmp00[22]), .in1(tmp00[23]), .out(tmp01[11]));
	assign tmp01[12] = 8'(signed'(tmp00[24][WIDTH-1:1]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000012(.in0(tmp01[0]), .in1(tmp01[1]), .out(tmp02[0]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000013(.in0(tmp01[2]), .in1(tmp01[3]), .out(tmp02[1]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000014(.in0(tmp01[4]), .in1(tmp01[5]), .out(tmp02[2]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000015(.in0(tmp01[6]), .in1(tmp01[7]), .out(tmp02[3]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000016(.in0(tmp01[8]), .in1(tmp01[9]), .out(tmp02[4]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000017(.in0(tmp01[10]), .in1(tmp01[11]), .out(tmp02[5]));
	assign tmp02[6] = 8'(signed'(tmp01[12][WIDTH-1:1]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000018(.in0(tmp02[0]), .in1(tmp02[1]), .out(tmp03[0]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000019(.in0(tmp02[2]), .in1(tmp02[3]), .out(tmp03[1]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000020(.in0(tmp02[4]), .in1(tmp02[5]), .out(tmp03[2]));
	assign tmp03[3] = 8'(signed'(tmp02[6][WIDTH-1:1]));
	add2 #(.I_WIDTH(WIDTH*2+3), .O_WIDTH(WIDTH*2+4)) add000021(.in0(tmp03[0]), .in1(tmp03[1]), .out(tmp04[0]));
	add2 #(.I_WIDTH(WIDTH*2+3), .O_WIDTH(WIDTH*2+4)) add000022(.in0(tmp03[2]), .in1(tmp03[3]), .out(tmp04[1]));
	add2 #(.I_WIDTH(WIDTH*2+4), .O_WIDTH(WIDTH*2+5)) add000023(.in0(tmp04[0]), .in1(tmp04[1]), .out(tmp05[0]));
	relu #(.WIDTH(WIDTH*2+$clog2(CIN*F*F))) ReLU(.a(tmp05[0]), .b(21'h0), .sel(tmp05[0][WIDTH*2+$clog2(CIN*F*F)-1]), .out(z));
endmodule

module conv2d_5_L1_N2
	#(parameter WIDTH = 8, F = 5, CIN = 1)
	(x, z);
	input [WIDTH-1:0] x[0:CIN*F*F-1];
	output [WIDTH*2+$clog2(CIN*F*F)-1:0] z;
	wire [WIDTH*2-1+0:0] tmp00[0:24];
	wire [WIDTH*2-1+1:0] tmp01[0:12];
	wire [WIDTH*2-1+2:0] tmp02[0:6];
	wire [WIDTH*2-1+3:0] tmp03[0:3];
	wire [WIDTH*2-1+4:0] tmp04[0:1];
	wire [WIDTH*2-1+5:0] tmp05[0:0];
	booth__016 #(.WIDTH(WIDTH)) mul00(.x(x[0]), .z(tmp00[0]));
	booth__010 #(.WIDTH(WIDTH)) mul01(.x(x[1]), .z(tmp00[1]));
	booth_0024 #(.WIDTH(WIDTH)) mul02(.x(x[2]), .z(tmp00[2]));
	booth_0032 #(.WIDTH(WIDTH)) mul03(.x(x[3]), .z(tmp00[3]));
	booth_0032 #(.WIDTH(WIDTH)) mul04(.x(x[4]), .z(tmp00[4]));
	booth__016 #(.WIDTH(WIDTH)) mul05(.x(x[5]), .z(tmp00[5]));
	booth__032 #(.WIDTH(WIDTH)) mul06(.x(x[6]), .z(tmp00[6]));
	booth_0002 #(.WIDTH(WIDTH)) mul07(.x(x[7]), .z(tmp00[7]));
	booth_0016 #(.WIDTH(WIDTH)) mul08(.x(x[8]), .z(tmp00[8]));
	booth_0000 #(.WIDTH(WIDTH)) mul09(.x(x[9]), .z(tmp00[9]));
	booth__016 #(.WIDTH(WIDTH)) mul10(.x(x[10]), .z(tmp00[10]));
	booth__004 #(.WIDTH(WIDTH)) mul11(.x(x[11]), .z(tmp00[11]));
	booth_0016 #(.WIDTH(WIDTH)) mul12(.x(x[12]), .z(tmp00[12]));
	booth_0032 #(.WIDTH(WIDTH)) mul13(.x(x[13]), .z(tmp00[13]));
	booth_0004 #(.WIDTH(WIDTH)) mul14(.x(x[14]), .z(tmp00[14]));
	booth__024 #(.WIDTH(WIDTH)) mul15(.x(x[15]), .z(tmp00[15]));
	booth__024 #(.WIDTH(WIDTH)) mul16(.x(x[16]), .z(tmp00[16]));
	booth_0024 #(.WIDTH(WIDTH)) mul17(.x(x[17]), .z(tmp00[17]));
	booth_0032 #(.WIDTH(WIDTH)) mul18(.x(x[18]), .z(tmp00[18]));
	booth__024 #(.WIDTH(WIDTH)) mul19(.x(x[19]), .z(tmp00[19]));
	booth__024 #(.WIDTH(WIDTH)) mul20(.x(x[20]), .z(tmp00[20]));
	booth_0016 #(.WIDTH(WIDTH)) mul21(.x(x[21]), .z(tmp00[21]));
	booth_0032 #(.WIDTH(WIDTH)) mul22(.x(x[22]), .z(tmp00[22]));
	booth_0008 #(.WIDTH(WIDTH)) mul23(.x(x[23]), .z(tmp00[23]));
	booth__008 #(.WIDTH(WIDTH)) mul24(.x(x[24]), .z(tmp00[24]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000000(.in0(tmp00[0]), .in1(tmp00[1]), .out(tmp01[0]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000001(.in0(tmp00[2]), .in1(tmp00[3]), .out(tmp01[1]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000002(.in0(tmp00[4]), .in1(tmp00[5]), .out(tmp01[2]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000003(.in0(tmp00[6]), .in1(tmp00[7]), .out(tmp01[3]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000004(.in0(tmp00[8]), .in1(tmp00[9]), .out(tmp01[4]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000005(.in0(tmp00[10]), .in1(tmp00[11]), .out(tmp01[5]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000006(.in0(tmp00[12]), .in1(tmp00[13]), .out(tmp01[6]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000007(.in0(tmp00[14]), .in1(tmp00[15]), .out(tmp01[7]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000008(.in0(tmp00[16]), .in1(tmp00[17]), .out(tmp01[8]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000009(.in0(tmp00[18]), .in1(tmp00[19]), .out(tmp01[9]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000010(.in0(tmp00[20]), .in1(tmp00[21]), .out(tmp01[10]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000011(.in0(tmp00[22]), .in1(tmp00[23]), .out(tmp01[11]));
	assign tmp01[12] = 8'(signed'(tmp00[24][WIDTH-1:1]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000012(.in0(tmp01[0]), .in1(tmp01[1]), .out(tmp02[0]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000013(.in0(tmp01[2]), .in1(tmp01[3]), .out(tmp02[1]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000014(.in0(tmp01[4]), .in1(tmp01[5]), .out(tmp02[2]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000015(.in0(tmp01[6]), .in1(tmp01[7]), .out(tmp02[3]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000016(.in0(tmp01[8]), .in1(tmp01[9]), .out(tmp02[4]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000017(.in0(tmp01[10]), .in1(tmp01[11]), .out(tmp02[5]));
	assign tmp02[6] = 8'(signed'(tmp01[12][WIDTH-1:1]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000018(.in0(tmp02[0]), .in1(tmp02[1]), .out(tmp03[0]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000019(.in0(tmp02[2]), .in1(tmp02[3]), .out(tmp03[1]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000020(.in0(tmp02[4]), .in1(tmp02[5]), .out(tmp03[2]));
	assign tmp03[3] = 8'(signed'(tmp02[6][WIDTH-1:1]));
	add2 #(.I_WIDTH(WIDTH*2+3), .O_WIDTH(WIDTH*2+4)) add000021(.in0(tmp03[0]), .in1(tmp03[1]), .out(tmp04[0]));
	add2 #(.I_WIDTH(WIDTH*2+3), .O_WIDTH(WIDTH*2+4)) add000022(.in0(tmp03[2]), .in1(tmp03[3]), .out(tmp04[1]));
	add2 #(.I_WIDTH(WIDTH*2+4), .O_WIDTH(WIDTH*2+5)) add000023(.in0(tmp04[0]), .in1(tmp04[1]), .out(tmp05[0]));
	relu #(.WIDTH(WIDTH*2+$clog2(CIN*F*F))) ReLU(.a(tmp05[0]), .b(21'h0), .sel(tmp05[0][WIDTH*2+$clog2(CIN*F*F)-1]), .out(z));
endmodule

module conv2d_5_L1_N3
	#(parameter WIDTH = 8, F = 5, CIN = 1)
	(x, z);
	input [WIDTH-1:0] x[0:CIN*F*F-1];
	output [WIDTH*2+$clog2(CIN*F*F)-1:0] z;
	wire [WIDTH*2-1+0:0] tmp00[0:24];
	wire [WIDTH*2-1+1:0] tmp01[0:12];
	wire [WIDTH*2-1+2:0] tmp02[0:6];
	wire [WIDTH*2-1+3:0] tmp03[0:3];
	wire [WIDTH*2-1+4:0] tmp04[0:1];
	wire [WIDTH*2-1+5:0] tmp05[0:0];
	booth__018 #(.WIDTH(WIDTH)) mul00(.x(x[0]), .z(tmp00[0]));
	booth__032 #(.WIDTH(WIDTH)) mul01(.x(x[1]), .z(tmp00[1]));
	booth__032 #(.WIDTH(WIDTH)) mul02(.x(x[2]), .z(tmp00[2]));
	booth__032 #(.WIDTH(WIDTH)) mul03(.x(x[3]), .z(tmp00[3]));
	booth_0002 #(.WIDTH(WIDTH)) mul04(.x(x[4]), .z(tmp00[4]));
	booth__008 #(.WIDTH(WIDTH)) mul05(.x(x[5]), .z(tmp00[5]));
	booth__008 #(.WIDTH(WIDTH)) mul06(.x(x[6]), .z(tmp00[6]));
	booth__032 #(.WIDTH(WIDTH)) mul07(.x(x[7]), .z(tmp00[7]));
	booth__016 #(.WIDTH(WIDTH)) mul08(.x(x[8]), .z(tmp00[8]));
	booth__016 #(.WIDTH(WIDTH)) mul09(.x(x[9]), .z(tmp00[9]));
	booth__028 #(.WIDTH(WIDTH)) mul10(.x(x[10]), .z(tmp00[10]));
	booth_0000 #(.WIDTH(WIDTH)) mul11(.x(x[11]), .z(tmp00[11]));
	booth_0008 #(.WIDTH(WIDTH)) mul12(.x(x[12]), .z(tmp00[12]));
	booth__012 #(.WIDTH(WIDTH)) mul13(.x(x[13]), .z(tmp00[13]));
	booth_0016 #(.WIDTH(WIDTH)) mul14(.x(x[14]), .z(tmp00[14]));
	booth__004 #(.WIDTH(WIDTH)) mul15(.x(x[15]), .z(tmp00[15]));
	booth_0008 #(.WIDTH(WIDTH)) mul16(.x(x[16]), .z(tmp00[16]));
	booth_0018 #(.WIDTH(WIDTH)) mul17(.x(x[17]), .z(tmp00[17]));
	booth_0028 #(.WIDTH(WIDTH)) mul18(.x(x[18]), .z(tmp00[18]));
	booth_0016 #(.WIDTH(WIDTH)) mul19(.x(x[19]), .z(tmp00[19]));
	booth_0032 #(.WIDTH(WIDTH)) mul20(.x(x[20]), .z(tmp00[20]));
	booth_0018 #(.WIDTH(WIDTH)) mul21(.x(x[21]), .z(tmp00[21]));
	booth_0032 #(.WIDTH(WIDTH)) mul22(.x(x[22]), .z(tmp00[22]));
	booth_0032 #(.WIDTH(WIDTH)) mul23(.x(x[23]), .z(tmp00[23]));
	booth_0032 #(.WIDTH(WIDTH)) mul24(.x(x[24]), .z(tmp00[24]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000000(.in0(tmp00[0]), .in1(tmp00[1]), .out(tmp01[0]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000001(.in0(tmp00[2]), .in1(tmp00[3]), .out(tmp01[1]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000002(.in0(tmp00[4]), .in1(tmp00[5]), .out(tmp01[2]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000003(.in0(tmp00[6]), .in1(tmp00[7]), .out(tmp01[3]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000004(.in0(tmp00[8]), .in1(tmp00[9]), .out(tmp01[4]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000005(.in0(tmp00[10]), .in1(tmp00[11]), .out(tmp01[5]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000006(.in0(tmp00[12]), .in1(tmp00[13]), .out(tmp01[6]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000007(.in0(tmp00[14]), .in1(tmp00[15]), .out(tmp01[7]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000008(.in0(tmp00[16]), .in1(tmp00[17]), .out(tmp01[8]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000009(.in0(tmp00[18]), .in1(tmp00[19]), .out(tmp01[9]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000010(.in0(tmp00[20]), .in1(tmp00[21]), .out(tmp01[10]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000011(.in0(tmp00[22]), .in1(tmp00[23]), .out(tmp01[11]));
	assign tmp01[12] = 8'(signed'(tmp00[24][WIDTH-1:1]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000012(.in0(tmp01[0]), .in1(tmp01[1]), .out(tmp02[0]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000013(.in0(tmp01[2]), .in1(tmp01[3]), .out(tmp02[1]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000014(.in0(tmp01[4]), .in1(tmp01[5]), .out(tmp02[2]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000015(.in0(tmp01[6]), .in1(tmp01[7]), .out(tmp02[3]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000016(.in0(tmp01[8]), .in1(tmp01[9]), .out(tmp02[4]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000017(.in0(tmp01[10]), .in1(tmp01[11]), .out(tmp02[5]));
	assign tmp02[6] = 8'(signed'(tmp01[12][WIDTH-1:1]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000018(.in0(tmp02[0]), .in1(tmp02[1]), .out(tmp03[0]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000019(.in0(tmp02[2]), .in1(tmp02[3]), .out(tmp03[1]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000020(.in0(tmp02[4]), .in1(tmp02[5]), .out(tmp03[2]));
	assign tmp03[3] = 8'(signed'(tmp02[6][WIDTH-1:1]));
	add2 #(.I_WIDTH(WIDTH*2+3), .O_WIDTH(WIDTH*2+4)) add000021(.in0(tmp03[0]), .in1(tmp03[1]), .out(tmp04[0]));
	add2 #(.I_WIDTH(WIDTH*2+3), .O_WIDTH(WIDTH*2+4)) add000022(.in0(tmp03[2]), .in1(tmp03[3]), .out(tmp04[1]));
	add2 #(.I_WIDTH(WIDTH*2+4), .O_WIDTH(WIDTH*2+5)) add000023(.in0(tmp04[0]), .in1(tmp04[1]), .out(tmp05[0]));
	relu #(.WIDTH(WIDTH*2+$clog2(CIN*F*F))) ReLU(.a(tmp05[0]), .b(21'h0), .sel(tmp05[0][WIDTH*2+$clog2(CIN*F*F)-1]), .out(z));
endmodule

module conv2d_5_L1_N4
	#(parameter WIDTH = 8, F = 5, CIN = 1)
	(x, z);
	input [WIDTH-1:0] x[0:CIN*F*F-1];
	output [WIDTH*2+$clog2(CIN*F*F)-1:0] z;
	wire [WIDTH*2-1+0:0] tmp00[0:24];
	wire [WIDTH*2-1+1:0] tmp01[0:12];
	wire [WIDTH*2-1+2:0] tmp02[0:6];
	wire [WIDTH*2-1+3:0] tmp03[0:3];
	wire [WIDTH*2-1+4:0] tmp04[0:1];
	wire [WIDTH*2-1+5:0] tmp05[0:0];
	booth_0004 #(.WIDTH(WIDTH)) mul00(.x(x[0]), .z(tmp00[0]));
	booth_0032 #(.WIDTH(WIDTH)) mul01(.x(x[1]), .z(tmp00[1]));
	booth_0012 #(.WIDTH(WIDTH)) mul02(.x(x[2]), .z(tmp00[2]));
	booth__048 #(.WIDTH(WIDTH)) mul03(.x(x[3]), .z(tmp00[3]));
	booth__056 #(.WIDTH(WIDTH)) mul04(.x(x[4]), .z(tmp00[4]));
	booth_0032 #(.WIDTH(WIDTH)) mul05(.x(x[5]), .z(tmp00[5]));
	booth_0048 #(.WIDTH(WIDTH)) mul06(.x(x[6]), .z(tmp00[6]));
	booth_0032 #(.WIDTH(WIDTH)) mul07(.x(x[7]), .z(tmp00[7]));
	booth__032 #(.WIDTH(WIDTH)) mul08(.x(x[8]), .z(tmp00[8]));
	booth__048 #(.WIDTH(WIDTH)) mul09(.x(x[9]), .z(tmp00[9]));
	booth_0032 #(.WIDTH(WIDTH)) mul10(.x(x[10]), .z(tmp00[10]));
	booth_0006 #(.WIDTH(WIDTH)) mul11(.x(x[11]), .z(tmp00[11]));
	booth_0016 #(.WIDTH(WIDTH)) mul12(.x(x[12]), .z(tmp00[12]));
	booth__006 #(.WIDTH(WIDTH)) mul13(.x(x[13]), .z(tmp00[13]));
	booth__032 #(.WIDTH(WIDTH)) mul14(.x(x[14]), .z(tmp00[14]));
	booth_0000 #(.WIDTH(WIDTH)) mul15(.x(x[15]), .z(tmp00[15]));
	booth_0008 #(.WIDTH(WIDTH)) mul16(.x(x[16]), .z(tmp00[16]));
	booth_0032 #(.WIDTH(WIDTH)) mul17(.x(x[17]), .z(tmp00[17]));
	booth_0016 #(.WIDTH(WIDTH)) mul18(.x(x[18]), .z(tmp00[18]));
	booth_0012 #(.WIDTH(WIDTH)) mul19(.x(x[19]), .z(tmp00[19]));
	booth_0012 #(.WIDTH(WIDTH)) mul20(.x(x[20]), .z(tmp00[20]));
	booth_0016 #(.WIDTH(WIDTH)) mul21(.x(x[21]), .z(tmp00[21]));
	booth_0016 #(.WIDTH(WIDTH)) mul22(.x(x[22]), .z(tmp00[22]));
	booth_0016 #(.WIDTH(WIDTH)) mul23(.x(x[23]), .z(tmp00[23]));
	booth__024 #(.WIDTH(WIDTH)) mul24(.x(x[24]), .z(tmp00[24]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000000(.in0(tmp00[0]), .in1(tmp00[1]), .out(tmp01[0]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000001(.in0(tmp00[2]), .in1(tmp00[3]), .out(tmp01[1]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000002(.in0(tmp00[4]), .in1(tmp00[5]), .out(tmp01[2]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000003(.in0(tmp00[6]), .in1(tmp00[7]), .out(tmp01[3]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000004(.in0(tmp00[8]), .in1(tmp00[9]), .out(tmp01[4]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000005(.in0(tmp00[10]), .in1(tmp00[11]), .out(tmp01[5]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000006(.in0(tmp00[12]), .in1(tmp00[13]), .out(tmp01[6]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000007(.in0(tmp00[14]), .in1(tmp00[15]), .out(tmp01[7]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000008(.in0(tmp00[16]), .in1(tmp00[17]), .out(tmp01[8]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000009(.in0(tmp00[18]), .in1(tmp00[19]), .out(tmp01[9]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000010(.in0(tmp00[20]), .in1(tmp00[21]), .out(tmp01[10]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000011(.in0(tmp00[22]), .in1(tmp00[23]), .out(tmp01[11]));
	assign tmp01[12] = 8'(signed'(tmp00[24][WIDTH-1:1]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000012(.in0(tmp01[0]), .in1(tmp01[1]), .out(tmp02[0]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000013(.in0(tmp01[2]), .in1(tmp01[3]), .out(tmp02[1]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000014(.in0(tmp01[4]), .in1(tmp01[5]), .out(tmp02[2]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000015(.in0(tmp01[6]), .in1(tmp01[7]), .out(tmp02[3]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000016(.in0(tmp01[8]), .in1(tmp01[9]), .out(tmp02[4]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000017(.in0(tmp01[10]), .in1(tmp01[11]), .out(tmp02[5]));
	assign tmp02[6] = 8'(signed'(tmp01[12][WIDTH-1:1]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000018(.in0(tmp02[0]), .in1(tmp02[1]), .out(tmp03[0]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000019(.in0(tmp02[2]), .in1(tmp02[3]), .out(tmp03[1]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000020(.in0(tmp02[4]), .in1(tmp02[5]), .out(tmp03[2]));
	assign tmp03[3] = 8'(signed'(tmp02[6][WIDTH-1:1]));
	add2 #(.I_WIDTH(WIDTH*2+3), .O_WIDTH(WIDTH*2+4)) add000021(.in0(tmp03[0]), .in1(tmp03[1]), .out(tmp04[0]));
	add2 #(.I_WIDTH(WIDTH*2+3), .O_WIDTH(WIDTH*2+4)) add000022(.in0(tmp03[2]), .in1(tmp03[3]), .out(tmp04[1]));
	add2 #(.I_WIDTH(WIDTH*2+4), .O_WIDTH(WIDTH*2+5)) add000023(.in0(tmp04[0]), .in1(tmp04[1]), .out(tmp05[0]));
	relu #(.WIDTH(WIDTH*2+$clog2(CIN*F*F))) ReLU(.a(tmp05[0]), .b(21'h0), .sel(tmp05[0][WIDTH*2+$clog2(CIN*F*F)-1]), .out(z));
endmodule

module conv2d_5_L1_N5
	#(parameter WIDTH = 8, F = 5, CIN = 1)
	(x, z);
	input [WIDTH-1:0] x[0:CIN*F*F-1];
	output [WIDTH*2+$clog2(CIN*F*F)-1:0] z;
	wire [WIDTH*2-1+0:0] tmp00[0:24];
	wire [WIDTH*2-1+1:0] tmp01[0:12];
	wire [WIDTH*2-1+2:0] tmp02[0:6];
	wire [WIDTH*2-1+3:0] tmp03[0:3];
	wire [WIDTH*2-1+4:0] tmp04[0:1];
	wire [WIDTH*2-1+5:0] tmp05[0:0];
	booth_0032 #(.WIDTH(WIDTH)) mul00(.x(x[0]), .z(tmp00[0]));
	booth_0034 #(.WIDTH(WIDTH)) mul01(.x(x[1]), .z(tmp00[1]));
	booth_0064 #(.WIDTH(WIDTH)) mul02(.x(x[2]), .z(tmp00[2]));
	booth_0032 #(.WIDTH(WIDTH)) mul03(.x(x[3]), .z(tmp00[3]));
	booth_0064 #(.WIDTH(WIDTH)) mul04(.x(x[4]), .z(tmp00[4]));
	booth_0000 #(.WIDTH(WIDTH)) mul05(.x(x[5]), .z(tmp00[5]));
	booth_0018 #(.WIDTH(WIDTH)) mul06(.x(x[6]), .z(tmp00[6]));
	booth_0032 #(.WIDTH(WIDTH)) mul07(.x(x[7]), .z(tmp00[7]));
	booth_0048 #(.WIDTH(WIDTH)) mul08(.x(x[8]), .z(tmp00[8]));
	booth_0064 #(.WIDTH(WIDTH)) mul09(.x(x[9]), .z(tmp00[9]));
	booth__032 #(.WIDTH(WIDTH)) mul10(.x(x[10]), .z(tmp00[10]));
	booth__006 #(.WIDTH(WIDTH)) mul11(.x(x[11]), .z(tmp00[11]));
	booth__020 #(.WIDTH(WIDTH)) mul12(.x(x[12]), .z(tmp00[12]));
	booth__032 #(.WIDTH(WIDTH)) mul13(.x(x[13]), .z(tmp00[13]));
	booth__012 #(.WIDTH(WIDTH)) mul14(.x(x[14]), .z(tmp00[14]));
	booth__024 #(.WIDTH(WIDTH)) mul15(.x(x[15]), .z(tmp00[15]));
	booth__044 #(.WIDTH(WIDTH)) mul16(.x(x[16]), .z(tmp00[16]));
	booth__036 #(.WIDTH(WIDTH)) mul17(.x(x[17]), .z(tmp00[17]));
	booth__038 #(.WIDTH(WIDTH)) mul18(.x(x[18]), .z(tmp00[18]));
	booth__036 #(.WIDTH(WIDTH)) mul19(.x(x[19]), .z(tmp00[19]));
	booth__046 #(.WIDTH(WIDTH)) mul20(.x(x[20]), .z(tmp00[20]));
	booth__030 #(.WIDTH(WIDTH)) mul21(.x(x[21]), .z(tmp00[21]));
	booth__060 #(.WIDTH(WIDTH)) mul22(.x(x[22]), .z(tmp00[22]));
	booth__052 #(.WIDTH(WIDTH)) mul23(.x(x[23]), .z(tmp00[23]));
	booth__048 #(.WIDTH(WIDTH)) mul24(.x(x[24]), .z(tmp00[24]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000000(.in0(tmp00[0]), .in1(tmp00[1]), .out(tmp01[0]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000001(.in0(tmp00[2]), .in1(tmp00[3]), .out(tmp01[1]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000002(.in0(tmp00[4]), .in1(tmp00[5]), .out(tmp01[2]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000003(.in0(tmp00[6]), .in1(tmp00[7]), .out(tmp01[3]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000004(.in0(tmp00[8]), .in1(tmp00[9]), .out(tmp01[4]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000005(.in0(tmp00[10]), .in1(tmp00[11]), .out(tmp01[5]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000006(.in0(tmp00[12]), .in1(tmp00[13]), .out(tmp01[6]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000007(.in0(tmp00[14]), .in1(tmp00[15]), .out(tmp01[7]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000008(.in0(tmp00[16]), .in1(tmp00[17]), .out(tmp01[8]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000009(.in0(tmp00[18]), .in1(tmp00[19]), .out(tmp01[9]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000010(.in0(tmp00[20]), .in1(tmp00[21]), .out(tmp01[10]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000011(.in0(tmp00[22]), .in1(tmp00[23]), .out(tmp01[11]));
	assign tmp01[12] = 8'(signed'(tmp00[24][WIDTH-1:1]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000012(.in0(tmp01[0]), .in1(tmp01[1]), .out(tmp02[0]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000013(.in0(tmp01[2]), .in1(tmp01[3]), .out(tmp02[1]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000014(.in0(tmp01[4]), .in1(tmp01[5]), .out(tmp02[2]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000015(.in0(tmp01[6]), .in1(tmp01[7]), .out(tmp02[3]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000016(.in0(tmp01[8]), .in1(tmp01[9]), .out(tmp02[4]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000017(.in0(tmp01[10]), .in1(tmp01[11]), .out(tmp02[5]));
	assign tmp02[6] = 8'(signed'(tmp01[12][WIDTH-1:1]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000018(.in0(tmp02[0]), .in1(tmp02[1]), .out(tmp03[0]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000019(.in0(tmp02[2]), .in1(tmp02[3]), .out(tmp03[1]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000020(.in0(tmp02[4]), .in1(tmp02[5]), .out(tmp03[2]));
	assign tmp03[3] = 8'(signed'(tmp02[6][WIDTH-1:1]));
	add2 #(.I_WIDTH(WIDTH*2+3), .O_WIDTH(WIDTH*2+4)) add000021(.in0(tmp03[0]), .in1(tmp03[1]), .out(tmp04[0]));
	add2 #(.I_WIDTH(WIDTH*2+3), .O_WIDTH(WIDTH*2+4)) add000022(.in0(tmp03[2]), .in1(tmp03[3]), .out(tmp04[1]));
	add2 #(.I_WIDTH(WIDTH*2+4), .O_WIDTH(WIDTH*2+5)) add000023(.in0(tmp04[0]), .in1(tmp04[1]), .out(tmp05[0]));
	relu #(.WIDTH(WIDTH*2+$clog2(CIN*F*F))) ReLU(.a(tmp05[0]), .b(21'h0), .sel(tmp05[0][WIDTH*2+$clog2(CIN*F*F)-1]), .out(z));
endmodule

