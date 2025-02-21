# Verilog Encoder, Decoder, and Priority Encoder

## Project Structure
- **src/**: Contains the Verilog design files:
  - `encoder.v`: Implements a basic 4-to-2 encoder.
  - `decoder.v`: Implements a 2-to-4 decoder.
  - `priority_encoder.v`: Implements a 4-to-2 priority encoder.
- **tb/**: Contains the testbench file:
  - `testbench.v`: Verifies the functionality of the encoder, decoder, and priority encoder.
- **sim/**: Stores the simulation waveform output png using Vivado.

## Description
This project implements three combinational logic circuits in Verilog:
- **Encoder**: A standard 4-to-2 encoder that converts a 4-bit input into a 2-bit output.
- **Priority Encoder**: A 4-to-2 priority encoder that assigns priority to the highest-order set bit.
- **Decoder**: A 2-to-4 decoder that converts a 2-bit input into a one-hot 4-bit output.
- **Testbench**: A testbench that applies input test cases and verifies the correctness of the implemented modules.

## Simulation using Vivado
1. Create a new Project in Vivado.
2. Add all files in `src/` as desgin sources.
3. Add `tb/tesbench.v` file to simualtion source (Select it as Top module if not already).
3. View the generated waveform by running the simulation to verify correctness.

## Contribution
Contributions are welcome! Feel free to fork the repository, make improvements, and submit a pull request.

## License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

