# Pipelined ARM Architecture

This project implements a **pipelined version of the ARM processor** architecture using Verilog (HDL). The design follows a modular approach where each stage of the pipeline is implemented as a dedicated hardware unit and connected together to form a complete processor. The pipeline stages enable instruction-level parallelism by allowing multiple instructions to be processed simultaneously at different stages of execution.

The implementation ensures correct data flow, hazard management, and functional integrity across the pipeline, accurately simulating the behavior of a real-world ARM CPU.


## 🧠 Pipelined ARM

### Pipelined ARM:
<p align="center">
  <img src="assets/pipelined_arm.jpg" width="75%">
</p>

---

## 🔧 Sub-modules Implemented (All with testbenches)
- **Fetch**
- **IF/ID Register**
- **Decode**
- **Control Unit**
- **ID/EX Register**
- **Execute**
- **EX/MEM Register**
- **Cache**
- **Data Memory**
- **MEM/WB Register**
- **Write Back**

Each module was tested individually to ensure correctness before full integration.


## 🖥️ Technologies Used
- **Language:** Verilog (Hardware Description Language)
- **Simulation Tools:** Xilinx ISE / Vivado

