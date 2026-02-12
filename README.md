# EC9032 — FPGA Based Design

Course repository for **EC9032 (PEL)**, *M.Tech. Programme*,  
Department of Electronics & Communication Engineering.

This repository contains lecture materials, lab experiments, HDL codes, FPGA board implementation examples, and mini-projects related to FPGA-based digital system design.

---

## 📘 Course Overview

This course focuses on practical FPGA implementation of digital systems using HDL (Verilog/VHDL), synthesis tools, and hardware validation.

### Key Learning Objectives
- Understand FPGA architecture and design flow
- Develop synthesizable HDL designs
- Implement digital systems on FPGA boards
- Perform simulation, synthesis, and timing analysis
- Interface peripherals (Seven-segment display, UART, memory, etc.)
- Develop FSM-based and datapath-based architectures
- Debug and validate hardware designs

---

## 📂 Repository Structure

```text
EC9032_FPGA_DESIGN/
├── Syllabus.pdf
├── Lecture_Notes/
│   ├── FPGA_Introduction.pdf
│   ├── Design_Flow.pdf
│   ├── Timing_Analysis.pdf
│   └── ...
├── HDL_Codes/
│   ├── Combinational/
│   ├── Sequential/
│   ├── FSM/
│   ├── Counters/
│   └── Arithmetic_Units/
├── Lab_Experiments/
│   ├── Seven_Segment_Display/
│   ├── UART/
│   ├── Memory_Interface/
│   ├── Clock_Divider/
│   └── ...
├── Mini_Projects/
│   ├── MAC_Unit/
│   ├── GCD/
│   ├── FIFO/
│   ├── Moving_Average_Filter/
│   └── ...
└── XDC_Constraints/
    ├── Basys3.xdc
    ├── Spartan7.xdc
    └── ...
```

---

## 🛠 Recommended Tools

### Simulation
- Icarus Verilog + GTKWave  
- ModelSim / QuestaSim  
- Vivado Simulator  

### Synthesis & Implementation
- Xilinx Vivado (Recommended: 2022.x or later)

---



### 3️⃣ Vivado Flow
1. Create New Project
2. Add HDL source files
3. Add constraints (.xdc)
4. Run Synthesis
5. Run Implementation
6. Generate Bitstream
7. Program FPGA board

---

## 🧪 Lab Workflow

1. Read the experiment problem statement
2. Design RTL module(s)
3. Write testbench
4. Verify via simulation
5. Add constraints file
6. Implement on FPGA board
7. Capture waveform / hardware results

---

## 📚 Suggested References

1. Samir Palnitkar — *Verilog HDL*
2. J. Bhaskar — *Verilog HDL Synthesis*
3. Charles H. Roth Jr. and Lizy Kurian John — *Digital Systems Design Using VHDL*
4. A. Navabi, Embedded Core Design with FPGAs. New York, NY, USA: McGraw-Hill
---

## Maintainer

**Dr. Suman Samui**  
Department of ECE  
NIT Durgapur
