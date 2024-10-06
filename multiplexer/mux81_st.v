`include "gates.v"
module mux81_st (
    input [7:0] i,  // 8-bit data input
    input [2:0] s,  // 3-bit select input
    output y        // output
);

    wire [7:0] and_out;  // intermediate AND gates output

    custom_and_gate_df a0(.a(i[0]),.s0(~s[0]),.s1(~s[1]),.s2(~s[2]),.y(and_out[0]));
    custom_and_gate_df a1(.a(i[1]),.s0(s[0]),.s1(~s[1]),.s2(~s[2]),.y(and_out[1]));
    custom_and_gate_df a2(.a(i[2]),.s0(~s[0]),.s1(s[1]),.s2(~s[2]),.y(and_out[2]));
    custom_and_gate_df a3(.a(i[3]),.s0(s[0]),.s1(s[1]),.s2(~s[2]),.y(and_out[3]));
    custom_and_gate_df a4(.a(i[4]),.s0(~s[0]),.s1(~s[1]),.s2(s[2]),.y(and_out[4]));
    custom_and_gate_df a5(.a(i[5]),.s0(s[0]),.s1(~s[1]),.s2(s[2]),.y(and_out[5]));
    custom_and_gate_df a6(.a(i[6]),.s0(~s[0]),.s1(s[1]),.s2(s[2]),.y(and_out[6]));
    custom_and_gate_df a7(.a(i[7]),.s0(s[0]),.s1(s[1]),.s2(s[2]),.y(and_out[7]));


    custom_or_gate_df o1(.a(and_out),.y(y));


endmodule

module custom_and_gate_df(
    input a,
    input s0,
    input s1,
    input s2,
    output y
);


    assign y = a & s0 & s1 & s2;
endmodule

module custom_or_gate_df(
    input [7:0] a,
    output y
);
    assign y = a[0] | a[1] | a[2] | a[3] | a[4] | a[5] | a[6] | a[7];
endmodule

