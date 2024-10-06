`include "gates.v"
module mux41_st(
    input i0, i1, i2, i3, s0, s1,
    output y
);
    wire n1, n2;
    wire y1, y2, y3, y4;
    wire w1, w2, w3, w4;
    wire c1, c2;

    // Generate inverted select signals
    not_gate_df not1(.a(s0), .y(n1));
    not_gate_df not2(.a(s1), .y(n2));

    // Generate intermediate AND gate outputs
    and_gate_df and1(.a(n1), .b(n2), .y(y1));
    and_gate_df and2(.a(n2), .b(s0), .y(y2));
    and_gate_df and3(.a(n1), .b(s1), .y(y3));
    and_gate_df and4(.a(s0), .b(s1), .y(y4));

    // Combine intermediate AND gate outputs with input signals
    and_gate_df and5(.a(y1), .b(i0), .y(w1));
    and_gate_df and6(.a(y2), .b(i1), .y(w2));
    and_gate_df and7(.a(y3), .b(i2), .y(w3));
    and_gate_df and8(.a(y4), .b(i3), .y(w4));

    // Combine all AND gate outputs to generate final output
    or_gate_df or1(.a(w1), .b(w2), .y(c1));
    or_gate_df or2(.a(w3), .b(w4), .y(c2));
    or_gate_df or3(.a(c1), .b(c2), .y(y));

endmodule
