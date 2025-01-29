`timescale 1ns / 1ps

module Decoder_Verilog(
    input [1:0] I,
    output reg [3:0] O
    );
    
    always@*
    begin
        case(I)
            2'b00: O <= 4'b0001;
            2'b01: O <= 4'b0010;
            2'b10: O <= 4'b0100;
            2'b11: O <= 4'b1000;
            default:
                O <= 4'b0000;
        endcase
    end
endmodule
