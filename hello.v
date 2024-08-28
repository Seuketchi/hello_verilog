// Hello world in Verilog

module hello;
	initial #49 $finish;

	always begin
		$display("Hello, World!");
		#10;
	end
endmodule
