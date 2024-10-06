`include "decoder_4_to_16.v"
`include "seven_segment_display.v"
module top_module(
    input wire [3:0] i,
    input wire e,
    output wire [6:0] y
);

wire [15:0] dec;

decoder_4_to_16 d1(
.a(i),
.e(e),
.y(dec)
);

seven_segment_display seg(
    .i(dec),
    .y(y)
);


endmodule

module top_module_tb;

reg [3:0] i;
reg e;
wire [6:0] y;

top_module uut (
    .i(i),
    .e(e),
    .y(y)
);

initial begin
    $dumpfile("test.vcd");
    $dumpvars(0, top_module_tb);

    $display("time\t e i    gfedcba ");
    $monitor("%g\t %b %b %b ",$time, e, i, y);

    // Test cases
    e = 0;
    #10 e = 1; i = 4'b0000; 
    #10 i = 4'b0001; 
    #10 i = 4'b0010; 
    #10 i = 4'b0011; 
    #10 i = 4'b0100; 
    #10 i = 4'b0101; 
    #10 i = 4'b0110; 
    #10 i = 4'b0111; 
    #10 i = 4'b1000; 
    #10 i = 4'b1001; 
    #10 i = 4'b1010; 
    #10 i = 4'b1011; 
    #10 i = 4'b1100; 
    #10 i = 4'b1101; 
    #10 i = 4'b1110; 
    #10 i = 4'b1111; 

    #10 $finish;
end

endmodule
