`include "decoder_3_to_8_df.v"
`include "decoder_3_to_8_st.v"
`include "decoder_3_to_8_bh.v"
module decoder_3_to_8_tb();

reg [2:0] a;
reg e;
wire [7:0] y;


// decoder_3_to_8_df d1 (
//     .a(a),
//     .e(e),
//     .y(y)
// );

// decoder_3_to_8_st d2 (
//     .a(a),
//     .e(e),
//     .y(y)
// );

decoder_3_to_8_bh d3 (
    .a(a),
    .e(e),
    .y(y)
);

initial begin
    $dumpfile("decoder38.vcd");
    $dumpvars(0, decoder_3_to_8_tb);

    $display("time\t e a     y ");
    $monitor("%g\t %b %b   %b",$time, e,a,y);

    e = 0;
    #10 e = 1; a = 3'b000;
    #10 a = 3'b001;
    #10 a = 3'b010;
    #10 a = 3'b011;
    #10 a = 3'b100; 
    #10 a = 3'b101; 
    #10 a = 3'b110; 
    #10 a = 3'b111; 
    end

endmodule