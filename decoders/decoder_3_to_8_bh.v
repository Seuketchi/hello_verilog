module decoder_3_to_8_bh(
    input [2:0] a,
    input e,
    output reg [7:0] y
);

always @(*) begin
     y = (e) ? (1 << a) : 8'b00000000;

end

endmodule