/*
Lab 1 - Modeling a Simple Register Testbech
Objective:
    Verify the functionality of the "scale_mux" design by running a simulation using 
    the testbench provided in the "scale_mux_test.sv" file.
Test Coverage:
    1 0ns i_in_a=00 i_in_b=00 i_sel_a=0 i_out=00
    2 1ns i_in_a=00 i_in_b=00 i_sel_a=1 i_out=00
    3 2ns i_in_a=00 i_in_b=ff i_sel_a=0 i_out=ff
    4 3ns i_in_a=00 i_in_b=ff i_sel_a=1 i_out=00
    5 4ns i_in_a=ff i_in_b=00 i_sel_a=0 i_out=00
    6 5ns i_in_a=ff i_in_b=00 i_sel_a=1 i_out=ff
    7 6ns i_in_a=ff i_in_b=ff i_sel_a=0 i_out=ff
    8 7ns i_in_a=ff i_in_b=ff i_sel_a=1 i_out=ff
    MUX TEST PASSED
NoTe:
    TThere's no need for a clock generator since this is a 
    purely combinational design.

*/

//----------------------------------------------------------
// Testbench for scale_mux.sv (Complete Version)
//----------------------------------------------------------
`timescale 1ns/1ps
module scale_mux_test();
    parameter size = 7;
    logic [size:0] i_in_a;    // MUX input a (8-bit)
    logic [size:0] i_in_b;    // MUX input b (8-bit)
    logic i_sel_a;            // MUX selection
    logic [size:0] i_out;     // MUX output (8-bit)

    // Instantiate MUX
    scale_mux u_scale_mux (
        .i_in_a(i_in_a),
        .i_in_b(i_in_b),
        .i_sel_a(i_sel_a),
        .i_out(i_out)
    );

    // Complete Test Sequence
    initial begin
        // -----------------------------------------
        // Test 1 - 0ns: Initial state
        // -----------------------------------------
        i_in_a = 8'h00;
        i_in_b = 8'h00;
        i_sel_a = 1'b0;
        #0; // Immediate display
        $display("1 %0tns i_in_a=%h i_in_b=%h i_sel_a=%b i_out=%h", 
                $time, i_in_a, i_in_b, i_sel_a, i_out);

        // -----------------------------------------
        // Test 2 - 1ns: Change only selection
        // -----------------------------------------
        #1;
        i_sel_a = 1'b1;
        $display("2 %0tns i_in_a=%h i_in_b=%h i_sel_a=%b i_out=%h", 
                $time, i_in_a, i_in_b, i_sel_a, i_out);

        // -----------------------------------------
        // Test 3 - 2ns: Change input B to FF
        // -----------------------------------------
        #1;
        i_in_b = 8'hFF;
        i_sel_a = 1'b0;
        $display("3 %0tns i_in_a=%h i_in_b=%h i_sel_a=%b i_out=%h", 
                $time, i_in_a, i_in_b, i_sel_a, i_out);

        // -----------------------------------------
        // Test 4 - 3ns: Select input A again
        // -----------------------------------------
        #1;
        i_sel_a = 1'b1;
        $display("4 %0tns i_in_a=%h i_in_b=%h i_sel_a=%b i_out=%h", 
                $time, i_in_a, i_in_b, i_sel_a, i_out);

        // -----------------------------------------
        // Test 5 - 4ns: Swap inputs (A=FF, B=00)
        // -----------------------------------------
        #1;
        i_in_a = 8'hFF;
        i_in_b = 8'h00;
        i_sel_a = 1'b0;
        $display("5 %0tns i_in_a=%h i_in_b=%h i_sel_a=%b i_out=%h", 
                $time, i_in_a, i_in_b, i_sel_a, i_out);

        // -----------------------------------------
        // Test 6 - 5ns: Select input A (FF)
        // -----------------------------------------
        #1;
        i_sel_a = 1'b1;
        $display("6 %0tns i_in_a=%h i_in_b=%h i_sel_a=%b i_out=%h", 
                $time, i_in_a, i_in_b, i_sel_a, i_out);

        // -----------------------------------------
        // Test 7 - 6ns: Both inputs FF, select B
        // -----------------------------------------
        #1;
        i_in_b = 8'hFF;
        i_sel_a = 1'b0;
        $display("7 %0tns i_in_a=%h i_in_b=%h i_sel_a=%b i_out=%h", 
                $time, i_in_a, i_in_b, i_sel_a, i_out);

        // -----------------------------------------
        // Test 8 - 7ns: Select input A (both FF)
        // -----------------------------------------
        #1;
        i_sel_a = 1'b1;
        $display("8 %0tns i_in_a=%h i_in_b=%h i_sel_a=%b i_out=%h", 
                $time, i_in_a, i_in_b, i_sel_a, i_out);

        // -----------------------------------------
        // Final Verification (at 8ns)
        // -----------------------------------------
        #1;
        if (i_out === 8'hFF) begin
            $display("MUX TEST PASSED");
            // Uncomment to automatically copy on success:
            // $system("cp scale_mux.sv ../sv_src/");
        end else begin
            $display("MUX TEST FAILED (i_out=%h, expected FF)", i_out);
        end
        
        $finish;
    end
endmodule