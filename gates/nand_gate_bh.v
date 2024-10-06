module nand_gate_bh(
input a,
input b,
output reg y
);

always @ (a,b)
y = ~(a & b);

endmodule