`include "alu4.v"
module alu_testbench;
// Inputs
reg [3:0] A;
reg [3:0] B;
reg Cin;
reg [1:0] Operation;
reg Mode;
// Outputs
wire [3:0] F;
wire Cout;
// Instantiate the ALU module
alu4 uut (
    .A(A),
    .B(B),
    .Cin(Cin),
    .Operation(Operation),
    .Mode(Mode),
    .F(F),
    .Cout(Cout)
);
initial begin

    $dumpfile("file.vcd");
    $dumpvars(0, alu_testbench);
// Initialize inputs
A = 4'b0000;
B = 4'b0000;
Cin = 1'b0;
Mode = 1'b0; // Start with Logic Mode
Operation = 2'b00;
// Test cases for Logic Mode (M = 0)
$monitor("Time=%0t, Mode=%b, Op=%b, A=%b, B=%b, F=%b",
$time, Mode, Operation, A, B, F);

#10 Operation = 2'b01;
#10 Operation = 2'b10;
#10 Operation = 2'b11;
#10 A = 4'b0101;
#10 B = 4'b1010;
#10 Operation = 2'b00;
#10 Operation = 2'b01;
#10 Operation = 2'b10;
#10 Operation = 2'b11;
// Switch to Arithmetic Mode (M = 1)
#10 Mode = 1'b1;
A = 4'b0000;
B = 4'b0000;
Cin = 1'b0;
Operation = 2'b00;

// Test cases for Arithmetic Mode (M = 1)
$monitor("Time=%0t, Mode=%b, Op=%b, Cin=%b, A=%b, B=%b, F=%b, Cout=%b",

$time, Mode, Operation, Cin, A, B, F, Cout);

#10 Operation = 2'b01;
#10 Operation = 2'b10;
#10 Operation = 2'b11;
#10 A = 4'b0101;
#10 B = 4'b1010;
#10 Operation = 2'b00;
#10 Operation = 2'b01;
#10 Operation = 2'b10;
#10 Operation = 2'b11;
#10 Cin = 1'b1;
#10 Operation = 2'b00;
#10 Operation = 2'b01;
#10 Operation = 2'b10;
#10 Operation = 2'b11;
$finish;
end
endmodule