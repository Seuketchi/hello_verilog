`include "half_subtractor_df.v"
`include "half_subtractor_st.v"
`include "half_subtractor_bh.v"
module half_subtractor_tb();

reg a,b;
wire difference, borrow;

initial begin
    $dumpfile("half.vcd");
    $dumpvars(0, half_subtractor_tb);

    $display("time\t a b dif bor");
    $monitor("%g\t %b %b  %b  %b",
        $time, a, b, difference, borrow);

   a = 0; b = 0;
   #5 a = 0; b = 1;
   #5 a = 1; b = 0;
   #5 a = 1; b = 1;
    #5 $finish;
end    

// half_subtractor_df s1(a,b,difference,borrow);
// half_subtractor_st s2(a,b,difference,borrow);
half_subtractor_bh s3(a,b,difference,borrow);

endmodule