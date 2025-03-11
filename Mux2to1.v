module Mux2to1 #(
    parameter size = 32
) 
(
    input sel,                      // Selector
    input signed [size-1:0] s0,     // Input 0
    input signed [size-1:0] s1,     // Input 1
    output reg signed [size-1:0] out 
);
    always @(*) begin
        case (sel)
            1'b0: out = s0;  
            1'b1: out = s1;  
            default: out = {size{1'b0}}; 
        endcase
    end
endmodule