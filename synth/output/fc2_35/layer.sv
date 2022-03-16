module layer
	#(parameter WIDTH = 8)
	(x, z);
	localparam IN = 128;
	input [WIDTH-1:0] x[0:IN-1];
	output [WIDTH*2+$clog2(69)-1:0] z;
	wire [WIDTH*2-1+0:0] tmp00[0:68];
	wire [WIDTH*2-1+1:0] tmp01[0:34];
	wire [WIDTH*2-1+2:0] tmp02[0:17];
	wire [WIDTH*2-1+3:0] tmp03[0:8];
	wire [WIDTH*2-1+4:0] tmp04[0:4];
	wire [WIDTH*2-1+5:0] tmp05[0:2];
	wire [WIDTH*2-1+6:0] tmp06[0:1];
	wire [WIDTH*2-1+7:0] tmp07[0:0];
	booth__010 #(.WIDTH(WIDTH)) mul00(.x(x[0]), .z(tmp00[0]));
	booth__008 #(.WIDTH(WIDTH)) mul01(.x(x[1]), .z(tmp00[1]));
	booth__014 #(.WIDTH(WIDTH)) mul02(.x(x[5]), .z(tmp00[2]));
	booth__002 #(.WIDTH(WIDTH)) mul03(.x(x[7]), .z(tmp00[3]));
	booth_0026 #(.WIDTH(WIDTH)) mul04(.x(x[8]), .z(tmp00[4]));
	booth__006 #(.WIDTH(WIDTH)) mul05(.x(x[9]), .z(tmp00[5]));
	booth_0008 #(.WIDTH(WIDTH)) mul06(.x(x[10]), .z(tmp00[6]));
	booth_0028 #(.WIDTH(WIDTH)) mul07(.x(x[12]), .z(tmp00[7]));
	booth__020 #(.WIDTH(WIDTH)) mul08(.x(x[17]), .z(tmp00[8]));
	booth__012 #(.WIDTH(WIDTH)) mul09(.x(x[20]), .z(tmp00[9]));
	booth_0004 #(.WIDTH(WIDTH)) mul10(.x(x[22]), .z(tmp00[10]));
	booth__012 #(.WIDTH(WIDTH)) mul11(.x(x[25]), .z(tmp00[11]));
	booth_0008 #(.WIDTH(WIDTH)) mul12(.x(x[27]), .z(tmp00[12]));
	booth_0021 #(.WIDTH(WIDTH)) mul13(.x(x[29]), .z(tmp00[13]));
	booth_0016 #(.WIDTH(WIDTH)) mul14(.x(x[30]), .z(tmp00[14]));
	booth_0014 #(.WIDTH(WIDTH)) mul15(.x(x[31]), .z(tmp00[15]));
	booth__016 #(.WIDTH(WIDTH)) mul16(.x(x[32]), .z(tmp00[16]));
	booth__016 #(.WIDTH(WIDTH)) mul17(.x(x[33]), .z(tmp00[17]));
	booth__010 #(.WIDTH(WIDTH)) mul18(.x(x[35]), .z(tmp00[18]));
	booth__006 #(.WIDTH(WIDTH)) mul19(.x(x[37]), .z(tmp00[19]));
	booth__004 #(.WIDTH(WIDTH)) mul20(.x(x[39]), .z(tmp00[20]));
	booth__016 #(.WIDTH(WIDTH)) mul21(.x(x[44]), .z(tmp00[21]));
	booth_0004 #(.WIDTH(WIDTH)) mul22(.x(x[46]), .z(tmp00[22]));
	booth__016 #(.WIDTH(WIDTH)) mul23(.x(x[48]), .z(tmp00[23]));
	booth__012 #(.WIDTH(WIDTH)) mul24(.x(x[49]), .z(tmp00[24]));
	booth__010 #(.WIDTH(WIDTH)) mul25(.x(x[50]), .z(tmp00[25]));
	booth_0010 #(.WIDTH(WIDTH)) mul26(.x(x[51]), .z(tmp00[26]));
	booth_0006 #(.WIDTH(WIDTH)) mul27(.x(x[52]), .z(tmp00[27]));
	booth__012 #(.WIDTH(WIDTH)) mul28(.x(x[55]), .z(tmp00[28]));
	booth_0004 #(.WIDTH(WIDTH)) mul29(.x(x[56]), .z(tmp00[29]));
	booth__008 #(.WIDTH(WIDTH)) mul30(.x(x[58]), .z(tmp00[30]));
	booth__004 #(.WIDTH(WIDTH)) mul31(.x(x[60]), .z(tmp00[31]));
	booth_0006 #(.WIDTH(WIDTH)) mul32(.x(x[61]), .z(tmp00[32]));
	booth__004 #(.WIDTH(WIDTH)) mul33(.x(x[63]), .z(tmp00[33]));
	booth__010 #(.WIDTH(WIDTH)) mul34(.x(x[64]), .z(tmp00[34]));
	booth__010 #(.WIDTH(WIDTH)) mul35(.x(x[65]), .z(tmp00[35]));
	booth_0008 #(.WIDTH(WIDTH)) mul36(.x(x[66]), .z(tmp00[36]));
	booth_0012 #(.WIDTH(WIDTH)) mul37(.x(x[67]), .z(tmp00[37]));
	booth__008 #(.WIDTH(WIDTH)) mul38(.x(x[69]), .z(tmp00[38]));
	booth__014 #(.WIDTH(WIDTH)) mul39(.x(x[71]), .z(tmp00[39]));
	booth_0008 #(.WIDTH(WIDTH)) mul40(.x(x[75]), .z(tmp00[40]));
	booth_0010 #(.WIDTH(WIDTH)) mul41(.x(x[76]), .z(tmp00[41]));
	booth_0010 #(.WIDTH(WIDTH)) mul42(.x(x[77]), .z(tmp00[42]));
	booth__010 #(.WIDTH(WIDTH)) mul43(.x(x[78]), .z(tmp00[43]));
	booth_0008 #(.WIDTH(WIDTH)) mul44(.x(x[79]), .z(tmp00[44]));
	booth_0008 #(.WIDTH(WIDTH)) mul45(.x(x[83]), .z(tmp00[45]));
	booth_0004 #(.WIDTH(WIDTH)) mul46(.x(x[84]), .z(tmp00[46]));
	booth_0020 #(.WIDTH(WIDTH)) mul47(.x(x[85]), .z(tmp00[47]));
	booth__006 #(.WIDTH(WIDTH)) mul48(.x(x[87]), .z(tmp00[48]));
	booth_0012 #(.WIDTH(WIDTH)) mul49(.x(x[88]), .z(tmp00[49]));
	booth__016 #(.WIDTH(WIDTH)) mul50(.x(x[91]), .z(tmp00[50]));
	booth_0028 #(.WIDTH(WIDTH)) mul51(.x(x[92]), .z(tmp00[51]));
	booth__016 #(.WIDTH(WIDTH)) mul52(.x(x[93]), .z(tmp00[52]));
	booth__006 #(.WIDTH(WIDTH)) mul53(.x(x[95]), .z(tmp00[53]));
	booth__008 #(.WIDTH(WIDTH)) mul54(.x(x[101]), .z(tmp00[54]));
	booth_0012 #(.WIDTH(WIDTH)) mul55(.x(x[105]), .z(tmp00[55]));
	booth__010 #(.WIDTH(WIDTH)) mul56(.x(x[107]), .z(tmp00[56]));
	booth__008 #(.WIDTH(WIDTH)) mul57(.x(x[108]), .z(tmp00[57]));
	booth_0004 #(.WIDTH(WIDTH)) mul58(.x(x[109]), .z(tmp00[58]));
	booth_0012 #(.WIDTH(WIDTH)) mul59(.x(x[110]), .z(tmp00[59]));
	booth__006 #(.WIDTH(WIDTH)) mul60(.x(x[116]), .z(tmp00[60]));
	booth__012 #(.WIDTH(WIDTH)) mul61(.x(x[117]), .z(tmp00[61]));
	booth__004 #(.WIDTH(WIDTH)) mul62(.x(x[118]), .z(tmp00[62]));
	booth_0020 #(.WIDTH(WIDTH)) mul63(.x(x[120]), .z(tmp00[63]));
	booth__008 #(.WIDTH(WIDTH)) mul64(.x(x[122]), .z(tmp00[64]));
	booth_0020 #(.WIDTH(WIDTH)) mul65(.x(x[123]), .z(tmp00[65]));
	booth_0032 #(.WIDTH(WIDTH)) mul66(.x(x[124]), .z(tmp00[66]));
	booth__016 #(.WIDTH(WIDTH)) mul67(.x(x[125]), .z(tmp00[67]));
	booth__004 #(.WIDTH(WIDTH)) mul68(.x(x[127]), .z(tmp00[68]));
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
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000029(.in0(tmp00[58]), .in1(tmp00[59]), .out(tmp01[29]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000030(.in0(tmp00[60]), .in1(tmp00[61]), .out(tmp01[30]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000031(.in0(tmp00[62]), .in1(tmp00[63]), .out(tmp01[31]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000032(.in0(tmp00[64]), .in1(tmp00[65]), .out(tmp01[32]));
	add2 #(.I_WIDTH(WIDTH*2+0), .O_WIDTH(WIDTH*2+1)) add000033(.in0(tmp00[66]), .in1(tmp00[67]), .out(tmp01[33]));
	assign tmp01[34] = $signed(tmp00[68]);
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000034(.in0(tmp01[0]), .in1(tmp01[1]), .out(tmp02[0]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000035(.in0(tmp01[2]), .in1(tmp01[3]), .out(tmp02[1]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000036(.in0(tmp01[4]), .in1(tmp01[5]), .out(tmp02[2]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000037(.in0(tmp01[6]), .in1(tmp01[7]), .out(tmp02[3]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000038(.in0(tmp01[8]), .in1(tmp01[9]), .out(tmp02[4]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000039(.in0(tmp01[10]), .in1(tmp01[11]), .out(tmp02[5]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000040(.in0(tmp01[12]), .in1(tmp01[13]), .out(tmp02[6]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000041(.in0(tmp01[14]), .in1(tmp01[15]), .out(tmp02[7]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000042(.in0(tmp01[16]), .in1(tmp01[17]), .out(tmp02[8]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000043(.in0(tmp01[18]), .in1(tmp01[19]), .out(tmp02[9]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000044(.in0(tmp01[20]), .in1(tmp01[21]), .out(tmp02[10]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000045(.in0(tmp01[22]), .in1(tmp01[23]), .out(tmp02[11]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000046(.in0(tmp01[24]), .in1(tmp01[25]), .out(tmp02[12]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000047(.in0(tmp01[26]), .in1(tmp01[27]), .out(tmp02[13]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000048(.in0(tmp01[28]), .in1(tmp01[29]), .out(tmp02[14]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000049(.in0(tmp01[30]), .in1(tmp01[31]), .out(tmp02[15]));
	add2 #(.I_WIDTH(WIDTH*2+1), .O_WIDTH(WIDTH*2+2)) add000050(.in0(tmp01[32]), .in1(tmp01[33]), .out(tmp02[16]));
	assign tmp02[17] = $signed(tmp01[34]);
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000051(.in0(tmp02[0]), .in1(tmp02[1]), .out(tmp03[0]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000052(.in0(tmp02[2]), .in1(tmp02[3]), .out(tmp03[1]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000053(.in0(tmp02[4]), .in1(tmp02[5]), .out(tmp03[2]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000054(.in0(tmp02[6]), .in1(tmp02[7]), .out(tmp03[3]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000055(.in0(tmp02[8]), .in1(tmp02[9]), .out(tmp03[4]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000056(.in0(tmp02[10]), .in1(tmp02[11]), .out(tmp03[5]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000057(.in0(tmp02[12]), .in1(tmp02[13]), .out(tmp03[6]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000058(.in0(tmp02[14]), .in1(tmp02[15]), .out(tmp03[7]));
	add2 #(.I_WIDTH(WIDTH*2+2), .O_WIDTH(WIDTH*2+3)) add000059(.in0(tmp02[16]), .in1(tmp02[17]), .out(tmp03[8]));
	add2 #(.I_WIDTH(WIDTH*2+3), .O_WIDTH(WIDTH*2+4)) add000060(.in0(tmp03[0]), .in1(tmp03[1]), .out(tmp04[0]));
	add2 #(.I_WIDTH(WIDTH*2+3), .O_WIDTH(WIDTH*2+4)) add000061(.in0(tmp03[2]), .in1(tmp03[3]), .out(tmp04[1]));
	add2 #(.I_WIDTH(WIDTH*2+3), .O_WIDTH(WIDTH*2+4)) add000062(.in0(tmp03[4]), .in1(tmp03[5]), .out(tmp04[2]));
	add2 #(.I_WIDTH(WIDTH*2+3), .O_WIDTH(WIDTH*2+4)) add000063(.in0(tmp03[6]), .in1(tmp03[7]), .out(tmp04[3]));
	assign tmp04[4] = $signed(tmp03[8]);
	add2 #(.I_WIDTH(WIDTH*2+4), .O_WIDTH(WIDTH*2+5)) add000064(.in0(tmp04[0]), .in1(tmp04[1]), .out(tmp05[0]));
	add2 #(.I_WIDTH(WIDTH*2+4), .O_WIDTH(WIDTH*2+5)) add000065(.in0(tmp04[2]), .in1(tmp04[3]), .out(tmp05[1]));
	assign tmp05[2] = $signed(tmp04[4]);
	add2 #(.I_WIDTH(WIDTH*2+5), .O_WIDTH(WIDTH*2+6)) add000066(.in0(tmp05[0]), .in1(tmp05[1]), .out(tmp06[0]));
	assign tmp06[1] = $signed(tmp05[2]);
	add2 #(.I_WIDTH(WIDTH*2+6), .O_WIDTH(WIDTH*2+7)) add000067(.in0(tmp06[0]), .in1(tmp06[1]), .out(tmp07[0]));
	relu #(.WIDTH(WIDTH*2+$clog2(IN))) ReLU(.a(tmp07[0]), .b(23'h0), .sel(tmp07[0][WIDTH*2+$clog2(IN)-1]), .out(z));
endmodule

