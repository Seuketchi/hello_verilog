`include "gates.v"
module decoder_3_to_8_st(
    input [2:0] a,
    input e,
    output [7:0] y
);

wire na0, na1, na2, ne;

not_gate_df n1(.y(na0), .a(a[0]));
not_gate_df n2(.y(na1), .a(a[1]));
not_gate_df n3(.y(na2), .a(a[2]));

three_bit_and_gate_df a1 (.y(y[0]),.a0(na0), .a1(na1), .a2(na2), .e(e));
three_bit_and_gate_df a2 (.y(y[1]),.a0(a[0]), .a1(na1), .a2(na2), .e(e));
three_bit_and_gate_df a3 (.y(y[2]),.a0(na0), .a1(a[1]), .a2(na2), .e(e));
three_bit_and_gate_df a4 (.y(y[3]),.a0(a[0]), .a1(a[1]), .a2(na2), .e(e));
three_bit_and_gate_df a5 (.y(y[4]),.a0(na0), .a1(na1), .a2(a[2]), .e(e));
three_bit_and_gate_df a6 (.y(y[5]),.a0(a[0]), .a1(na1), .a2(a[2]), .e(e));
three_bit_and_gate_df a7 (.y(y[6]),.a0(na0), .a1(a[1]), .a2(a[2]), .e(e));
three_bit_and_gate_df a8 (.y(y[7]),.a0(a[0]), .a1(a[1]), .a2(a[2]), .e(e));


endmodule