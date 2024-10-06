`include "mux41_df.v"
module alt_mux161(
    input [15:0] i,
    input [3:0] s,
    output y
);
    wire y1, y2, y3, y4;

mux41_df m1(.i0(i[0]), .i1(i[1]), .i2(i[2]), .i3(i[3]), .s0(s[0]), .s1(s[1]), .y(y1));
mux41_df m2(.i0(i[4]), .i1(i[5]), .i2(i[6]), .i3(i[7]), .s0(s[0]), .s1(s[1]), .y(y2));
mux41_df m3(.i0(i[8]), .i1(i[9]), .i2(i[10]), .i3(i[11]), .s0(s[0]), .s1(s[1]), .y(y3));
mux41_df m4(.i0(i[12]), .i1(i[13]), .i2(i[14]), .i3(i[15]), .s0(s[0]), .s1(s[1]), .y(y4));


mux41_df m5(.i0(y1), .i1(y2), .i2(y3), .i3(y4), .s0(s[2]), .s1(s[3]), .y(y));


endmodule