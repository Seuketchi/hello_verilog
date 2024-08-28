`include "and_gate.v"
module complex_and_gate(
    input a,
    input b,
    input c,
    input d,
    output e,
    output f,
    output y
);

    and_gate U_and_gate1 (
        a,
        b,
        e
    );
    and_gate U_and_gate2 (
        c,
        d,
        f
    );


endmodule