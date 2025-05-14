/*
    Lab 1 - Modeling a Simple Register Testbech
    Testing the Register Design
    A testbench must be provided in the file register_test.sv. Simulate the testbench
    and register design.
    You should see the following results:
    time=0.0 ns enable=x rst_=1 data=xx out=xx
    time=15.0 ns enable=x rst_=0 data=xx out=00
    time=25.0 ns enable=0 rst_=1 data=xx out=00
    time=35.0 ns enable=1 rst_=1 data=aa out=aa
    time=45.0 ns enable=0 rst_=1 data=55 out=aa
    time=55.0 ns enable=x rst_=0 data=xx out=00
    time=65.0 ns enable=0 rst_=1 data=xx out=00
    time=75.0 ns enable=1 rst_=1 data=55 out=55
    time=85.0 ns enable=0 rst_=1 data=aa out=55
    REGISTER TEST PASSED
   
    When the test passes, copy the register.sv file into the .
*/

//----------------------------------------------------------
// Testbench for register.sv
//----------------------------------------------------------
`timescale 1ns/1ps
module register_test();
    // Signal declarations
    
    logic       clk;
    logic       rst_n;
    logic       enable;
    logic [7:0] data;
    logic [7:0] out;

    // Instantiate the register
    //-----------------------------------------
    register u_register (
        .clk(clk),
        .rst_n(rst_n),
        .enable(enable),
        .data(data),
        .out(out)
    );

    // Clock generation (20ns period)
    //----------------------------------------
    initial begin
        clk = 0;
        forever #10 clk = ~clk;
    end

    // Test sequence
    //-----------------------------------------
    initial begin
        // Initialize signals
        //-----------------------------------------
        rst_n  = 1;
        enable = 'x;
        data   = 'x;
        $display("time=%0.1f ns enable=%b rst_n=%b data=%h out=%h", 
                $time, enable, rst_n, data, out);

        // Test 1
        //-----------------------------------------
        #15; rst_n = 0;  
        $display("time=%0.1f ns enable=%b rst_n=%b data=%h out=%h", 
                $time, enable, rst_n, data, out);
        
        // Test 2
        //-----------------------------------------
        #10; rst_n = 1; enable = 0; 
        $display("time=%0.1f ns enable=%b rst_n=%b data=%h out=%h", 
                $time, enable, rst_n, data, out);
        
        // Test 3
        //-----------------------------------------
        #10; enable = 1; data = 8'hAA;  
        $display("time=%0.1f ns enable=%b rst_n=%b data=%h out=%h", 
                $time, enable, rst_n, data, out);

        // Test 4
        //-----------------------------------------
        #10; enable = 0; data = 8'h55;  
        $display("time=%0.1f ns enable=%b rst_n=%b data=%h out=%h", 
                $time, enable, rst_n, data, out);

        // Test 5
        //-----------------------------------------
        #10; rst_n = 0; enable = 'x; data = 'x; 
        $display("time=%0.1f ns enable=%b rst_n=%b data=%h out=%h", 
                $time, enable, rst_n, data, out);

        // Test 
        //-----------------------------------------
        #10; rst_n = 1; enable = 0;  
        $display("time=%0.1f ns enable=%b rst_n=%b data=%h out=%h", 
                $time, enable, rst_n, data, out);

        // Test 7
        //-----------------------------------------
        #10; enable = 1; data = 8'h55;  
        $display("time=%0.1f ns enable=%b rst_n=%b data=%h out=%h", 
                $time, enable, rst_n, data, out);

        // Test 8
        //-----------------------------------------
        #10; enable = 0; data = 8'hAA;  
        $display("time=%0.1f ns enable=%b rst_n=%b data=%h out=%h", 
                $time, enable, rst_n, data, out);

        
        // Final check and copy file if test passes
        //----------------------------------------
        if (out === 8'h55) begin
            $display("REGISTER TEST PASSED");
            $system("cp register.sv ../sv_src/");  // Copy on success
        end else begin
            $display("REGISTER TEST FAILED (out=%h, expected 55)", out);
        end
        #10 $finish;
    end
endmodule