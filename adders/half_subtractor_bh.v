module half_subtractor_bh(
    input a,
    input b,
    output reg difference,
    output reg borrow
);

always @(*) begin
    difference = a ^ b;
    borrow = ~a & b;
end

endmodule