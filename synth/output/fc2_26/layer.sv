module layer
	#(parameter WIDTH = 8)
	(x, z);
	localparam IN = 128;
	input [WIDTH-1:0] x[0:IN-1];
	output [WIDTH*2+$clog2(49)-1:0] z;
	wire [WIDTH*2-1+0:0] tmp00[0:48];
	wire [WIDTH*2-1+1:0] tmp01[0:24];
	wire [WIDTH*2-1+2:0] tmp02[0:12];
	wire [WIDTH*2-1+3:0] tmp03[0:6];
	wire [WIDTH*2-1+4:0] tmp04[0:3];
	wire [WIDTH*2-1+5:0] tmp05[0:1];
	wire [WIDTH*2-1+6:0] tmp06[0:0];
	booth__004 #(.WIDTH(WIDTH)) mul00(.x(x[0]), .z(tmp00[0]));
	booth__004 #(.WIDTH(WIDTH)) mul01(.x(x[1]), .z(tmp00[1]));
	booth_0002 #(.WIDTH(WIDTH)) mul02(.x(x[2]), .z(tmp00[2]));
	booth_0021 #(.WIDTH(WIDTH)) mul03(.x(x[5]), .z(tmp00[3]));
	booth_0005 #(.WIDTH(WIDTH)) mul04(.x(x[7]), .z(tmp00[4]));
	booth_0002 #(.WIDTH(WIDTH)) mul05(.x(x[9]), .z(tmp00[5]));
	booth__006 #(.WIDTH(WIDTH)) mul06(.x(x[11]), .z(tmp00[6]));
	booth__012 #(.WIDTH(WIDTH)) mul07(.x(x[18]), .z(tmp00[7]));
	booth_0008 #(.WIDTH(WIDTH)) mul08(.x(x[19]), .z(tmp00[8]));
	booth__006 #(.WIDTH(WIDTH)) mul09(.x(x[23]), .z(tmp00[9]));
	booth_0012 #(.WIDTH(WIDTH)) mul10(.x(x[24]), .z(tmp00[10]));
	booth__004 #(.WIDTH(WIDTH)) mul11(.x(x[26]), .z(tmp00[11]));
	booth__008 #(.WIDTH(WIDTH)) mul12(.x(x[33]), .z(tmp00[12]));
	booth__002 #(.WIDTH(WIDTH)) mul13(.x(x[35]), .z(tmp00[13]));
	booth_0020 #(.WIDTH(WIDTH)) mul14(.x(x[37]), .z(tmp00[14]));
	booth_0004 #(.WIDTH(WIDTH)) mul15(.x(x[38]), .z(tmp00[15]));
	booth__008 #(.WIDTH(WIDTH)) mul16(.x(x[39]), .z(tmp00[16]));
	booth__004 #(.WIDTH(WIDTH)) mul17(.x(x[40]), .z(tmp00[17]));
	booth__008 #(.WIDTH(WIDTH)) mul18(.x(x[43]), .z(tmp00[18]));
	booth_0016 #(.WIDTH(WIDTH)) mul19(.x(x[44]), .z(tmp00[19]));
	booth__008 #(.WIDTH(WIDTH)) mul20(.x(x[46]), .z(tmp00[20]));
	booth__004 #(.WIDTH(WIDTH)) mul21(.x(x[48]), .z(tmp00[21]));
	booth_0010 #(.WIDTH(WIDTH)) mul22(.x(x[49]), .z(tmp00[22]));
	booth__008 #(.WIDTH(WIDTH)) mul23(.x(x[51]), .z(tmp00[23]));
	booth__012 #(.WIDTH(WIDTH)) mul24(.x(x[52]), .z(tmp00[24]));
	booth__012 #(.WIDTH(WIDTH)) mul25(.x(x[56]), .z(tmp00[25]));
	booth__010 #(.WIDTH(WIDTH)) mul26(.x(x[58]), .z(tmp00[26]));
	booth__010 #(.WIDTH(WIDTH)) mul27(.x(x[60]), .z(tmp00[27]));
	booth__008 #(.WIDTH(WIDTH)) mul28(.x(x[61]), .z(tmp00[28]));
	booth_0005 #(.WIDTH(WIDTH)) mul29(.x(x[62]), .z(tmp00[29]));
	booth_0002 #(.WIDTH(WIDTH)) mul30(.x(x[65]), .z(tmp00[30]));
	booth__006 #(.WIDTH(WIDTH)) mul31(.x(x[68]), .z(tmp00[31]));
	booth_0012 #(.WIDTH(WIDTH)) mul32(.x(x[71]), .z(tmp00[32]));
	booth__008 #(.WIDTH(WIDTH)) mul33(.x(x[76]), .z(tmp00[33]));
	booth_0002 #(.WIDTH(WIDTH)) mul34(.x(x[80]), .z(tmp00[34]));
	booth__004 #(.WIDTH(WIDTH)) mul35(.x(x[84]), .z(tmp00[35]));
	booth__010 #(.WIDTH(WIDTH)) mul36(.x(x[86]), .z(tmp00[36]));
	booth_0005 #(.WIDTH(WIDTH)) mul37(.x(x[87]), .z(tmp00[37]));
	booth__012 #(.WIDTH(WIDTH)) mul38(.x(x[89]), .z(tmp00[38]));
	booth_0002 #(.WIDTH(WIDTH)) mul39(.x(x[92]), .z(tmp00[39]));
	booth__016 #(.WIDTH(WIDTH)) mul40(.x(x[97]), .z(tmp00[40]));
	booth__002 #(.WIDTH(WIDTH)) mul41(.x(x[100]), .z(tmp00[41]));
	booth__016 #(.WIDTH(WIDTH)) mul42(.x(x[106]), .z(tmp00[42]));
	booth__012 #(.WIDTH(WIDTH)) mul43(.x(x[114]), .z(tmp00[43]));
	booth_0005 #(.WIDTH(WIDTH)) mul44(.x(x[116]), .z(tmp00[44]));
	booth__012 #(.WIDTH(WIDTH)) mul45(.x(x[119]), .z(tmp00[45]));
	booth_0010 #(.WIDTH(WIDTH)) mul46(.x(x[120]), .z(tmp00[46]));
	booth__012 #(.WIDTH(WIDTH)) mul47(.x(x[124]), .z(tmp00[47]));
	booth_0012 #(.WIDTH(WIDTH)) mul48(.x(x[127]), .z(tmp00[48]));
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
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000012(.in0(tmp00[24]), .in1(tmp00[25]), .out(tmp01[12]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000013(.in0(tmp00[26]), .in1(tmp00[27]), .out(tmp01[13]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000014(.in0(tmp00[28]), .in1(tmp00[29]), .out(tmp01[14]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000015(.in0(tmp00[30]), .in1(tmp00[31]), .out(tmp01[15]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000016(.in0(tmp00[32]), .in1(tmp00[33]), .out(tmp01[16]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000017(.in0(tmp00[34]), .in1(tmp00[35]), .out(tmp01[17]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000018(.in0(tmp00[36]), .in1(tmp00[37]), .out(tmp01[18]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000019(.in0(tmp00[38]), .in1(tmp00[39]), .out(tmp01[19]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000020(.in0(tmp00[40]), .in1(tmp00[41]), .out(tmp01[20]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000021(.in0(tmp00[42]), .in1(tmp00[43]), .out(tmp01[21]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000022(.in0(tmp00[44]), .in1(tmp00[45]), .out(tmp01[22]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000023(.in0(tmp00[46]), .in1(tmp00[47]), .out(tmp01[23]));
	assign tmp01[24] = $signed(tmp00[48]);
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000024(.in0(tmp01[0]), .in1(tmp01[1]), .out(tmp02[0]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000025(.in0(tmp01[2]), .in1(tmp01[3]), .out(tmp02[1]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000026(.in0(tmp01[4]), .in1(tmp01[5]), .out(tmp02[2]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000027(.in0(tmp01[6]), .in1(tmp01[7]), .out(tmp02[3]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000028(.in0(tmp01[8]), .in1(tmp01[9]), .out(tmp02[4]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000029(.in0(tmp01[10]), .in1(tmp01[11]), .out(tmp02[5]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000030(.in0(tmp01[12]), .in1(tmp01[13]), .out(tmp02[6]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000031(.in0(tmp01[14]), .in1(tmp01[15]), .out(tmp02[7]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000032(.in0(tmp01[16]), .in1(tmp01[17]), .out(tmp02[8]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000033(.in0(tmp01[18]), .in1(tmp01[19]), .out(tmp02[9]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000034(.in0(tmp01[20]), .in1(tmp01[21]), .out(tmp02[10]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000035(.in0(tmp01[22]), .in1(tmp01[23]), .out(tmp02[11]));
	assign tmp02[12] = $signed(tmp01[24]);
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000036(.in0(tmp02[0]), .in1(tmp02[1]), .out(tmp03[0]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000037(.in0(tmp02[2]), .in1(tmp02[3]), .out(tmp03[1]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000038(.in0(tmp02[4]), .in1(tmp02[5]), .out(tmp03[2]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000039(.in0(tmp02[6]), .in1(tmp02[7]), .out(tmp03[3]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000040(.in0(tmp02[8]), .in1(tmp02[9]), .out(tmp03[4]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000041(.in0(tmp02[10]), .in1(tmp02[11]), .out(tmp03[5]));
	assign tmp03[6] = $signed(tmp02[12]);
	add2 #(.I_WIDTH(WIDTH*2+3), .O_WIDTH(WIDTH*2+4)) add000042(.in0(tmp03[0]), .in1(tmp03[1]), .out(tmp04[0]));
	add2 #(.I_WIDTH(WIDTH*2+3), .O_WIDTH(WIDTH*2+4)) add000043(.in0(tmp03[2]), .in1(tmp03[3]), .out(tmp04[1]));
	add2 #(.I_WIDTH(WIDTH*2+3), .O_WIDTH(WIDTH*2+4)) add000044(.in0(tmp03[4]), .in1(tmp03[5]), .out(tmp04[2]));
	assign tmp04[3] = $signed(tmp03[6]);
	add2 #(.I_WIDTH(WIDTH*2+4), .O_WIDTH(WIDTH*2+5)) add000045(.in0(tmp04[0]), .in1(tmp04[1]), .out(tmp05[0]));
	add2 #(.I_WIDTH(WIDTH*2+4), .O_WIDTH(WIDTH*2+5)) add000046(.in0(tmp04[2]), .in1(tmp04[3]), .out(tmp05[1]));
	add2 #(.I_WIDTH(WIDTH*2+5), .O_WIDTH(WIDTH*2+6)) add000047(.in0(tmp05[0]), .in1(tmp05[1]), .out(tmp06[0]));
	relu #(.WIDTH(WIDTH*2+$clog2(IN))) ReLU(.a(tmp06[0]), .b(22'h0), .sel(tmp06[0][WIDTH*2+$clog2(IN)-1]), .out(z));
endmodule

