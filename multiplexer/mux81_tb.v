`include "mux81_df.v"
`include "mux81_bh.v"
`include "mux81_st.v"
module mux81_tb();

reg [7:0] i;
reg [2:0] s;
wire y;

// mux81_df mux1(
//     .i(i),
//     .s(s),
//     .y(y)
// );

mux81_bh mux2(
    .i(i),
    .s(s),
    .y(y)
);

// mux81_st mux3(
//     .i(i),
//     .s(s),
//     .y(y)
// );

initial begin
    $dumpfile("mux81.vcd");
    $dumpvars(0, mux81_tb);

    $display("time\t i        s   y");
    $monitor("%g\t %b %b %b",
    $time, i, s, y);

    // Test case 1
    i = 8'b00000001; s = 3'b000;
    #10 i = 8'b00000010; s = 3'b001;
    #10 i = 8'b00000100; s = 3'b010;
    #10 i = 8'b00001000; s = 3'b011;
    #10 i = 8'b00010000; s = 3'b100;
    #10 i = 8'b00100000; s = 3'b101;
    #10 i = 8'b01000000; s = 3'b110;
    #10 i = 8'b10000000; s = 3'b111;
    #10;
    $finish;
end

endmodule