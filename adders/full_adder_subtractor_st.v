`include "full_adders_st.v"
`include "full_subtractor_df.v"
module full_adder_subtractor_st(
    input a,
    input b,
    input cin,
    input control,
    output result,
    output cout
);

wire sum, diff, carry, borrow;

full_adders_st adder (
    .a(a),
    .b(b),
    .c(cin),
    .sum(sum),
    .carry(carry)
    );

full_subtractor_df subtractor (
    .a(a),
    .b(b),
    .c(cin),
    .difference(diff),
    .borrow(borrow)
);

assign result = control ? diff : sum;
assign cout = control ? borrow : carry;

endmodule