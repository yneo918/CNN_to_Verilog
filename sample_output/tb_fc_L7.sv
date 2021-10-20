module tb;
	localparam WIDTH = 8;
	localparam IN = 84;
	localparam OUT = 10;
	logic [WIDTH-1:0] x[0:IN-1];
	logic [WIDTH*2+$clog2(IN)-1:0] z[0:OUT-1];
	logic [WIDTH*2+$clog2(IN)-1:0] exp[0:OUT-1];
	fc84_10 #(.WIDTH(WIDTH)) fc(.x(x), .z(z));
	initial begin
		$readmemh("exp",exp);
		x <= '{8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0};

		#10
		x <= '{ 8'h27, 8'h75, 8'h39, 8'ha0, 8'h33, 8'hb, 8'haa, 8'hcf, 8'h66, 8'h6d, 8'hc8, 8'hb8, 8'h8a, 8'hea, 8'h93, 8'h52, 8'h5a, 8'h9f, 8'h9e, 8'h2b, 8'hab, 8'h9e, 8'h53, 8'hd3, 8'h1f, 8'hee, 8'hb9, 8'hc4, 8'hb, 8'hb6, 8'hf2, 8'hda, 8'h61, 8'h5b, 8'hb5, 8'hbe, 8'h6c, 8'h9, 8'h86, 8'h5b, 8'h8e, 8'h24, 8'he1, 8'h10, 8'hb6, 8'h73, 8'h63, 8'h8a, 8'h51, 8'h83, 8'h4b, 8'hc8, 8'h8c, 8'h80, 8'h69, 8'h48, 8'hd4, 8'hc6, 8'h2d, 8'h17, 8'h68, 8'hd9, 8'h41, 8'h57, 8'h3e, 8'hd5, 8'ha0, 8'hca, 8'h94, 8'he, 8'h1b, 8'h56, 8'h4c, 8'ha6, 8'h36, 8'h44, 8'h1a, 8'h29, 8'h3d, 8'hdf, 8'h60, 8'h9c, 8'hd1, 8'he2 };
		#10
		if (exp !== z)begin
			$display("Mismatch Error");
			$display("out: z0=0x%0h z1=0x%0h z2=0x%0h z3=0x%0h z4=0x%0h z5=0x%0h z6=0x%0h z7=0x%0h z8=0x%0h z9=0x%0h ",z[0], z[1], z[2], z[3], z[4], z[5], z[6], z[7], z[8], z[9]);
			$display("exp: z0=0x%0h z1=0x%0h z2=0x%0h z3=0x%0h z4=0x%0h z5=0x%0h z6=0x%0h z7=0x%0h z8=0x%0h z9=0x%0h ",exp[0], exp[1], exp[2], exp[3], exp[4], exp[5], exp[6], exp[7], exp[8], exp[9]);
		end
		if (exp == z)begin
			$display("\nPASS\n");
		end
		#10 $finish;

	end
endmodule
