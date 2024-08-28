`include "and_gate.v"
module complex_and_gate_tb();
    reg a, b, c, d;
    wire e, f;
    wire y;
    
   
    initial begin
    $dumpfile("file2.vcd");
    $dumpvars(0, complex_and_gate_tb);
    #5 a = 0; b = 0; c = 0; d = 0;
    #5 a = 0; b = 1; c = 0; d = 1;
    #5 a = 1; b = 0; c = 1; d = 0;
    #5 a = 1; b = 1; c = 1; d = 1;
    #5 $finish;
    end
 
 and_gate U_and_gate (
    a,
    b,
    e,
 );

 and_gate U_and_gate2 (
    c,
    d,
    f
 );

 and_gate U_and_gate3 (
    e,
    f,
    y
 );

endmodule