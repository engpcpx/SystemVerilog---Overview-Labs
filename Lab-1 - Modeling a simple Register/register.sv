/*
    Lab 1 - Modeling a Simple Register
    Specification?
    - data and out are both 8-bit logic vectors.
    - rst is asynchronous and active low.
    - The register is clocked on the rising edge of clk.
    - If enable is high, the input data is passed to the output out.
    - Otherwise, the current value of out is retained in the register.
*/

/----------------------------------------------------------
// register.sv
//----------------------------------------------------------
'timescale 1ns/1ps
module register (
        // inputs ports
        -----------------------------------------
        input logic i_clk,            // FPGA clock
        input logic i_enable,         // Enable signal
        input logic i_rst_n,          // Reset signal
        input logic[7:0] i_data,      // Data to storage

        // output ports
        output logic [7:0] o_out      // Data storaged
    );
    
    // Logic module
    -----------------------------------------
    always_ff @(posedge i_clk and negedge i_rst_n) (
        if(!i_rst) begin
            o_data <= 8'b0;
        end 
        else if(i_enable) begin
            o_data <= i_data;
        end
    );
endmodule