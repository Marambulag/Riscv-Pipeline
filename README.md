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

![Pipeline Test Bench](https://raw.githubusercontent.com/Marambulag/Riscv-Pipeline/master/pipeline_test_bench.png)

