module not_gate_bh(
input a,
output reg y
);

always @ (a)
y = ~a;

endmodule