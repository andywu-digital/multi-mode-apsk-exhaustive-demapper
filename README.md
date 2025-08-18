# Multi-Mode Exhaustive Search APSK Soft-Output Detector (Baseline Design)

This project is part of the **25th Macronix Golden Silicon Award**, focusing on the design of a **multi-mode APSK demapper** for satellite communication (DVB-S2/S2X).  
I was responsible for implementing the **Exhaustive Search baseline hardware** and conducting FPGA verification.

---

## 📌 Overview
- **Algorithm**: Exhaustive Search (max-log-MAP approximation)
- **Supported Modulations**: **QPSK, 8-PSK, 16-APSK, 32-APSK, 64-APSK**
- **Multi-Mode Design**: Single unified RTL architecture supports all modulation modes by reusing datapath resources.
- **Technology**: TSMC 40nm CMOS
- **Clock Frequency**: 400 MHz
- **Word Length**: 18-bit fixed-point
- **Target Application**: DVB-S2/S2X receivers with Adaptive Coding and Modulation (ACM)

---

## 🔧 Hardware Architecture

### Full Exhaustive Search Detector
<p align="center">
<img src="img/hd_arch.png" width="700">
</p>

- **Prep Unit**: CORDIC-based preprocessing (channel rotation & normalization).  
- **Constellation Table**: Provides all constellation points for **all 5 modulation modes**.  
- **Multi-MCU (Metric Computation Units)**: Computes Euclidean distance for every constellation point.  
- **Comparison Unit (CU)**: Finds the minimum distances for each bit group (0/1).  
- **LLR Calculation Unit (LCU)**: Outputs soft LLRs for LDPC decoding.  

➡️ **All modulation modes (QPSK to 64-APSK) share the same datapath**, ensuring configurability and scalability.


---

## 📊 ASIC Results (Exhaustive vs. Iterative)
| Metric                  | Exhaustive Search | Iterative Design |
|--------------------------|------------------|-----------------|
| Equivalent Gates (kGE)  | 481.00           | 277.69          |
| Frequency (MHz)         | 400              | 400             |
| Latency (ns)            | 20               | 52.5            |
| Power (mW, 64-APSK)     | 86.71            | 65.05           |
| Throughput (Gbps)       | 0.8–2.4          | 0.8–2.4         |

👉 Exhaustive search consumes **~73% more area** and **~25% more power**, but serves as the **multi-mode golden reference baseline**:contentReference[oaicite:2]{index=2}.

---

## 🖥️ FPGA Verification

### Verification Flow
<p align="center">
<img src="img/fpga_verification.png" width="1000">
<p>

- **Platform**: Xilinx Virtex-7 VC707  
- **Environment**: Xilinx Vivado @ 50 MHz  
- **Golden Model**: MATLAB fixed-point simulation  
- **Verification Method**:  
  - Input/output vectors generated from Golden Model  
  - DUT outputs observed with **Integrated Logic Analyzer (ILA)**  
  - Verified **all 5 modulation modes** with one full packet each (10,800–32,400 symbols).  

### FPGA Resource Usage
| Metric   | Exhaustive Search | Iterative Design |
|----------|------------------|-----------------|
| LUT      | 13,657           | 11,367          |
| FF       | 1,770            | 5,540           |
| DSP      | 265              | 121             |
| Power    | 0.424 W          | 0.327 W         |

➡️ Verification confirmed **bit-accurate outputs across all multi-mode cases (QPSK → 64-APSK)**

---

## 🎯 Key Contributions
- Designed and implemented **multi-mode Exhaustive Search APSK demapper** in RTL.  
- Built **Multi-MCU datapath** to compute all constellation distances in parallel.  
- Applied **low-power design (data gating)** to reduce dynamic power.  
- Conducted **FPGA verification** with ILA and Golden Model comparison.  
- Established the **baseline for benchmarking** optimized iterative architecture.  

---

## 📽️ Demo
- FPGA verification video available (VC707, ILA waveform).  
- Each modulation mode tested with one full packet (10,800–32,400 symbols).

---

## 📚 References

