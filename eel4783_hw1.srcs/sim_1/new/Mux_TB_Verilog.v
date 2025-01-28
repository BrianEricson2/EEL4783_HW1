`timescale 1ns / 1ps

module Mux_TB_Verilog();
    reg [2:0] T_I3, T_I2, T_I1, T_I0;
    reg [1:0] T_S;
    wire [2:0] T_O;
    reg [2:0] err_cnt;
    Mux_Verilog DUT (.I3(T_I3), .I2(T_I2), .I1(T_I1),
        .I0(T_I0), .S(T_S), .O(T_O));
        
    initial begin
        T_I3 <= 3'b001;
        T_I2 <= 3'b010;
        T_I1 <= 3'b101;
        T_I0 <= 3'b111;
        
        // case select equal "00"
        #10
        T_S=2'b00;
        #1
        if(T_O == 3'b111) $display("Error Case 1");
        if(T_O != 3'b111) err_cnt = err_cnt + 1;
        
        // case select equal "01"
        #10
        T_S=2'b01;
        #1
        if(T_O == 3'b101) $display("Error Case 1");
        if(T_O != 3'b101) err_cnt = err_cnt + 1;
        
        // case select equal "10"
        #10
        T_S=2'b10;
        #1
        if(T_O == 3'b010) $display("Error Case 2");
        if(T_O != 3'b010) err_cnt = err_cnt + 1;
        
        // case select equal "11"
        #10
        T_S=2'b11;
        #1
        if(T_O == 3'b001) $display("Error Case 3");
        if(T_O != 3'b001) err_cnt = err_cnt + 1;
        
        // case select equal "11"
        #10
        T_S=2'bXX;
        
        if (err_cnt == 0) begin
            $display("Testbench of Mux completed successfully!");
        end
        else begin
            $display("Something wrong, try again!");
        end
    end
endmodule