`include "full_subtractor_st.v"
`include "full_subtractor_df.v"
`include "full_subtractor_bh.v"
module full_subtractor_tb();

reg a,b,c;
wire difference, borrow;

initial begin
    $dumpfile("subtractor.vcd");
    $dumpvars(0, full_subtractor_tb);

    $display("time\t a b c dif bor");
    $monitor("%g\t %b %b %b  %b   %b  ",
        $time, a, b, c,  difference,borrow);
    
    a = 0; b = 0; c = 0;
    #5 a = 0; b = 0; c = 1;
    #5 a = 0; b = 1; c = 0;
    #5 a = 0; b = 1; c = 1;
    #5 a = 1; b = 0; c = 0;
    #5 a = 1; b = 0; c = 1;
    #5 a = 1; b = 1; c = 0;
    #5 a = 1; b = 1; c = 1;
    #5 $finish;
end

full_subtractor_st s1(a,b,c,difference,borrow);
// full_subtractor_df s2(a,b,c,difference,borrow);
// full_subtractor_bh s3(a,b,c,difference,borrow);



endmodule