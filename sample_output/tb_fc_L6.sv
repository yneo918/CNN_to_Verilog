module tb;
	localparam WIDTH = 8;
	localparam IN = 128;
	localparam OUT = 84;
	logic [WIDTH-1:0] x[0:IN-1];
	logic [WIDTH*2+$clog2(IN)-1:0] z[0:OUT-1];
	logic [WIDTH*2+$clog2(IN)-1:0] exp[0:OUT-1];
	fc128_84 #(.WIDTH(WIDTH)) fc(.x(x), .z(z));
	initial begin
		$readmemh("exp",exp);
		x <= '{8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0, 8'h0};

		#10
		x <= '{ 8'h1c, 8'h42, 8'he2, 8'h72, 8'hee, 8'h42, 8'he7, 8'h79, 8'hd5, 8'h31, 8'hbb, 8'hec, 8'h86, 8'h2, 8'ha3, 8'he1, 8'h51, 8'h1e, 8'he6, 8'hc7, 8'h92, 8'h49, 8'h4c, 8'h18, 8'hba, 8'h25, 8'h93, 8'h1a, 8'h48, 8'h7e, 8'h1b, 8'ha2, 8'h68, 8'h38, 8'hca, 8'ha9, 8'h45, 8'h8a, 8'h36, 8'h2c, 8'hf6, 8'h6a, 8'h16, 8'h16, 8'hdb, 8'hac, 8'h2b, 8'h2, 8'h94, 8'h9f, 8'h4a, 8'h1, 8'h64, 8'hc3, 8'hda, 8'h60, 8'h90, 8'h52, 8'he4, 8'hba, 8'hc3, 8'heb, 8'he5, 8'h89, 8'h5e, 8'h9d, 8'h8b, 8'h5e, 8'hdc, 8'h94, 8'h51, 8'h4b, 8'hae, 8'hb, 8'h3a, 8'hb8, 8'h75, 8'h26, 8'h28, 8'h54, 8'ha2, 8'h12, 8'hd2, 8'h3e, 8'h15, 8'h67, 8'h67, 8'hc5, 8'h40, 8'h7e, 8'h32, 8'hed, 8'he9, 8'h17, 8'hf9, 8'hfc, 8'hfc, 8'hea, 8'h3a, 8'hf3, 8'h81, 8'hef, 8'hfa, 8'h94, 8'h46, 8'h73, 8'h41, 8'hf0, 8'hd4, 8'ha4, 8'h55, 8'h2a, 8'he5, 8'h1c, 8'h66, 8'h54, 8'hf3, 8'h9e, 8'h3b, 8'hc9, 8'hf7, 8'h2e, 8'he3, 8'h47, 8'h32, 8'h76, 8'h8b, 8'hab };
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
