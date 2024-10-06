module full_subtractor_df (
    input a,
    input b,
    input c,
    output difference,
    output borrow
);
assign difference = a ^ b ^ c;
assign borrow = (~a & b) | (b & c) | (~a & c);
endmodule