module full_adders_bh(
    input a,
    input b,
    input c,
    output reg sum,
    output reg carry
);

always @(*) begin
    sum = a ^ b ^c;
    carry = (a & b) | ((a ^ b) & c);
end

endmodule