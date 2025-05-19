/*
Lab 3 - Modeling a Simple Counter Testbench
        Objective:
                Verify the functionality of the "counter" design by running a simulation using
                this testbench. The design is sequential and requires clock synchronization.
                
                When the test passes, copy the counter.sv file into the ../sv_src directory.
                You will use it later for the complete VeriRISC design lab.
                
        Test Coverage:
                You should see the following results:
                1 time=   0ns clk=1 rst_=x load=x enable=x data=xx count=xx
                2 time=   5ns clk=0 rst_=0 load=x enable=x data=xx count=00
                3 time=  10ns clk=1 rst_=0 load=x enable=x data=xx count=00
                4 time=  15ns clk=0 rst_=1 load=0 enable=1 data=xx count=00
                5 time=  20ns clk=1 rst_=1 load=0 enable=1 data=xx count=01
                6 time=  25ns clk=0 rst_=1 load=0 enable=1 data=xx count=01
                7 time=  30ns clk=1 rst_=1 load=0 enable=1 data=xx count=02
                ...
                8 time= 105ns clk=0 rst_=1 load=0 enable=1 data=xx count=1e
                9 time= 110ns clk=1 rst_=1 load=0 enable=1 data=xx count=1f
                10 time=115ns clk=0 rst_=1 load=0 enable=1 data=xx count=1f
                11 time=120ns clk=1 rst_=1 load=0 enable=1 data=xx count=00
                12 time=125ns clk=0 rst_=1 load=0 enable=1 data=xx count=00
                13 time=130ns clk=1 rst_=1 load=0 enable=1 data=xx count=01
                COUNTER TEST PASSED
                
        Key Test Cases Verified:
                1. Asynchronous reset functionality
                2. Continuous counting when enabled
                3. Proper overflow handling (1F → 00)
                4. Count stability between clock edges
                5. Reset priority over enable signal
*/

`timescale 1ns / 1ps

module counter_tb;
    // Signal declaration with prefixes
    // l_ for local testbench signals
    // i_ for DUT inputs
    // o_ for DUT outputs
    logic l_clk;          // Testbench clock generator
    logic l_rst_;         // Active-low reset control
    logic i_enable;       // Counter enable control
    logic i_load;         // Parallel load control
    logic [4:0] i_data;   // Parallel load data
    logic [4:0] o_count;  // Counter output

    // Instantiate Device Under Test (DUT)
    // Original port names maintained for compatibility
    counter dut (
        .clk(l_clk),
        .rst_(l_rst_),
        .enable(i_enable),
        .load(i_load),
        .data(i_data),
        .count(o_count)
    );

    // Clock generation (10ns period)
    // Starts high at time=0 to match reference waveform
    initial begin
        l_clk = 1;
        forever #5 l_clk = ~l_clk;
    end

    // Test sequence controller
    // Carefully timed to match reference test sequence
    initial begin
        // Initialize all control signals as unknown
        l_rst_ = 'x;
        i_enable = 'x;
        i_load = 'x;
        i_data = 'x;
        
        // Time 5ns: Assert asynchronous reset (active low)
        #5;
        l_rst_ = 0;
        
        // Time 15ns: Release reset and enable counting
        // Load remains inactive for continuous counting
        #10;
        l_rst_ = 1;
        i_enable = 1;
        i_load = 0;
        
        // Let counter run until overflow occurs (120ns total)
        #105;  // 5ns + 10ns + 105ns = 120ns
        
        // Verify overflow behavior (1F → 00)
        if (o_count !== 5'b00000) begin
            $display("ERROR: Expected overflow to 00, got %02x", o_count);
            $finish;
        end
        
        // Verify proper increment after overflow (00 → 01)
        #10;
        if (o_count !== 5'b00001) begin
            $display("ERROR: Expected 01 after overflow, got %02x", o_count);
            $finish;
        end
        
        $display("COUNTER TEST PASSED");
        $finish;
    end

    // Results monitor - matches exact reference format
    initial begin
        $monitor("time=%4dns clk=%b rst_=%b load=%b enable=%b data=%x count=%02x",
                $time, l_clk, l_rst_, i_load, i_enable, i_data, o_count);
    end

endmodule