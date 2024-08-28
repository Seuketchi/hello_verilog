`include "and_gate.v"
module and_gate_tb();

reg a, b, c,d;

wire e, f;

wire y;

initial begin
    $dumpfile("file.vcd");
    $dumpvars(0, and_gate_tb);

    $display ("time\t a b c d e f y");
    $monitor ("%g\t %b %b %b %b %b %b %b",
        $time, a, b, c, d, e, f, y);
    // a = 1;
    // b = 0;
    // #5 a = 0;
    // #5 b = 1;
    // #5 a = 1;

    //Another way to write the above code
    // a = 0;
    // b = 0;
    // #5 a = 1;
    // #5 b = 1;
    // #5 a = 0;

    //Another way to write the above code
    
    
    // #5 a = 0; b = 0; c = 0; d = 0;
    // #5 a = 0; b = 1; c = 0; d = 1;
    // #5 a = 1; b = 0; c = 1; d = 0;
    // #5 a = 1; b = 1; c = 1; d = 1;

    a = 0; b = 0;
    c = 0; d = 0;
    #5 c = 0; d = 1;
    #5 c = 1; d = 0;
    #5 c = 1; d = 1;
    #5 c = 0; d = 0;
    #5 a = 0; b = 0;
    #5 a = 0; b = 1;
    #5 a = 1; b = 0;
    #5 a = 1; b = 1;
    #5 a = 0; b = 0; c = 0; d = 0;
    #5 a = 0; b = 1; c = 0; d = 1;
    #5 a = 1; b = 0; c = 1; d = 0;
    #5 a = 1; b = 1; c = 1; d = 1;
    #5 a = 0; b = 0; c = 0; d = 0;
    #5 a = 0; b = 0; c = 0; d = 0;
    #5 a = 0; b = 0; c = 0; d = 0;
    #5 a = 0; b = 0; c = 0; d = 0;



    #5 $finish;
end

and_gate U_and_gate (
    a,
    b,
    e
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