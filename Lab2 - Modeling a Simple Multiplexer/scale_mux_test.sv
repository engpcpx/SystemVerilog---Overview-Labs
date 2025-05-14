/*
    A testbench is provided in the scale_mux_test.sv file. Simulate the testbench
    and MUX design.
    You should see the following results:
    1 0ns i_in_a=00 i_in_b=00 i_sel_a=0 i_out=00
    2 1ns i_in_a=00 i_in_b=00 i_sel_a=1 i_out=00
    3 2ns i_in_a=00 i_in_b=ff i_sel_a=0 i_out=ff
    4 3ns i_in_a=00 i_in_b=ff i_sel_a=1 i_out=00
    5 4ns i_in_a=ff i_in_b=00 i_sel_a=0 i_out=00
    6 5ns i_in_a=ff i_in_b=00 i_sel_a=1 i_out=ff
    7 6ns i_in_a=ff i_in_b=ff i_sel_a=0 i_out=ff
    8 7ns i_in_a=ff i_in_b=ff i_sel_a=1 i_out=ff
    MUX TEST PASSED

    When the test passes, copy the scale_mux.sv file into the ../sv_src directory.
    You will use it later for the complete VeriRISC design lab.
*/

//----------------------------------------------------------
// Testbench for scale_mux_test.sv
//----------------------------------------------------------
`timescale 1ns/1ps
module scale_mux_test();
    logic [size] i_in_a,    // MUX input a
    logic [size] i_in_b,    // MUX input b
    logic s[1:0] i_sel_a,   // MUX selection
    logic [size] i_out      // MUX i_output


// Instantiate MUX
//----------------------------------------
scale_mux u_scale_mux (
    .i_in_a(i_in_a),    // MUX input a
    .i_in_b(i_in_b),    // MUX input b
    .i_sel_a(i_sel_a),  // MUX selection
    .i_out(i_out )      // MUX i_output
)

// Clock generation
//-----------------------------------------
initial begin
    i_clk = 0;
    forever #1 i_clk = ~i_clk;
end

// Test sequence
//-----------------------------------------

    // Test 1 - Initialization signals
    // 0ns i_in_a=00 i_in_b=00 i_sel_a=0 i_out=00
    //-----------------------------------------
    initial begin
        i_in_a = 0;
        i_in_b = 0;
        i_sel_a = 1'b0;
    end

    // Test 2
    // 1ns i_in_a=00 i_in_b=00 i_sel_a=1 i_out=00
    //-----------------------------------------


    // Test 3
    // 2ns i_in_a=00 i_in_b=ff i_sel_a=0 i_out=ff
    //-----------------------------------------

    
    // Test 4
    // 3ns i_in_a=00 i_in_b=ff i_sel_a=1 i_out=00
    //-----------------------------------------


    // Test 5
    // 4ns i_in_a=ff i_in_b=00 i_sel_a=0 i_out=00
    //-----------------------------------------


    // Test 6
    // 5ns i_in_a=ff i_in_b=00 i_sel_a=1 i_out=ff
    //-----------------------------------------


    // Test 7
    // 6ns i_in_a=ff i_in_b=ff i_sel_a=0 i_out=ff
    //-----------------------------------------


    // Test 8
    // 8 7ns i_in_a=ff i_in_b=ff i_sel_a=1 i_out=ff
    //-----------------------------------------



// Logic Testbench
//---------------------------------
#5 i_in_a <= size'b0;     /Reset all enters




endmodule