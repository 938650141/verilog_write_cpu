`include "defines.v"
module pc_reg(
    input wire clk,
    input wire rst,
    output reg[`InstAddrBus] pc,
    output reg ce
);
    always@(posedge clk) begin
        if(rst==`RstEnable) ce<=`ChipDisable;
        else ce<=`ChipEnable;
    end

    always@(posedge clk) begin
        if(ce==`ChipDisable) pc<=32'h00000000;
        else pc<=pc+4'h4;
    end
endmodule