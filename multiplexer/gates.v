module or_gate_df(
    input a,
    input b,
    output y
);
    assign y = a | b;

endmodule

module not_gate_df(
    input a,
    output y
);
    assign y = ~a;
endmodule

module and_gate_df(
    input a,
    input b,
    output y
);
    assign y = a & b;
endmodule




module xor_gate_df(
    input a,
    input b,
    output y
);
    assign y = a ^ b;
endmodule

module xnor_gate_df(
    input a,
    input b,
    output y
);
    assign y = ~( a ^ b);
endmodule

module nor_gate_df(
    input a,
    input b,
    output y
);

assign y = ~(a | b);

endmodule

module nand_gate_df(
    input a,
    input b,
    output y
);

assign y = ~(a & b);

endmodule