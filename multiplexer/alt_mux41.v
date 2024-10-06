`include "mux21_df.v"
module alt_mux41(
    input i0,i1,i2,i3,s0,s1,
    output y
);

wire y1,y2;

mux21_df m1(.i0(i0),.i1(i1),.s(s0),.y(y1));
mux21_df m2(.i0(i2),.i1(i3),.s(s0),.y(y2));
mux21_df m3(.i0(y1),.i1(y2),.s(s1),.y(y));

endmodule