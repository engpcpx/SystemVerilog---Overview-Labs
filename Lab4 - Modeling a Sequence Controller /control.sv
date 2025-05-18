/*
    Lab4 - Modeling a Sequence Controller 
    Objective:
        To use SystemVerilog user-defined types, procedural statements, and 
        operators to model a state machine. 
        Create an FSM Sequence Controller design using SystemVerilog constructs and test it using the 
        supplied testbench.  
        Read the specification first and then follow the instructions in the lab section Creating the Controller 
        Design. 
    Specification:
        - The controller is clocked on the rising edge of clk. 
        - rst_ is asynchronous and active low. 
        - opcode is a 3-bit logic input for the CPU operation code as follows:  
 
        Opcode  Encoding  CPU Operation 
        HLT  000  Halt 
        SKZ  001  Skip if zero==1 
        ADD  010  data + accumulator 
        AND  011  data & accumulator 
        XOR  100  data ^ accumulator 
        LDA  101  Load accumulator 
        STO  110  Store accumulator 
        JMP  111  Jump to address 

        - zero is a logic input that is 1 when the CPU accumulator is zero and 0 otherwise. 
        - There are 7 logic outputs as follows: 

        Output      Function 
        mem_rd      memory read 
        load_ir     load instruction register 
        halt        halt 
        inc_pc      increment program counter 
        load_ac     load accumulator 
        load_pc     load program counter 
        mem_wr      memory write 
 
        - The controller has 8 states. State transitions are unconditional, i.e., the controller 
        passes through the same 8-state sequence, from INST_ADDR to STORE, every 8 clk 
        cycles. The reset state is INST_ADDR. 
 
    Note:
        The flow schem of Machine State ca be viewed on the documentation, 

*/

//----------------------------------------------------------
// Testbench for control.sv 
//----------------------------------------------------------
`timescale 1ns/1ps
module control (
    // input ports
    

    // output ports

);

endmodule

