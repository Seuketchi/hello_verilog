module decoder_4_to_16(
    input [3:0] a,
    input e,
    output[15:0] y
);

assign y = (e) ? (1 << a) : 16'b0000000000000000;

endmodule