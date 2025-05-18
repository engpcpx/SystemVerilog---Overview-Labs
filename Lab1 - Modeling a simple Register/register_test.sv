/*
Lab 1 - Modeling a Simple Register Testbech
        Objective: 
                Verify the functionality of the "register" design by running a simulation using 
                the testbench provided in the "register_test.sv" file.
                There's no need for a clock generator since this is a purely combinational design.
                
                When the test passes, copy the register.sv file into the ../sv_src directory.
                You will use it later for the complete VeriRISC design lab.
        Test Coverage:
                You should see the following results:
                1 time=0.0 ns i_enable=x i_rst_=1 i_data=xx out=xx
                2 time=15.0 ns i_enable=x i_rst_=0 i_data=xx out=00
                3 time=25.0 ns i_enable=0 i_rst_=1 i_data=xx out=00
                4 time=35.0 ns i_enable=1 i_rst_=1 i_data=aa out=aa
                5 time=45.0 ns i_enable=0 i_rst_=1 i_data=55 out=aa
                6 time=55.0 ns i_enable=x i_rst_=0 i_data=xx out=00
                7 time=65.0 ns i_enable=0 i_rst_=1 i_data=xx out=00
                7 time=75.0 ns i_enable=1 i_rst_=1 i_data=55 out=55
                8 time=85.0 ns i_enable=0 i_rst_=1 i_data=aa out=55
                REGISTER TEST PASSED              
*/

//----------------------------------------------------------
// Testbench for register.sv
//----------------------------------------------------------
`timescale 1ns/1ps
module register_test();
    // Signal declarations
    
    logic       i_clk;
    logic       i_rst_n;
    logic       i_enable;
    logic [7:0] i_data;
    logic [7:0] out;

    //-----------------------------------------
    // Instantiate register
    //-----------------------------------------
    register u_register (
        .i_clk(i_clk),
        .i_rst_n(i_rst_n),
        .i_enable(i_enable),
        .i_data(i_data),
        .out(out)
    );

    //-----------------------------------------
    // Clock generation (20ns period)
    //----------------------------------------
    initial begin
        i_clk = 0;
        forever #10 i_clk = ~i_clk;
    end

//-----------------------------------------
// Test sequence
//-----------------------------------------
initial begin
    // Test 1 - Initial state
    // time=0.0 ns i_enable=x i_rst_=1 i_data=xx out=xx
    i_rst_n  = 1;
    i_enable = 'x;
    i_data   = 'x;
    $display("1 time=%0.1f ns i_enable=%b i_rst_n=%b i_data=%h out=%h", 
            $time, i_enable, i_rst_n, i_data, out);

    //-----------------------------------------
    // Test 2 - Reset active
    // time=15.0 ns i_enable=x i_rst_=0 i_data=xx out=00
    //-----------------------------------------------
    #15; 
    i_rst_n = 0;  
    $display("2 time=%0.1f ns i_enable=%b i_rst_n=%b i_data=%h out=%h", 
            $time, i_enable, i_rst_n, i_data, out);
    
    //-----------------------------------------
    // Test 3 - Reset inactive, i_enable=0
    // time=25.0 ns i_enable=0 i_rst_=1 i_data=xx out=00
    //-----------------------------------------------
    #10; 
    i_rst_n = 1; 
    i_enable = 0; 
    $display("3 time=%0.1f ns i_enable=%b i_rst_n=%b i_data=%h out=%h", 
            $time, i_enable, i_rst_n, i_data, out);
    
    //-----------------------------------------
    // Test 4 - i_enable active, i_data=AA
    // time=35.0 ns i_enable=1 i_rst_=1 i_data=aa out=aa
    //-----------------------------------------------
    #10; 
    i_enable = 1; 
    i_data = 8'hAA;  
    $display("4 time=%0.1f ns i_enable=%b i_rst_n=%b i_data=%h out=%h", 
            $time, i_enable, i_rst_n, i_data, out);

    //-----------------------------------------
    // Test 5 - i_enable inactive, i_data changes to 55
    // time=45.0 ns i_enable=0 i_rst_=1 i_data=55 out=aa
    //-----------------------------------------------
    #10; 
    i_enable = 0; 
    i_data = 8'h55;  
    $display("5 time=%0.1f ns i_enable=%b i_rst_n=%b i_data=%h out=%h", 
            $time, i_enable, i_rst_n, i_data, out);

    //-----------------------------------------
    // Test 6 - Reset active, signals undefined
    // time=55.0 ns i_enable=x i_rst_=0 i_data=xx out=00
    //-----------------------------------------------
    #10; 
    i_rst_n = 0; 
    i_enable = 'x; 
    i_data = 'x; 
    $display("6 time=%0.1f ns i_enable=%b i_rst_n=%b i_data=%h out=%h", 
            $time, i_enable, i_rst_n, i_data, out);

    //-----------------------------------------
    // Test 7 - Reset inactive, i_enable=0
    // time=65.0 ns i_enable=0 i_rst_=1 i_data=xx out=00
    //-----------------------------------------------
    #10; 
    i_rst_n = 1; 
    i_enable = 0;  
    $display("7 time=%0.1f ns i_enable=%b i_rst_n=%b i_data=%h out=%h", 
            $time, i_enable, i_rst_n, i_data, out);

    //-----------------------------------------
    // Test 8 - i_enable active, i_data=55
    // time=75.0 ns i_enable=1 i_rst_=1 i_data=55 out=55
    //-----------------------------------------------
    #10; 
    i_enable = 1; 
    i_data = 8'h55;  
    $display("8 time=%0.1f ns i_enable=%b i_rst_n=%b i_data=%h out=%h", 
            $time, i_enable, i_rst_n, i_data, out);

    //-----------------------------------------
    // Test 9 - i_enable inactive, i_data changes to AA
    // time=85.0 ns i_enable=0 i_rst_=1 i_data=aa out=55
    //-----------------------------------------------
    #10; 
    i_enable = 0; 
    i_data = 8'hAA;  
    $display("9 time=%0.1f ns i_enable=%b i_rst_n=%b i_data=%h out=%h", 
            $time, i_enable, i_rst_n, i_data, out);

    //-----------------------------------------
    // Final verification
    //-----------------------------------------
    #10;
    if (out === 8'h55) begin
        $display("REGISTER TEST PASSED");
    end else begin
        $display("REGISTER TEST FAILED (out=%h, expected 55)", out);
    end
    $finish;
end
endmodule