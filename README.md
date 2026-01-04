# GEVE-RL-HK-CoolingSystem
GEVE-RL (offline-to-online PPO) for control optimization of a TRNSYS-calibrated cooling-water system using Hong Kong building operational data.
This repository contains the implementation of **GEVE-RL** (Generatively Experience-Augmented Virtual–Physical Environment Reinforcement Learning) for control optimization of a **cooling-water system** in a Hong Kong commercial building. It includes:

1. **PPO algorithm executor** (training / evaluation script)
2. **TRNSYS simulation model** calibrated using the building’s historical operational data
3. **Reinforcement learning environment** that interacts with the TRNSYS model and logged data
---

## 1. Repository Structure

```
.
├─ GEVE-RL.py                 # (1) PPO algorithm executor (main entry)
├─ load.tpf                   # (2) TRNSYS Studio project (calibrated model)
├─ trn2pyEnv.py               # (3) RL environment (TRNSYS ↔ Python interface)
├─ RL_Utils.py                # RL utilities (buffer, normalization, helpers)
├─ Pump Flow Fitting Curve.py # Pump flow curve fitting / regression utility
├─ SolarCollector.m           # MATLAB helper (if used by TRNSYS/analysis)
├─ SolarCollector1.m          # MATLAB helper (variant)
├─ TwoInputs.m                # MATLAB helper (variant)
├─ test1.m                    # MATLAB testing script
├─ outputs/                   # Output folder (logs/figures/intermediate results)
├─ Readme.txt                 # (optional/legacy) brief notes
├─ Load.dck                   # TRNSYS deck file (generated/used by TRNSYS)
├─ Load.log                   # TRNSYS run log
├─ Load.lst                   # TRNSYS listing output
├─ Load.PTI                   # TRNSYS project information file
├─ output.log                 # General runtime log (may be empty)
├─ experience_data.csv        # Historical operational data / experience dataset
├─ experience_pool.csv        # Experience pool (generated/collected transitions)
├─ state_action_reward.csv    # Collected (s, a, r, s') transitions
├─ RL_state_out.csv           # Logged RL states
├─ RL_action_out.csv          # Logged RL actions
├─ RL_reward_output.csv       # Logged RL rewards
├─ load_output.csv            # System/load outputs (TRNSYS or postprocessed)
├─ load_ouroutput.csv         # Custom output file (postprocessed)
├─ aa.csv, bb.csv, cc.csv, dd.csv  # Small auxiliary parameter tables
└─ .idea/                     # IDE config (PyCharm), optional
```
---

## 2. Core Components

### 2.1 PPO Algorithm Executor (Main Script)

**File:** `GEVE-RL.py`

This is the main entry point for training and evaluating the controller using **PPO**. Typical responsibilities include:

* loading configuration / hyperparameters
* initializing the RL environment (`trn2pyEnv.py`)
* training the PPO policy
* evaluation and logging (actions, rewards, states)
* exporting results into CSV files under the repository root or `outputs/`

**Outputs commonly produced:**

* `RL_state_out.csv`, `RL_action_out.csv`, `RL_reward_output.csv`
* `state_action_reward.csv` (collected transitions)
* logs under `outputs/`

---

### 2.2 TRNSYS Simulation Model (Virtual–Physical Environment)

**File:** `load.tpf` (TRNSYS Studio project)

This TRNSYS model is calibrated using the **historical operational data** from a Hong Kong commercial building. The model serves as the “virtual physical system” for control interaction.

Associated TRNSYS files:

* `Load.dck`: TRNSYS deck file used in simulation runs
* `Load.log`: simulation log
* `Load.lst`: simulation listing output
* `Load.PTI`: project metadata

> Notes
>
> * Please open `load.tpf` using TRNSYS Studio.
> * Ensure TRNSYS is correctly installed and licensed on your machine.
> * The model may require specific TRNSYS components/libraries depending on your setup.

---

### 2.3 Reinforcement Learning Environment

**File:** `trn2pyEnv.py`

This module defines the RL environment that connects Python (PPO agent) with the TRNSYS simulation model and/or logged data. It typically implements:

* state construction (e.g., temperatures, flows, loads, operating points)
* action interface (e.g., pump frequency setpoints, valve settings, etc.)
* reward calculation (e.g., energy + stability/switching penalty)
* interaction loop (step/reset) with TRNSYS outputs

This environment is used by `GEVE-RL.py` during training/evaluation.

---

## 3. Data Files (Historical Data & Experience)

* `experience_data.csv`
  Historical operational dataset collected from the building. This file is used for:

  * model calibration support
  * offline/experience generation (depending on workflow)

* `experience_pool.csv`
  Experience pool generated during offline exploration or training (transitions).

* `state_action_reward.csv`
  Aggregated RL trajectories including state, action, reward (and possibly next-state).
  Useful for debugging, analysis, and reproducibility.

* `RL_state_out.csv`, `RL_action_out.csv`, `RL_reward_output.csv`
  Logged outputs during RL execution.

* `aa.csv`, `bb.csv`, `cc.csv`, `dd.csv`
  Auxiliary tables (e.g., coefficients, schedules, parameter lookup tables).

> **Data privacy**
> If you plan to make the repository public, please ensure all operational data are properly anonymized and do not contain sensitive identifiers.

---

## 4. Helper Scripts

* `RL_Utils.py`
  Common RL utilities such as data normalization, replay buffer helpers, logging utilities, etc.

* `Pump Flow Fitting Curve.py`
  Utility script for fitting pump flow curves or deriving parameter relationships used by the TRNSYS model or environment.

* MATLAB scripts (`SolarCollector*.m`, `TwoInputs.m`, `test1.m`)
  Auxiliary scripts for pre/post-processing, parameter fitting, or component-level testing.

---

## 5. Quick Start (Typical Workflow)

### 5.1 Prerequisites

* Python (recommended 3.8+; adapt to your environment)
* Required Python packages (create your own `requirements.txt` if needed)
* TRNSYS installed (for running the `load.tpf` model)

### 5.2 Run PPO Training / Evaluation

1. Open a terminal in the repository directory
2. Run:

```bash
python GEVE-RL.py
```

> If your script requires arguments/configs, add them here (e.g., data path, training steps, random seed).

---

## 6. Reproducibility Notes

* Ensure TRNSYS path and any environment variables required by your TRNSYS–Python interface are correctly configured.
* Check that file paths inside `GEVE-RL.py` and `trn2pyEnv.py` match your local machine.
* Logs and outputs should appear in `outputs/` and/or the generated CSV files.

---
