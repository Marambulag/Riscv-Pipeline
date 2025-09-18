RISC-V Pipelined Processor
This repository contains a Verilog implementation of a 32-bit RISC-V processor with a five-stage pipeline. The core objective of this project is to demonstrate an efficient microarchitecture that can execute instructions concurrently, significantly improving performance. This design focuses on handling data dependencies and potential conflicts that arise in a pipelined system.

Project Highlights
This processor design includes key features

Five-Stage Pipeline: The processor's core is built around a classic five-stage pipeline (IF, ID, EX, MEM, WB) to maximize instruction throughput.

IF (Instruction Fetch): Fetches the next instruction from memory.

ID (Instruction Decode): Decodes the instruction and reads register values.

EX (Execute): Performs arithmetic and logical operations.

MEM (Memory Access): Handles data memory loads and stores.

WB (Write-Back): Writes the final result back to the register file.

Hazard Unit: A dedicated hazard_unit module is implemented to detect and resolve data hazards. This is a crucial component that ensures the pipeline operates correctly.

Forwarding (Bypassing): The processor uses data forwarding to pass results directly from one stage to a previous one. This technique resolves most Read-After-Write (RAW) data hazards by providing data as soon as it's available, without waiting for the Write-Back stage.

Stalling (Load-Use Hazards): A special case, known as a Load-Use hazard, is handled by stalling the pipeline for one clock cycle. This gives the load instruction time to fetch the required data from memory before the next instruction tries to use it.

![Pipeline Test Bench](https://raw.githubusercontent.com/Marambulag/Riscv-Pipeline/master/tb_pipeline.png)
Test Program Example

To validate the pipeline, we executed the following program:

01400613   # addi x12, x0, 20
00400593   # addi x11, x0, 4
00b585b3   # add  x11, x11, x11
00c58633   # add  x12, x11, x12
0400006f   # jal  x0, 64

Execution Trace

Initial values:

x12 = 20

x11 = 4

Operations:

x11 = x11 + x11 → x11 = 8

x12 = x11 + x12 → x12 = 8 + 20 = 28

Correct Results

x11 = 8

x12 = 28

Why This Validates the Hazard Unit

Notice that the instruction add x12, x11, x12 depends on the updated value of x11 that was just produced in the previous cycle.
Without a functioning hazard detection and forwarding unit, the pipeline would read the old value of x11 = 4, producing the wrong result (x12 = 24 instead of 28).
Since the CPU produces the correct value (x12 = 28), this confirms that the hazard unit correctly handles read-after-write (RAW) hazards by forwarding the new value of x11 into the next instruction.

