module alu4 (
input [3:0] A,
input [3:0] B,
input Cin, // Carry in
input [1:0] Operation, // Operation Select (S1, S0)
input Mode, // Mode Select (M)
output [3:0] F, // Result
output Cout // Carry out
);
reg [3:0] result;
reg carry_out;
always @(*) begin // Combinational logic
case (Mode)
1'b0: begin // Logic operations
case (Operation)
2'b00: result = A & B; // AND
2'b01: result = A | B; // OR
2'b10: result = A ^ B; // XOR
2'b11: result = ~(A ^ B); // XNOR
endcase
carry_out = 1'b0; // No carry out for logic operations
end
1'b1: begin // Arithmetic operations
case ({Operation, Cin})
3'b000: result = A; // Transfer A
3'b001: {carry_out, result} = A + 1'b1; // Increment A by 1
3'b010: {carry_out, result} = A + B; // Add A and B
3'b011: {carry_out, result} = A + B + 1'b1; // Increment sum of A and B by 1
3'b100: {carry_out, result} = A + (~B); // A plus one's complement of B
3'b101: {carry_out, result} = A + (~B); // Subtract B from A (A - B)
3'b110: {carry_out, result} = (~A) + B; // B plus one's complement of A
3'b111: {carry_out, result} = (~A) + B + 1'b1; // B minus A (B - A)
endcase
end
endcase
end
assign F = result;
assign Cout = carry_out;
endmodule