# WTA-testing-SKILL

## Project Overview

This project focuses on testing a **winner-take-all (WTA)** circuit using **Cadence SKILL** scripts. The goal is to automate simulation setup, run test cases, and evaluate whether the WTA circuit correctly selects the strongest input under different conditions.

The workflow begins with mapping the motion signal into be memristive crossbar array for dot product operation ([research_paper](https://ieeexplore.ieee.org/document/10682634)).

1. **Simulation setup and WTA test execution**
2. **Output collection and result evaluation**

<img src="insensor_.jpg" alt="Alt text" style="height: 200; width: auto;">

### Important Code Files

#### `WTA_test.il`
This is the main SKILL script for running the WTA circuit in Cadence.

#### `utils*.il`
Additional SKILL files in the repository contain helper functions.

#### `sim_WTA_*.il`
Simulaing file with all different input conditions

#### `graphics_wta*.scs`
Graphical Simulai file

