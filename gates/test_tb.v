`include "and_gate_df.v"
`include "or_gate_df.v"
`include "xor_gate_df.v"
`include "nand_gate_df.v"
`include "nor_gate_df.v"
`include "xnor_gate_df.v"


module test_tb;

    // Inputs
    reg a, b;
    
    // Outputs
    wire out_and, out_or, out_xor, out_nand, out_nor, out_xnor;
    
    // Instantiate gates
    and_gate and_inst (.a(a), .b(b), .out(out_and));
    or_gate or_inst (.a(a), .b(b), .out(out_or));
    xor_gate xor_inst (.a(a), .b(b), .out(out_xor));
    nand_gate nand_inst (.a(a), .b(b), .out(out_nand));
    nor_gate nor_inst (.a(a), .b(b), .out(out_nor));
    xnor_gate xnor_inst (.a(a), .b(b), .out(out_xnor));
    
    // Stimulus
    initial begin
        $monitor("a=%b, b=%b, AND=%b, OR=%b, XOR=%b, NAND=%b, NOR=%b, XNOR=%b", a, b, out_and, out_or, out_xor, out_nand, out_nor, out_xnor);
        
        // Test case 1
        #10;
        a = 0; b = 0;
        
        // Test case 2
        #10;
        a = 0; b = 1;
        
        // Test case 3
        #10;
        a = 1; b = 0;
        
        // Test case 4
        #10;
        a = 1; b = 1;
        
        // End simulation
        #10;
        $finish;
    end
    
endmodule

