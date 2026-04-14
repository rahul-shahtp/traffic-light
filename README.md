# 🚦 Highway-Road Traffic Light Controller

A Verilog RTL implementation of a sensor-based traffic light controller for a highway–road intersection, designed and simulated on Xilinx Spartan-7 using Vivado Simulator.

---

## Overview

The controller manages two traffic signals — a **highway** (main road, always-green by default) and a **road** (side road, gets green only when a car is detected). A single-bit sensor input `x` drives state transitions.

---

## Block Diagram

```
        ┌──────────────────────────────┐
        │   trafficlight_controller    │
  ──────┤ clock                    hwy ├──── [1:0] Highway Signal
  ──────┤ clear                   road ├──── [1:0] Road Signal
  ──────┤ x (car sensor)               │
        └──────────────────────────────┘
```

---

## FSM — State Diagram

```
        ┌──── x=0 (no car) ────┐
        ▼                      │
      [ S0 ]  ── x=1 ──▶  [ S1 ]  ── 3 cycles ──────▶ [ S2 ]
   HWY=GREEN               HWY=YELLOW                ALL RED
   ROAD=RED                ROAD=RED                  (2 cycles)
        ▲                                                │
        │                                                ▼
      [ S4 ]  ◀── x=0 ──  [ S3 ]  ◀─────────────────────
   HWY=RED                HWY=RED
   ROAD=YELLOW            ROAD=GREEN
   (3 cycles)
```

---

## State Table

| State | Highway | Road   | Condition to Leave              |
|-------|---------|--------|---------------------------------|
| S0    | 🟢 Green  | 🔴 Red   | Car detected (`x=1`) → S1       |
| S1    | 🟡 Yellow | 🔴 Red   | 3-cycle delay → S2              |
| S2    | 🔴 Red    | 🔴 Red   | 2-cycle safety delay → S3       |
| S3    | 🔴 Red    | 🟢 Green | Car gone (`x=0`) → S4           |
| S4    | 🔴 Red    | 🟡 Yellow | 3-cycle delay → S0             |

---

## Signal Encoding

| Signal | Code   |
|--------|--------|
| RED    | `2'b00` |
| GREEN  | `2'b01` |
| YELLOW | `2'b10` |

---

---

## Simulation

### Tools
- **Simulator:** Vivado Simulator (xsim)
- **Target Device:** Spartan-7 `xc7s50fgga484-1Q`
- **Timescale:** `1ns / 1ps`, clock period = `10ns`

### Test Cases

| # | Description | Stimulus |
|---|-------------|----------|
| 1 | Reset | `CLEAR=1`, `X=0` for 20 ns |
| 2 | Highway idle | `CLEAR=0`, `X=0` for 40 ns |
| 3 | Full state cycle | `X=1` for 150 ns |
| 4 | Return to highway | `X=0` for 150 ns |
| 5 | Quick car detection | `X=1` → `X=0` with short pulse |

### Running via Icarus Verilog (alternative)

```bash
iverilog -o sim trafficlight_controller.v trafficlight_tb.v
vvp sim
# VCD waveform → dump.vcd
gtkwave dump.vcd
```

---

## Design Notes

- **Two always blocks:** Sequential (state register, clocked) + Combinational (output logic).
- **Safety state S2:** Both lights RED for 2 cycles to prevent simultaneous green — standard intersection safety practice.
- **Sensor-driven:** Highway stays green indefinitely until `x=1`; road stays green as long as `x=1`.
- **Synchronous reset:** `clear` signal returns to S0 on next rising clock edge.

---

