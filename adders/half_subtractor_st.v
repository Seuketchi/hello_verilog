`include "not_gate_st.v"
`include "xor_gate_st.v"
`include "and_gate_st.v"
module half_subtractor_st (
    input a,
    input b,
    output difference,
    output borrow
);


xor_gate_st x1(a,b,difference);
not_gate_st n1(a,x);
and_gate_st a1(x,b,borrow);

    
endmodule