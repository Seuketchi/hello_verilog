`include "full_adder_subtractor_st.v"
module four_bit_full_adder_subtractor_st (
    input [3:0] a,
    input [3:0] b,
    input cin,
    input control,
    output [3:0] result,
    output cout
);
wire [2:0] carry;


full_adder_subtractor_st u1 (
    .a(a[0]),
    .b(b[0]),
    .cin(cin),
    .control(control),
    .result(result[0]),
    .cout(carry[0])
);

full_adder_subtractor_st u2 (
    .a(a[1]),
    .b(b[1]),
    .cin(carry[0]),
    .control(control),
    .result(result[1]),
    .cout(carry[1])
);

full_adder_subtractor_st u3 (
    .a(a[2]),
    .b(b[2]),
    .cin(carry[1]),
    .control(control),
    .result(result[2]),
    .cout(carry[2])
);

full_adder_subtractor_st u4 (
    .a(a[3]),
    .b(b[3]),
    .cin(carry[2]),
    .control(control),
    .result(result[3]),
    .cout(cout)
);


endmodule