module full_subtractor_bh(
    input a,
    input b,
    input c,
    output reg difference,
    output reg borrow
);

always @(*) begin
difference = a ^ b ^ c;
borrow = (~a & b) | (b & c) | (~a & c);
end

endmodule