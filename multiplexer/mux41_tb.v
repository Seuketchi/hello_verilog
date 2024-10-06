`include "mux41_df.v"
`include "mux41_bh.v"
`include "mux41_st.v"
`include "alt_mux41.v"
module mux41_tb();

reg i0, i1, i2, i3, s0, s1;
wire y;



// mux41_df mux1 (.i0(i0), .i1(i1), .i2(i2), .i3(i3), .s0(s0), .s1(s1), .y(y));
// mux41_bh mux2 (.i0(i0), .i1(i1), .i2(i2), .i3(i3), .s0(s0), .s1(s1), .y(y));
// mux41_st mux3 (.i0(i0), .i1(i1), .i2(i2), .i3(i3), .s0(s0), .s1(s1), .y(y));
alt_mux41 mux4 (.i0(i0), .i1(i1), .i2(i2), .i3(i3), .s0(s0), .s1(s1), .y(y));


initial begin
    $dumpfile("mux41.vcd");
    $dumpvars(0,mux41_tb);

    $display("time\t i0 i1 i2 i3  s0 s1 y");
    $monitor("%g\t %b  %b  %b  %b | %b  %b  %b",
    $time, i0,i1,i2,i3,s0,s1,y);

        // Test case 1: S0=0, S1=0, should output I0
        i0 = 1; i1 = 0; i2 = 0; i3 = 0; s0 = 0; s1 = 0;
        #10; // Wait 10 time units
        // Test case 2: s0=0, s1=1, should output i1
        i0 = 0; i1 = 1; i2 = 0; i3 = 0; s0 = 1; s1 = 0;
        #10;
        // Test case 3: s0=1, s1=0, should output i2
        i0 = 0; i1 = 0; i2 = 1; i3 = 0; s0 = 0; s1 = 1;
        #10;
        // Test case 4: s0=1, s1=1, should output i3
        i0 = 0; i1 = 0; i2 = 0; i3 = 1; s0 = 1; s1 = 1;
        #10;
        $finish;  // End simulation

end


endmodule