`include "or_gate_df.v"
`include "or_gate_st.v"
`include "or_gate_bh.v"

`include "not_gate_df.v"
`include "not_gate_st.v"
`include "not_gate_bh.v"

`include "nand_gate_bh.v"
`include "nand_gate_st.v"
`include "nand_gate_df.v"

`include "nor_gate_bh.v"
`include "nor_gate_st.v"
`include "nor_gate_df.v"

`include "xnor_gate_bh.v"
`include "xnor_gate_st.v"
`include "xnor_gate_df.v"

`include "xor_gate_bh.v"
`include "xor_gate_df.v"
`include "xor_gate_st.v"

module gate_tb();


reg a,b;
wire OR, NOT, NAND, NOR, XNOR, XOR ;

initial begin
    $dumpfile("file.vcd");
    $dumpvars(0, gate_tb);

    $display ("time\t a b o n na no xno xo");
    $monitor ("%g\t %b %b %b %b %b %b %b %b",
        $time, a, b, OR, NOT, NAND, NOR, XNOR, XOR );
    // a = 1;
    // b = 0;
    // #5 a = 0;
    // #5 b = 1;
    // #5 a = 1;

    //Another way to write the above code
    a = 0;
    b = 0;
    #5 a = 1;
    #5 b = 1;
    #5 a = 0;

    #5 $finish;
end


or_gate_df U_or_gate1 (a,b,OR);
// or_gate_bh U_or_gate2 (a,b,OR);
// or_gate_st U_or_gate3 (a,b,OR);

// not_gate_bh U_not_gate1 (a,NOT);
// not_gate_st U_not_gate2 (a,NOT);
not_gate_df U_not_gate3 (a,NOT);

// nand_gate_bh U_nand_gate1 (a,b,NAND);
// nand_gate_st U_nand_gate2 (a,b,NAND);
nand_gate_df U_nand_gate3 (a,b,NAND);

// nor_gate_bh U_nor_gate1 (a,b,NOR);
// nor_gate_st U_nor_gate2 (a,b,NOR);
nor_gate_df U_nor_gate3 (a,b,NOR);

// xnor_gate_bh U_xnor_gate1 (a,b,XNOR);
// xnor_gate_st U_xnor_gate2 (a,b,XNOR);
xnor_gate_df U_xnor_gate3 (a,b,XNOR);

// xor_gate_bh U_xor_gate1 (a,b,XOR);
// xor_gate_st U_xor_gate2 (a,b,XOR);
xor_gate_df U_xor_gate3 (a,b,XOR);







endmodule