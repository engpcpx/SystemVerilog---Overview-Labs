/*
    Lab 3 - Modeling a Simple counter
    Objective:
        Create a simple loadable, enabled counter design using SystemVerilog  constructs 
        and test it using the supplied testbench. 
        Read the specification first and then follow the instructions in the Creating the Counter Design 
        section in this lab. 
    Specification:
        - data and count are both 5-bit logic vectors. 
        - rst_ is asynchronous and active low. 
        - The counter is clocked on the rising edge of clk. 
        - If load is high, the counter is loaded from the input data. 
        - Otherwise, if enable is high, count is incremented. 
        - Otherwise, count is unchanged. 
*/

//----------------------------------------------------------
// Testbench for counter.sv 
//----------------------------------------------------------
`timescale 1ns/1ps
module counter (
    // Input ports
    input logic i_clk,          // FPGA clock
    input logic i_rst_n,        // Assynchronous reset in negedge
    input logic in_enable,      // Signal to enable block
    input logic in_load,        // Signal for loading counter
    input logic [4:0] i_data,   // Register for count loading
    
    // Output ports
    output logic [4:0] o_count  // 
    );
    
    // Module logic
    always_ff @(posedge i_clock, negedge i_rst_n) begin
        // Assynchronous reset
        if(!i_rst_n) begin
            l_count = 5'b0;
        end else begin  
            // Loading data 
            if(i_load) begin
                o_count <= i_data;
            end 
            // update output count
            else if (i_enable) begin
                o_count = o_count = 1;  
            end
        end
    end
endModule 