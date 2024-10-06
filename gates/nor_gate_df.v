module nor_gate_df(
    input a,
    input b,
    output y
);

assign y = ~(a | b);

endmodule