`include "full_adders_df.v"
`include "full_adders_bh.v"
`include "full_adders_st.v"

module full_adders_tb();

reg a,b,c;
wire sum, carry;

initial begin
    $dumpfile("adders.vcd");
    $dumpvars(0, full_adders_tb);

    $display("time\t a b c sum car ");
    $monitor("%g\t %b %b %b  %b   %b",
        $time, a, b, c, sum, carry);
    
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

//uncomment which one to use 
// full_adders_df f1(a,b,c,sum,carry);
// full_adders_bh f2(a,b,c,sum,carry);
full_adders_st f3(a,b,c,sum,carry);

endmodule