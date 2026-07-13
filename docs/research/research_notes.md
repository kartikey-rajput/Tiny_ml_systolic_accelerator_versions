# Project Vision

## Project Title

Design and ASIC Implementation of a Configurable Low-Power TinyML Systolic Array Accelerator Using Open-Source RTL-to-GDSII Flow

---

## Problem Statement

Edge AI devices such as IoT sensors, wearable electronics, drones, and embedded medical devices require fast and energy-efficient neural network inference. Traditional CPUs and GPUs consume excessive power and are not optimized for matrix multiplication workloads. Dedicated TinyML hardware accelerators based on systolic arrays provide significantly higher computational efficiency while reducing power and area.

---

## Proposed Solution

Design a configurable systolic array accelerator capable of accelerating matrix multiplication for TinyML inference.

The accelerator will be designed in Verilog, verified through simulation, synthesized using an open-source RTL-to-GDSII flow, and evaluated for ASIC implementation.

---

## Final Goal

A complete open-source ASIC implementation suitable for Tiny Tapeout/Open MPW submission together with an IEEE-quality research paper.




# Project Objectives

1. Design a configurable Processing Element (PE).

2. Implement a parameterized systolic array architecture.

3. Support efficient matrix multiplication for TinyML inference.

4. Optimize for low power and hardware efficiency.

5. Verify the RTL using Verilog simulations.

6. Synthesize the design using OpenLane.

7. Analyze area, timing, and power.

8. Prepare an ASIC-ready implementation.