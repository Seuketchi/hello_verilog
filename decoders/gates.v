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

module three_bit_and_gate_df(
    input a0,
    input a1,
    input a2,
    input e,
    
    output y
);
    assign y = a0 & a1 & a2 & e;
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