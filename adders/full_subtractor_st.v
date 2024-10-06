`include "half_subtractor_st.v"
`include "or_gate_st.v"
module full_subtractor_st (
    input a,
    input b,
    input c,
    output difference,
    output borrow
);
    half_subtractor_st s1(a,b,x,y);
    half_subtractor_st s2(x,c,difference,z);
    or_gate_st o1(y,z,borrow);
    

endmodule