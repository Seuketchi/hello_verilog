// Hello world in Verilog

module hello;
	initial #49 $finish; //ends at cycle 50

	always begin //loop
		$display("Hello!"); 
		#10; //waits 10 cycles before repeating loop
	end
endmodule
