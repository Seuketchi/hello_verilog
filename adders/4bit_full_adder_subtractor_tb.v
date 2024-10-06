`include "4bit_full_adder_subtractor_st.v"
module four_bit_full_adder_subtractor_tb();

    // Inputs
    reg [3:0] A, B;
    reg Cin;
    reg Control;

    // Outputs
    wire [3:0] Result;
    wire Cout;

    four_bit_full_adder_subtractor_st as1 (
        .a(A),
        .b(B),
        .cin(Cin),
        .control(Control),
        .result(Result),
        .cout(Cout)
    );


    // Test stimulus
    initial begin

        $display("Time\t a    b    c c r    o");
        $monitor("%g\t %b %b %b %b %b %b",
            $time, A, B, Cin, Control, Result, Cout);
        A = 4'b0000; B = 4'b0000; Cin = 0; Control = 0;
        // Test 1: Add 4'b0101 (5) + 4'b0011 (3) -> Expected Result = 4'b1000 (8)
        #10 A = 4'b0101; B = 4'b0011; Cin = 0; Control = 0;
        
        // Test 2: Add 4'b1111 (15) + 4'b0001 (1) with Cin = 1 -> Expected Result = 4'b0001 (carry = 1)
        #10 A = 4'b1111; B = 4'b0001; Cin = 1; Control = 0;
        
        // Test 3: Subtract 4'b0110 (6) - 4'b0011 (3) -> Expected Result = 4'b0011 (3)
        #10 A = 4'b0110; B = 4'b0011; Cin = 0; Control = 1;
        
        // Test 4: Subtract 4'b1000 (8) - 4'b0001 (1) with Bin = 1 -> Expected Result = 4'b0110 (6)
        #10 A = 4'b1000; B = 4'b0001; Cin = 1; Control = 1;
        
        // Test 5: Add 4'b0111 (7) + 4'b0111 (7) -> Expected Result = 4'b1110 (14)
        #10 A = 4'b0111; B = 4'b0111; Cin = 0; Control = 0;
        
        // Test 6: Subtract 4'b1010 (10) - 4'b0110 (6) -> Expected Result = 4'b0100 (4)
        #10 A = 4'b1010; B = 4'b0110; Cin = 0; Control = 1;
        
        // Test 7: Add 4'b1001 (9) + 4'b0110 (6) -> Expected Result = 4'b1111 (15)
        #10 A = 4'b1001; B = 4'b0110; Cin = 0; Control = 0;
        
        // Test 8: Subtract 4'b0100 (4) - 4'b1001 (9) -> Expected Result = Borrow out
        #10 A = 4'b0100; B = 4'b1001; Cin = 0; Control = 1;
        
        // End simulation
        #10 $finish;

    end

endmodule