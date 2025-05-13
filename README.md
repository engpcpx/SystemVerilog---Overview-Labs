# 📘 SystemVerilog for Design and Verification

Welcome to the **SystemVerilog for Design and Verification** labs repository!  
This collection of hands-on labs aims to help students, engineers, and enthusiasts practice and master SystemVerilog for both **design modeling** and **functional verification**.

---

## 📚 Overview

This repository includes a total of 23 labs, progressing from simple designs to advanced verification techniques using:

- RTL modeling
- Testbenches
- Classes & polymorphism
- Randomization
- Functional coverage
- Assertions
- Synchronization with processes

Each lab is structured with design files, testbenches, and simulation commands to practice core concepts of SystemVerilog.

---

## 📁 Labs Index

| Lab | Title | Description |
|-----|-------|-------------|
| 1 | Simple Register | Design and simulate a basic register |
| 2 | Simple Multiplexor | Create and verify a 2:1 MUX |
| 3 | Simple Counter | Model a counter with reset and enable |
| 4 | Sequence Controller | FSM-based sequence control logic |
| 5 | Arithmetic Logic Unit | ALU with basic operations |
| 6 | Memory Module | Testing memory read/write |
| 7 | Memory Interface | Memory interface design and test |
| 8 | VeriRISC CPU | Full CPU testbench and diagnostics |
| 9 | Clocking Block | Use of `clocking` blocks |
|10 | Scope Randomization | Scope-based random constraints |
|11 | Using Classes | Class definition, constructors, static elements |
|12 | Class Polymorphism | Inheritance and virtual methods |
|13 | Class-Based Randomization | Constraint randomization with classes |
|14 | Virtual Interfaces | Virtual interfaces across components |
|15 | Covergroup Coverage | Define and analyze covergroups |
|16 | Cross Coverage | Coverage model for ALU |
|17 | Arrays & Queues | Dynamic, associative, queue data structures |
|18 | Implication Assertions | Assertions using implication operator |
|19 | Sequence Properties | Simple and complex sequence properties |
|20 | Simple DPI Use | Intro to DPI (Direct Programming Interface) |
|21 | Mailbox Sync | Synchronize processes using mailbox |
|22 | Semaphore Sync | Semaphore-based process control |
|23 | Event Sync | Sync and race condition resolution with events |

---

## 💾 Requirements

To run these labs, you will need:

- A SystemVerilog-compatible simulator (e.g., ModelSim, QuestaSim, Synopsys VCS, etc.)
- A code/text editor (VS Code recommended)
- Basic shell or command-line access

---

## ▶️ Running the Labs

Each lab directory contains:
- `*.sv` design files
- `*_tb.sv` testbench
- Simulation instructions or scripts

Example (using ModelSim):

```bash
cd lab01_register
vlog register.sv register_tb.sv
vsim -c -do "run -all" register_tb
