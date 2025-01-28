`timescale 1ns / 1ps

module Mux_Verilog(
    input [2:0] I3, I2, I1, I0,
    input [1:0] S,
    output [2:0] O
    );
    
    assign O = (S == 0)? I0 :
                (S == 1)? I1 :
                (S == 2)? I2 :
                (S == 3)? I3 : 3'bZZZ;
    
endmodule