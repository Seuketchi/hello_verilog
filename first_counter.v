module first_counter (
    clock ,
    reset ,
    enable ,
    counter_out
);

input clock ;
input reset ;
input enable ;

output [3:0] counter_out ;

wire clock ;
wire reset ;
wire enable ;

reg [3:0] counter_out ;

always @(posedge clock) //only increment counter on rising edge of clock
begin : COUNTER 
    if (reset == 1'b1) begin //rest is pressed or reset is at 1
        counter_out <= #1 4'b0000; //reset counter to 0
    end
    else if (enable == 1'b1) begin //enable is pressed
        counter_out <= #1 counter_out + 1; 
    end
end

endmodule
