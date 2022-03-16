module booth__128
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+1:0]) << 7);
endmodule

module booth__127
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+8:0]) << 0);
endmodule

module booth__126
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 1);
endmodule

module booth__125
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+8:0]) << 0);
endmodule

module booth__124
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 2);
endmodule

module booth__123
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+8:0]) << 0);
endmodule

module booth__122
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 1);
endmodule

module booth__121
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+8:0]) << 0);
endmodule

module booth__120
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 3);
endmodule

module booth__119
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+8:0]) << 0);
endmodule

module booth__118
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 1);
endmodule

module booth__117
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+8:0]) << 0);
endmodule

module booth__116
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 2);
endmodule

module booth__115
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+8:0]) << 0);
endmodule

module booth__114
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 1);
endmodule

module booth__113
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+8:0]) << 0);
endmodule

module booth__112
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+4:0]) << 4);
endmodule

module booth__111
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+8:0]) << 0);
endmodule

module booth__110
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 1);
endmodule

module booth__109
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+8:0]) << 0);
endmodule

module booth__108
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 2);
endmodule

module booth__107
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+8:0]) << 0);
endmodule

module booth__106
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 1);
endmodule

module booth__105
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+8:0]) << 0);
endmodule

module booth__104
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 3);
endmodule

module booth__103
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+8:0]) << 0);
endmodule

module booth__102
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 1);
endmodule

module booth__101
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+8:0]) << 0);
endmodule

module booth__100
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 2);
endmodule

module booth__099
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+8:0]) << 0);
endmodule

module booth__098
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 1);
endmodule

module booth__097
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+8:0]) << 0);
endmodule

module booth__096
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+3:0]) << 5);
endmodule

module booth__095
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+8:0]) << 0);
endmodule

module booth__094
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 1);
endmodule

module booth__093
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+8:0]) << 0);
endmodule

module booth__092
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 2);
endmodule

module booth__091
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+8:0]) << 0);
endmodule

module booth__090
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 1);
endmodule

module booth__089
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+8:0]) << 0);
endmodule

module booth__088
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 3);
endmodule

module booth__087
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+8:0]) << 0);
endmodule

module booth__086
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 1);
endmodule

module booth__085
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+8:0]) << 0);
endmodule

module booth__084
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 2);
endmodule

module booth__083
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+8:0]) << 0);
endmodule

module booth__082
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 1);
endmodule

module booth__081
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+8:0]) << 0);
endmodule

module booth__080
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+4:0]) << 4);
endmodule

module booth__079
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+8:0]) << 0);
endmodule

module booth__078
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 1);
endmodule

module booth__077
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+8:0]) << 0);
endmodule

module booth__076
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 2);
endmodule

module booth__075
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+8:0]) << 0);
endmodule

module booth__074
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 1);
endmodule

module booth__073
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+8:0]) << 0);
endmodule

module booth__072
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 3);
endmodule

module booth__071
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+8:0]) << 0);
endmodule

module booth__070
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 1);
endmodule

module booth__069
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+8:0]) << 0);
endmodule

module booth__068
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 2);
endmodule

module booth__067
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+8:0]) << 0);
endmodule

module booth__066
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 1);
endmodule

module booth__065
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+8:0]) << 0);
endmodule

module booth__064
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+1:0]) << 6);
endmodule

module booth__063
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth__062
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 1);
endmodule

module booth__061
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth__060
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 2);
endmodule

module booth__059
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth__058
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 1);
endmodule

module booth__057
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth__056
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+4:0]) << 3);
endmodule

module booth__055
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth__054
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 1);
endmodule

module booth__053
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth__052
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 2);
endmodule

module booth__051
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth__050
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 1);
endmodule

module booth__049
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth__048
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+3:0]) << 4);
endmodule

module booth__047
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth__046
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 1);
endmodule

module booth__045
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth__044
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 2);
endmodule

module booth__043
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth__042
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 1);
endmodule

module booth__041
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth__040
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+4:0]) << 3);
endmodule

module booth__039
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth__038
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 1);
endmodule

module booth__037
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth__036
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 2);
endmodule

module booth__035
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth__034
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 1);
endmodule

module booth__033
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth__032
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+1:0]) << 5);
endmodule

module booth__031
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 0);
endmodule

module booth__030
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 1);
endmodule

module booth__029
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 0);
endmodule

module booth__028
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+4:0]) << 2);
endmodule

module booth__027
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 0);
endmodule

module booth__026
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 1);
endmodule

module booth__025
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 0);
endmodule

module booth__024
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+3:0]) << 3);
endmodule

module booth__023
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 0);
endmodule

module booth__022
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 1);
endmodule

module booth__021
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 0);
endmodule

module booth__020
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+4:0]) << 2);
endmodule

module booth__019
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 0);
endmodule

module booth__018
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 1);
endmodule

module booth__017
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 0);
endmodule

module booth__016
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+1:0]) << 4);
endmodule

module booth__015
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 0);
endmodule

module booth__014
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+4:0]) << 1);
endmodule

module booth__013
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 0);
endmodule

module booth__012
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+3:0]) << 2);
endmodule

module booth__011
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 0);
endmodule

module booth__010
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+4:0]) << 1);
endmodule

module booth__009
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 0);
endmodule

module booth__008
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+1:0]) << 3);
endmodule

module booth__007
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+4:0]) << 0);
endmodule

module booth__006
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+3:0]) << 1);
endmodule

module booth__005
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+4:0]) << 0);
endmodule

module booth__004
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+1:0]) << 2);
endmodule

module booth__003
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+3:0]) << 0);
endmodule

module booth__002
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+1:0]) << 1);
endmodule

module booth__001
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+2:0]) << 0);
endmodule

module booth_0000
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = 16'h0;
endmodule

module booth_0001
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+1:0]) << 0);
endmodule

module booth_0002
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+1:0]) << 1);
endmodule

module booth_0003
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+2:0]) << 0);
endmodule

module booth_0004
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+1:0]) << 2);
endmodule

module booth_0005
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+3:0]) << 0);
endmodule

module booth_0006
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+2:0]) << 1);
endmodule

module booth_0007
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+3:0]) << 0);
endmodule

module booth_0008
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+1:0]) << 3);
endmodule

module booth_0009
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+4:0]) << 0);
endmodule

module booth_0010
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+3:0]) << 1);
endmodule

module booth_0011
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+4:0]) << 0);
endmodule

module booth_0012
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+2:0]) << 2);
endmodule

module booth_0013
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+4:0]) << 0);
endmodule

module booth_0014
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+3:0]) << 1);
endmodule

module booth_0015
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+4:0]) << 0);
endmodule

module booth_0016
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+1:0]) << 4);
endmodule

module booth_0017
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 0);
endmodule

module booth_0018
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+4:0]) << 1);
endmodule

module booth_0019
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 0);
endmodule

module booth_0020
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+3:0]) << 2);
endmodule

module booth_0021
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 0);
endmodule

module booth_0022
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+4:0]) << 1);
endmodule

module booth_0023
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 0);
endmodule

module booth_0024
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+2:0]) << 3);
endmodule

module booth_0025
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 0);
endmodule

module booth_0026
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+4:0]) << 1);
endmodule

module booth_0027
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 0);
endmodule

module booth_0028
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+3:0]) << 2);
endmodule

module booth_0029
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 0);
endmodule

module booth_0030
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+4:0]) << 1);
endmodule

module booth_0031
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 0);
endmodule

module booth_0032
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+1:0]) << 5);
endmodule

module booth_0033
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 0);
endmodule

module booth_0034
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 1);
endmodule

module booth_0035
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 0);
endmodule

module booth_0036
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+4:0]) << 2);
endmodule

module booth_0037
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 0);
endmodule

module booth_0038
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 1);
endmodule

module booth_0039
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 0);
endmodule

module booth_0040
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+3:0]) << 3);
endmodule

module booth_0041
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 0);
endmodule

module booth_0042
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 1);
endmodule

module booth_0043
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 0);
endmodule

module booth_0044
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+4:0]) << 2);
endmodule

module booth_0045
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 0);
endmodule

module booth_0046
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 1);
endmodule

module booth_0047
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 0);
endmodule

module booth_0048
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+2:0]) << 4);
endmodule

module booth_0049
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 0);
endmodule

module booth_0050
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 1);
endmodule

module booth_0051
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 0);
endmodule

module booth_0052
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+4:0]) << 2);
endmodule

module booth_0053
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 0);
endmodule

module booth_0054
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 1);
endmodule

module booth_0055
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 0);
endmodule

module booth_0056
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+3:0]) << 3);
endmodule

module booth_0057
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 0);
endmodule

module booth_0058
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 1);
endmodule

module booth_0059
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 0);
endmodule

module booth_0060
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+4:0]) << 2);
endmodule

module booth_0061
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 0);
endmodule

module booth_0062
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 1);
endmodule

module booth_0063
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 0);
endmodule

module booth_0064
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+1:0]) << 6);
endmodule

module booth_0065
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth_0066
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 1);
endmodule

module booth_0067
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth_0068
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 2);
endmodule

module booth_0069
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth_0070
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 1);
endmodule

module booth_0071
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth_0072
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+4:0]) << 3);
endmodule

module booth_0073
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth_0074
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 1);
endmodule

module booth_0075
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth_0076
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 2);
endmodule

module booth_0077
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth_0078
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 1);
endmodule

module booth_0079
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth_0080
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+3:0]) << 4);
endmodule

module booth_0081
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth_0082
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 1);
endmodule

module booth_0083
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth_0084
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 2);
endmodule

module booth_0085
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth_0086
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 1);
endmodule

module booth_0087
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth_0088
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+4:0]) << 3);
endmodule

module booth_0089
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth_0090
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 1);
endmodule

module booth_0091
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth_0092
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 2);
endmodule

module booth_0093
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth_0094
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 1);
endmodule

module booth_0095
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth_0096
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+2:0]) << 5);
endmodule

module booth_0097
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth_0098
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 1);
endmodule

module booth_0099
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth_0100
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 2);
endmodule

module booth_0101
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth_0102
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 1);
endmodule

module booth_0103
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth_0104
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+4:0]) << 3);
endmodule

module booth_0105
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth_0106
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 1);
endmodule

module booth_0107
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth_0108
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 2);
endmodule

module booth_0109
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth_0110
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 1);
endmodule

module booth_0111
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth_0112
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+3:0]) << 4);
endmodule

module booth_0113
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth_0114
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 1);
endmodule

module booth_0115
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth_0116
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 2);
endmodule

module booth_0117
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth_0118
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 1);
endmodule

module booth_0119
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth_0120
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+4:0]) << 3);
endmodule

module booth_0121
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth_0122
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 1);
endmodule

module booth_0123
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth_0124
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+5:0]) << 2);
endmodule

module booth_0125
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

module booth_0126
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+6:0]) << 1);
endmodule

module booth_0127
	#(parameter WIDTH = 8)
	(x, z);
	input signed [WIDTH*2-1:0] x;
	output [WIDTH*2-1:0] z;
	assign z = (WIDTH*2)'((WIDTH*2+1)'(x[WIDTH-2+7:0]) << 0);
endmodule

