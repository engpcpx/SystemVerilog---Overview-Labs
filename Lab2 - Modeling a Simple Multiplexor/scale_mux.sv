/*
    Lab 2Modeling a Simple Multiplexor
    Objective:
        To use SystemVerilog procedural constructs to model a simple     multiplexor.
        This is a simple multiplexor design using SystemVerilog constructs and test it
        using the supplied testbench.
    Specification:
        - in_a, in_b and out are all logic vectors.
        - The MUX width is parameterized with a default value of 1.
        - If sel_a is 1’b1, input in_a is passed to the output.
        - If sel_a is 1’b0, input in_b is passed to the output.
*/

//----------------------------------------------------------
// register.sv
//----------------------------------------------------------
module scale_mux #(logic size = 1) (
    // Input ports
    input logic [size] in_a,    // MUX input a
    input logic [size] in_b,    // MUX input b
    input logic s[1:0] sel_a,   // MUX selection

    // Output ports
    input output [size] out     // MUX output
)

    // Logic module
    //----------------------------------
    always_comb () (
        if(sel_a) begin
            out <= in_a;
        end
        else begin
                out <= in_b;       
        end
    );

endmodule
