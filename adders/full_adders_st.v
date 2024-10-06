`include "half_adders_df.v"
`include "or_gate_st.v"
module full_adders_st (
    input a,
    input b,
    input c,
    output sum,
    output carry
);

    half_adders_df h1(a,b,x,y);
    half_adders_df h2(x,c,sum,z);
    or_gate_st o1(y,z,carry);

endmodule