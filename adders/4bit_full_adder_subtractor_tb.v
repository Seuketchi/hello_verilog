`timescale 1ns/1ps
`include "4bit_full_adder_subtractor_st.v"

module four_bit_full_adder_subtractor_st_tb;
    reg [3:0] a, b;
    reg cin, control;
    wire [3:0] result;
    wire cout;

    four_bit_full_adder_subtractor_st uut (
        .a(a), .b(b), 
        .cin(cin), 
        .control(control), 
        .result(result), 
        .cout(cout)
    );

    // Initial display
    initial begin
            $dumpfile("four.vcd");
    $dumpvars(0, four_bit_full_adder_subtractor_st_tb);
        $display("Time\t A      B      Cin   Control   Result   Cout");
    end

    // Test variables
    integer i, j, k, l;
    integer pass_count = 0, fail_count = 0;

    task check_result;
        input [3:0] a_in, b_in;
        input cin_in, control_in;
        input [3:0] expected_result;
        input expected_cout;
        begin
            #10; // Propagation delay

            // Determine expected result and cout based on control signal
            if (control_in == 0) begin // Addition mode
                {expected_cout, expected_result} = a_in + b_in + cin_in;
            end else begin // Subtraction mode
                {expected_cout, expected_result} = (cin_in == 0) ? (a_in - b_in) : (a_in - b_in - 1);
            end

            // Compare the actual result and cout with expected result
            if (result === expected_result && cout === expected_cout) begin
                pass_count = pass_count + 1;
            end else begin
                fail_count = fail_count + 1;
            end
        end
    endtask

    initial begin
        // Nested loops for comprehensive testing
        for (i = 0; i < 2; i = i + 1) begin      // control
            for (j = 0; j < 2; j = j + 1) begin  // cin
                for (k = 0; k < 16; k = k + 1) begin // a
                    for (l = 0; l < 16; l = l + 1) begin // b
                        // Set inputs
                        control = i;
                        cin = j;
                        a = k;
                        b = l;

                        // Display the test case result
                        $display("%0t\t %b   %b   %b     %b       %b     %b", $time, a, b, cin, control, result, cout);
                        
                        // Verify result
                        check_result(a, b, cin, control, 
                                     (control ? (a - b - cin) : (a + b + cin)),
                                     (control ? (a < b + cin) : (a + b + cin > 15)));
                    end
                end
            end
        end

        // Final report
        $display("\nTest Complete:");
        $display("PASS COUNT: %0d", pass_count);
        $display("FAIL COUNT: %0d", fail_count);

        $finish;
    end
endmodule
