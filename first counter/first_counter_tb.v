`include "first_counter.v"
module first_counter_tb();

reg clock, reset, enable;
wire [3:0] counter_out;

initial begin
    $dumpfile("file.vcd");
    $dumpvars(1,clock,reset,enable,counter_out);

    $display ("time\t clk reset enable counter");
    $monitor ("%g\t %b %b %b %b",
        $time, clock, reset, enable, counter_out);
    clock = 1;
    reset = 0;
    enable = 0;
    #5 reset = 1; //#5 delay value before reset is pressed
    #10 reset = 0;
    #10 enable = 1; 
    #100 enable = 0;
    #5 $finish;
end

always begin
    #5 clock = ~clock; //invert/negate clock every 5 cycles
end

first_counter U_counter (
    clock,
    reset,
    enable,
    counter_out
);

endmodule