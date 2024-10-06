module decoder_3_to_8_df(
    input [2:0] a,
    input e,
    output[7:0] y
);

assign y = (e) ? (1 << a) : 8'b00000000;

endmodule