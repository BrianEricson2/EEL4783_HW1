`timescale 1ns / 1ps

module Decoder_Verilog(
    input [1:0] I,
    output reg [3:0] O
    );
    
    always@*
    begin
        case(I)
            2'b00: begin
                O <= 4'b0001;
                break;
            end
            2'b01: begin
                O <= 4'b0010;
                break;
            end
            2'b10: begin
                O <= 4'b0100;
                break;
            end
            2'b11: begin
                O <= 4'b1000;
                break;
            end
            default:
                O <= 4'b0000;
        endcase
    end
endmodule
