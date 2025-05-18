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
**/

/**
Functional Diagram

               +-----------------------+
               |                       |
               |       COUNTER         |
               |                       |
i_clk -------->|                       |
i_rst_n ------>|                       |  
in_enable ---->|                       |
in_load ------>|                       |
i_data[4:0] -->|                       |
               |                       |
               |                       |
               |                       |---> o_count[4:0]
               +-----------------------+
**/

//----------------------------------------------------------
// Testbench for counter.sv 
//----------------------------------------------------------
`timescale 1ns/1ps
module counter (
    /**
     * @brief Main system clock
     * @details Standard FPGA clock input, all operations occur
     * on rising edge when enabled.
     */
    input logic i_clk,

    /**
     * @brief Asynchronous active-low reset
     * @details Resets counter to 0 when low. Takes priority over
     * all other inputs. Edge-triggered on falling edge.
     */
    input logic i_rst_n,

    /**
     * @brief Count enable control
     * @details When high, allows counter to increment each clock cycle.
     * When low, counter holds its value.
     */
    input logic in_enable,

    /**
     * @brief Parallel load control
     * @details When high, loads i_data into counter on next clock edge.
     * Has priority over count enable.
     */
    input logic in_load,

    /**
     * @brief Parallel load data
     * @details 5-bit value to load when in_load=1.
     * Only sampled when in_load is active.
     */
    input logic [4:0] i_data,

    /**
     * @brief Counter output
     * @details Current 5-bit count value. Increments when enabled,
     * loads when commanded, resets to 0 when i_rst_n=0.
     */
    output logic [4:0] o_count
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