module mux41_df(
    input i0, i1,i2,i3,s0, s1,
    output y
);
    assign y = (~s0&~s1&i0) | (s0&~s1&i1) | (~s0&s1&i2) | (s0&s1&i3);

endmodule