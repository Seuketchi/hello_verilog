module mux21_df(
    input i0,i1,s,
    output y
);

assign y =(i0&(~s))|(i1&s);



endmodule