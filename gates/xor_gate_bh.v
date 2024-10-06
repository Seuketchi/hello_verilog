module xor_gate_bh (
    input a,
    input b,
    output reg y
);

always @(*) begin
//    y = a ^ b;
y = (~a & b) | (a & ~b);
end

endmodule
