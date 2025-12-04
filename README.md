This repository contains the Verilog implementation of an Asynchronous FIFO, designed for reliable data transfer between two independent clock domains.


The project includes:FIFO RTL design,Write and Read pointer logic,Synchronizers for clock domain crossing,Full/Empty flag generation,Testbench for verification.

Project Overview

An Asynchronous FIFO is used when data needs to move across two subsystems running on different clock frequencies.
It solves issues like metastability, data loss, and timing mismatch.

⭐ Features:

Independent read and write clocks
Gray code pointer conversion,2 Stage Flip Flop synchronizers for safe clock crossing,Generates full, empty, almost full, and almost empty signals,Parameterizable data width and depth,Fully synthesizable Verilog RTL

Feel free to open issues or submit pull requests if you'd like to improve or optimize the design.
