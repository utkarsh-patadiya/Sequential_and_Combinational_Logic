# Shift Registers

This repository contains Verilog designs for four types of shift registers:  
- PIPO (Parallel-In Parallel-Out)
- SISO (Serial-In Serial-Out)
- PISO (Parallel-In Serial-Out)
- SIPO (Serial-In Parallel-Out)

These shift registers are designed and tested using Vivado. The project includes the Verilog source code, testbenches, and simulation waveforms.

## Directory Structure

### `src/`
Contains the Verilog design files for each of the four shift registers:

- **`pipo.v`**  
  Implements a **Parallel-In Parallel-Out (PIPO)** shift register. The module loads parallel input data (`in_data`) into the output (`out_data`) on each clock edge. If the reset signal is high, the output is reset to zero.

- **`siso.v`**  
  Implements a **Serial-In Serial-Out (SISO)** shift register. The register shifts in serial data on each clock edge when the `shift_en` signal is asserted and shifts out the oldest bit through `serial_out`.

- **`piso.v`**  
  Implements a **Parallel-In Serial-Out (PISO)** shift register. The register loads parallel data into the shift register when the `load` signal is high, and shifts out the data serially when the `shift_en` signal is asserted.

- **`sipo.v`**  
  Implements a **Serial-In Parallel-Out (SIPO)** shift register. The module shifts in serial data when `shift_en` is high and outputs a complete parallel word when the specified width of bits is shifted in. A `data_valid` flag indicates when the parallel data is ready.

### `tb/`
Contains the testbench files for each of the shift register designs:

- **`pipo_tb.v`**  
  Testbench for the **PIPO** shift register. It provides test cases to verify loading and outputting parallel data.
  
- **`siso_tb.v`**  
  Testbench for the **SISO** shift register. It tests the shifting of serial data and the correct output of the oldest bit.

- **`piso_tb.v`**  
  Testbench for the **PISO** shift register. It tests loading parallel data and shifting out the bits serially.

- **`sipo_tb.v`**  
  Testbench for the **SIPO** shift register. It verifies the shifting of serial data and outputting of parallel data with the `data_valid` flag.

### `sim/`
Contains the simulation output waveform files generated using Vivado for each shift register design.

### `vivado-project/`
Contains the Vivado project file (`.xpr`) for the design. You can open this file in Vivado to view, simulate, or implement the shift register designs.

## How to Run

1. **Set up Vivado**  
   Open the Vivado IDE and create a New Project.

2. **Add Sources And Testbenchs**
   Add all files from `src/` to **Design Sources** and all files in `tb/` to **Simulation Sources**. 

3. **Simulate the Design**  
   Select any one simulation file (tb file) and set it as **top** to simulate.

3. **Output**  
   Outputs for each will be in the form of a waveform, and are included as png in `sim/`.

## License

This repository is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgments

- Vivado for FPGA design and simulation.
- [GitHub](https://github.com) for providing an excellent platform for hosting and sharing code.
