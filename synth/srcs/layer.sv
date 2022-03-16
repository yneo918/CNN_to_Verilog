module layer
	#(parameter WIDTH = 8)
	(x, z);
	localparam IN = 84;
	input [WIDTH-1:0] x[0:IN-1];
	output [WIDTH*2+$clog2(58)-1:0] z;
	wire [WIDTH*2-1+0:0] tmp00[0:57];
	wire [WIDTH*2-1+1:0] tmp01[0:28];
	wire [WIDTH*2-1+2:0] tmp02[0:14];
	wire [WIDTH*2-1+3:0] tmp03[0:7];
	wire [WIDTH*2-1+4:0] tmp04[0:3];
	wire [WIDTH*2-1+5:0] tmp05[0:1];
	wire [WIDTH*2-1+6:0] tmp06[0:0];
	booth__016 #(.WIDTH(WIDTH)) mul00(.x(x[1]), .z(tmp00[0]));
	booth_0020 #(.WIDTH(WIDTH)) mul01(.x(x[2]), .z(tmp00[1]));
	booth_0040 #(.WIDTH(WIDTH)) mul02(.x(x[3]), .z(tmp00[2]));
	booth_0020 #(.WIDTH(WIDTH)) mul03(.x(x[4]), .z(tmp00[3]));
	booth_0016 #(.WIDTH(WIDTH)) mul04(.x(x[5]), .z(tmp00[4]));
	booth_0032 #(.WIDTH(WIDTH)) mul05(.x(x[8]), .z(tmp00[5]));
	booth__008 #(.WIDTH(WIDTH)) mul06(.x(x[10]), .z(tmp00[6]));
	booth__012 #(.WIDTH(WIDTH)) mul07(.x(x[11]), .z(tmp00[7]));
	booth_0042 #(.WIDTH(WIDTH)) mul08(.x(x[12]), .z(tmp00[8]));
	booth_0016 #(.WIDTH(WIDTH)) mul09(.x(x[14]), .z(tmp00[9]));
	booth__016 #(.WIDTH(WIDTH)) mul10(.x(x[17]), .z(tmp00[10]));
	booth_0008 #(.WIDTH(WIDTH)) mul11(.x(x[18]), .z(tmp00[11]));
	booth_0040 #(.WIDTH(WIDTH)) mul12(.x(x[19]), .z(tmp00[12]));
	booth__004 #(.WIDTH(WIDTH)) mul13(.x(x[21]), .z(tmp00[13]));
	booth__008 #(.WIDTH(WIDTH)) mul14(.x(x[22]), .z(tmp00[14]));
	booth__008 #(.WIDTH(WIDTH)) mul15(.x(x[23]), .z(tmp00[15]));
	booth_0036 #(.WIDTH(WIDTH)) mul16(.x(x[24]), .z(tmp00[16]));
	booth_0004 #(.WIDTH(WIDTH)) mul17(.x(x[25]), .z(tmp00[17]));
	booth_0036 #(.WIDTH(WIDTH)) mul18(.x(x[26]), .z(tmp00[18]));
	booth_0040 #(.WIDTH(WIDTH)) mul19(.x(x[27]), .z(tmp00[19]));
	booth_0042 #(.WIDTH(WIDTH)) mul20(.x(x[28]), .z(tmp00[20]));
	booth__004 #(.WIDTH(WIDTH)) mul21(.x(x[29]), .z(tmp00[21]));
	booth_0032 #(.WIDTH(WIDTH)) mul22(.x(x[31]), .z(tmp00[22]));
	booth_0036 #(.WIDTH(WIDTH)) mul23(.x(x[32]), .z(tmp00[23]));
	booth__012 #(.WIDTH(WIDTH)) mul24(.x(x[33]), .z(tmp00[24]));
	booth_0028 #(.WIDTH(WIDTH)) mul25(.x(x[36]), .z(tmp00[25]));
	booth_0032 #(.WIDTH(WIDTH)) mul26(.x(x[37]), .z(tmp00[26]));
	booth__008 #(.WIDTH(WIDTH)) mul27(.x(x[38]), .z(tmp00[27]));
	booth_0024 #(.WIDTH(WIDTH)) mul28(.x(x[39]), .z(tmp00[28]));
	booth_0032 #(.WIDTH(WIDTH)) mul29(.x(x[40]), .z(tmp00[29]));
	booth_0044 #(.WIDTH(WIDTH)) mul30(.x(x[42]), .z(tmp00[30]));
	booth__008 #(.WIDTH(WIDTH)) mul31(.x(x[43]), .z(tmp00[31]));
	booth_0016 #(.WIDTH(WIDTH)) mul32(.x(x[44]), .z(tmp00[32]));
	booth__004 #(.WIDTH(WIDTH)) mul33(.x(x[45]), .z(tmp00[33]));
	booth_0024 #(.WIDTH(WIDTH)) mul34(.x(x[46]), .z(tmp00[34]));
	booth__008 #(.WIDTH(WIDTH)) mul35(.x(x[47]), .z(tmp00[35]));
	booth__004 #(.WIDTH(WIDTH)) mul36(.x(x[48]), .z(tmp00[36]));
	booth__004 #(.WIDTH(WIDTH)) mul37(.x(x[49]), .z(tmp00[37]));
	booth__004 #(.WIDTH(WIDTH)) mul38(.x(x[51]), .z(tmp00[38]));
	booth_0032 #(.WIDTH(WIDTH)) mul39(.x(x[52]), .z(tmp00[39]));
	booth_0052 #(.WIDTH(WIDTH)) mul40(.x(x[53]), .z(tmp00[40]));
	booth__016 #(.WIDTH(WIDTH)) mul41(.x(x[55]), .z(tmp00[41]));
	booth__004 #(.WIDTH(WIDTH)) mul42(.x(x[57]), .z(tmp00[42]));
	booth_0032 #(.WIDTH(WIDTH)) mul43(.x(x[59]), .z(tmp00[43]));
	booth_0032 #(.WIDTH(WIDTH)) mul44(.x(x[60]), .z(tmp00[44]));
	booth__008 #(.WIDTH(WIDTH)) mul45(.x(x[63]), .z(tmp00[45]));
	booth__004 #(.WIDTH(WIDTH)) mul46(.x(x[64]), .z(tmp00[46]));
	booth__008 #(.WIDTH(WIDTH)) mul47(.x(x[66]), .z(tmp00[47]));
	booth__004 #(.WIDTH(WIDTH)) mul48(.x(x[67]), .z(tmp00[48]));
	booth__008 #(.WIDTH(WIDTH)) mul49(.x(x[71]), .z(tmp00[49]));
	booth__004 #(.WIDTH(WIDTH)) mul50(.x(x[72]), .z(tmp00[50]));
	booth_0010 #(.WIDTH(WIDTH)) mul51(.x(x[74]), .z(tmp00[51]));
	booth_0040 #(.WIDTH(WIDTH)) mul52(.x(x[75]), .z(tmp00[52]));
	booth__016 #(.WIDTH(WIDTH)) mul53(.x(x[77]), .z(tmp00[53]));
	booth__016 #(.WIDTH(WIDTH)) mul54(.x(x[79]), .z(tmp00[54]));
	booth_0028 #(.WIDTH(WIDTH)) mul55(.x(x[80]), .z(tmp00[55]));
	booth_0016 #(.WIDTH(WIDTH)) mul56(.x(x[82]), .z(tmp00[56]));
	booth_0008 #(.WIDTH(WIDTH)) mul57(.x(x[83]), .z(tmp00[57]));
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
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000024(.in0(tmp00[48]), .in1(tmp00[49]), .out(tmp01[24]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000025(.in0(tmp00[50]), .in1(tmp00[51]), .out(tmp01[25]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000026(.in0(tmp00[52]), .in1(tmp00[53]), .out(tmp01[26]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000027(.in0(tmp00[54]), .in1(tmp00[55]), .out(tmp01[27]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000028(.in0(tmp00[56]), .in1(tmp00[57]), .out(tmp01[28]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000029(.in0(tmp01[0]), .in1(tmp01[1]), .out(tmp02[0]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000030(.in0(tmp01[2]), .in1(tmp01[3]), .out(tmp02[1]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000031(.in0(tmp01[4]), .in1(tmp01[5]), .out(tmp02[2]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000032(.in0(tmp01[6]), .in1(tmp01[7]), .out(tmp02[3]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000033(.in0(tmp01[8]), .in1(tmp01[9]), .out(tmp02[4]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000034(.in0(tmp01[10]), .in1(tmp01[11]), .out(tmp02[5]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000035(.in0(tmp01[12]), .in1(tmp01[13]), .out(tmp02[6]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000036(.in0(tmp01[14]), .in1(tmp01[15]), .out(tmp02[7]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000037(.in0(tmp01[16]), .in1(tmp01[17]), .out(tmp02[8]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000038(.in0(tmp01[18]), .in1(tmp01[19]), .out(tmp02[9]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000039(.in0(tmp01[20]), .in1(tmp01[21]), .out(tmp02[10]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000040(.in0(tmp01[22]), .in1(tmp01[23]), .out(tmp02[11]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000041(.in0(tmp01[24]), .in1(tmp01[25]), .out(tmp02[12]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000042(.in0(tmp01[26]), .in1(tmp01[27]), .out(tmp02[13]));
	assign tmp02[14] = $signed(tmp01[28]);
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000043(.in0(tmp02[0]), .in1(tmp02[1]), .out(tmp03[0]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000044(.in0(tmp02[2]), .in1(tmp02[3]), .out(tmp03[1]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000045(.in0(tmp02[4]), .in1(tmp02[5]), .out(tmp03[2]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000046(.in0(tmp02[6]), .in1(tmp02[7]), .out(tmp03[3]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000047(.in0(tmp02[8]), .in1(tmp02[9]), .out(tmp03[4]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000048(.in0(tmp02[10]), .in1(tmp02[11]), .out(tmp03[5]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000049(.in0(tmp02[12]), .in1(tmp02[13]), .out(tmp03[6]));
	assign tmp03[7] = $signed(tmp02[14]);
	add2 #(.I_WIDTH(WIDTH*2+3), .O_WIDTH(WIDTH*2+4)) add000050(.in0(tmp03[0]), .in1(tmp03[1]), .out(tmp04[0]));
	add2 #(.I_WIDTH(WIDTH*2+3), .O_WIDTH(WIDTH*2+4)) add000051(.in0(tmp03[2]), .in1(tmp03[3]), .out(tmp04[1]));
	add2 #(.I_WIDTH(WIDTH*2+3), .O_WIDTH(WIDTH*2+4)) add000052(.in0(tmp03[4]), .in1(tmp03[5]), .out(tmp04[2]));
	add2 #(.I_WIDTH(WIDTH*2+3), .O_WIDTH(WIDTH*2+4)) add000053(.in0(tmp03[6]), .in1(tmp03[7]), .out(tmp04[3]));
	add2 #(.I_WIDTH(WIDTH*2+4), .O_WIDTH(WIDTH*2+5)) add000054(.in0(tmp04[0]), .in1(tmp04[1]), .out(tmp05[0]));
	add2 #(.I_WIDTH(WIDTH*2+4), .O_WIDTH(WIDTH*2+5)) add000055(.in0(tmp04[2]), .in1(tmp04[3]), .out(tmp05[1]));
	add2 #(.I_WIDTH(WIDTH*2+5), .O_WIDTH(WIDTH*2+6)) add000056(.in0(tmp05[0]), .in1(tmp05[1]), .out(tmp06[0]));
	relu #(.WIDTH(WIDTH*2+$clog2(IN))) ReLU(.a(tmp06[0]), .b(22'h0), .sel(tmp06[0][WIDTH*2+$clog2(IN)-1]), .out(z));
endmodule

