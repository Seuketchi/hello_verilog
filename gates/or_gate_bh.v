module or_gate_bh (
    input a,
    input b,
    output reg y
);

always @(*) begin
   y = a | b;
end

endmodule
