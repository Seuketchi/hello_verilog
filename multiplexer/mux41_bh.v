module mux41_bh(
    input i0, i1,i2,i3,s0, s1,
    output reg y
);

always @(*) begin
     y = (~s0&~s1&i0) | (s0&~s1&i1) | (~s0&s1&i2) | (s0&s1&i3);
end

endmodule