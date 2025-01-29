`timescale 1ns / 1ps

module Decoder_TB_Verilog(

    );
    
    reg [1:0] T_I;
    wire [2:0] T_O;
    reg [2:0] err_cnt;
    Decoder_Verilog DUT (.I(T_I), .O(T_O));
        
    initial begin
        T_I = 2'b00;
        
        // case select equal "00"
        #10
        T_I=2'b00;
        #1
        if(T_O == 4'b0001) $display("Error Case 1");
        if(T_O != 4'b0001) err_cnt = err_cnt + 1;
        
        // case select equal "01"
        #10
        T_I=2'b01;
        #1
        if(T_O == 4'b0010) $display("Error Case 1");
        if(T_O != 4'b0010) err_cnt = err_cnt + 1;
        
        // case select equal "10"
        #10
        T_I=2'b10;
        #1
        if(T_O == 4'b0100) $display("Error Case 2");
        if(T_O != 4'b0100) err_cnt = err_cnt + 1;
        
        // case select equal "11"
        #10
        T_I=2'b11;
        #1
        if(T_O == 4'b1000) $display("Error Case 3");
        if(T_O != 4'b1000) err_cnt = err_cnt + 1;
        
        // case select equal "11"
        #10
        T_I=2'bXX;
        
        if (err_cnt == 0) begin
            $display("Testbench of Mux completed successfully!");
        end
        else begin
            $display("Something wrong, try again!");
        end
    end
endmodule