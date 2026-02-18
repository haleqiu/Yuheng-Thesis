# Research Statement Summary: Yuheng Qiu

**From Learned Uncertainty to Compute-Efficient Spatial Intelligence**

---

## Framework Overview

```
                    Vision                 Inertial
               Raw Measurements       Raw Measurements
                    │                      │
                    └──────────┬───────────┘
                               ▼
                    Learned Uncertainty
              Metrics-aware, calibrated beliefs
                               │
        ┌──────────────────────┼──────────────────────┐
        ▼                      ▼                      ▼
  Multi-Modal Fusion      Robust & Generalizable   Uncertainty-Guided
  Principled weighting    Spatial Perception       Acceleration
  and correlations                               Compute-efficient, real-time
        │                      │                      │
        └──────────────────────┴──────────────────────┘
                               ▼
            Compute-Efficient Spatial Intelligence
            Generalizable · Robust · Efficient
```

**Figure caption (for LaTeX figure):** *Learned Uncertainty as the Core Currency.* Vision and inertial measurements feed a learned, metrics-aware uncertainty model that produces calibrated beliefs. This uncertainty (i) enables principled multi-modal fusion, (ii) drives robust and generalizable spatial perception across platforms and conditions, and (iii) provides a signal for system acceleration via uncertainty-guided, compute-efficient inference. Together, these uses yield compute-efficient spatial intelligence.

---

## Introduction

Robotic perception systems today face a dual challenge: they must be *generalizable* and *robust* across diverse environments and platforms, yet they must also run *efficiently* in real time on edge hardware. Current systems treat uncertainty as an afterthought, relying on hand-tuned covariance matrices that fail under varying lighting, different sensors, or new robotic platforms. At the same time, learning-based perception models achieve strong robustness but impose prohibitive computational and memory demands, limiting on-device deployment.

This research centers on one core idea: **learned uncertainty**. Uncertainty is not a nuisance parameter; it is the *currency* that makes spatial perception both reliable and practical. The uncertainty is learned from two complementary sources—**vision** and **inertial sensing**—to produce metrics-aware, calibrated beliefs that transfer across cameras, platforms, and operating conditions. Those beliefs play three roles. First, they enable **principled multi-modal fusion** by weighting measurements and modeling cross-modal correlations. Second, they improve **robustness and generalization** by reflecting when perception is reliable and when it is not. Third, they enable **system acceleration**, where uncertainty signals guide compute-efficient inference (for example, by focusing computation on informative regions and supporting deployment-oriented compression). Together, these roles form a compute-efficient spatial perception stack that is generalizable, robust, and deployable.

---

## Thesis Statement

> This thesis delivers a unified, uncertainty-driven spatial perception stack that converts visual and inertial measurements into *metrics-aware, calibrated beliefs*, enabling reliable correspondence, principled fusion, and consistent multi-frame SLAM across platforms and conditions—and leverages that same uncertainty to enable *compute-efficient, real-time on-device* deployment.

The work reframes uncertainty from a fixed, hand-tuned quantity to a learnable, metrics-aware signal with three effects: it improves robustness and generalization, it enables principled fusion across modalities, and it supports compute-efficient acceleration for real-time deployment. The framework learns and calibrates uncertainty from data across sensors and environments, then uses that calibrated signal to shape both estimation and efficiency mechanisms.

---

## Research Questions

The dissertation organizes six research questions across four parts:

| Part | Research Question |
|------|-------------------|
| **Part I** | **RQ1**: How can we learn scale-consistent, metrics-aware visual uncertainty and leverage it for robust VO/SLAM across cameras and environments? |
| **Part II** | **RQ2**: How can we learn and calibrate a data-driven model of IMU preintegration uncertainty for pose-graph optimization? |
| **Part II** | **RQ3**: What IMU feature representations enable robust learning-based inertial odometry under high dynamics (e.g., drones)? |
| **Part III** | **RQ4**: How can we leverage metrics-aware uncertainties from vision and inertia to enable robust, versatile VIO without manual tuning? |
| **Part III** | **RQ5**: How can we design a robust SLAM system that explicitly models multi-frame measurement covariance to improve feature selection, loop closure, and estimator consistency? |
| **Part IV** | **RQ6**: How can we develop self-supervised domain transfer methods for uncertainty models that enable zero-shot deployment with automatic sensor configuration? |
| **Efficiency** | **RQ7**: How can we leverage learned uncertainty (metrics-aware covariance, confidence) to enable compute-aware, efficient deployment of spatial perception on resource-constrained edge hardware? |

---

## Key Contributions

### Pillar 1: Learned Uncertainty (Generalizable & Robust)

#### Part I: Metrics-Aware Uncertainty for Visual Odometry

- **C1. MAC-VO** *(Completed)*: Metrics-aware covariance learning for stereo visual odometry. Predicts uncertainty from visual features rather than fixed geometric models. Trained across diverse cameras and lighting; yields scale-consistent uncertainty that improves localization and fusion. Best Paper, ICRA 2025.

#### Part II: Inertial Uncertainty

- **C2. AirIMU** *(Completed)*: Data-driven framework for learning IMU preintegration uncertainty. Captures platform- and motion-specific noise without manual tuning via differentiable integration and covariance propagation.
- **C3. AirIO** *(Completed)*: Uncertainty-aware inertial odometry. Leverages learned IMU uncertainty and improved observability for robust operation in GPS-denied environments and reduced drift over long trajectories.

### Pillar 2: Efficiency via Uncertainty (Compute-Aware Deployment)

- **C1b. QuantMAC-VO** *(Completed, RSS 2026)*: Full-stack quantization for learning-based VO with metrics-aware covariance. Sim-to-real calibration on TartanAir enables zero-shot generalization; kurtosis-based hybrid quantization selectively applies Hadamard rotations to critical layers. Achieves 1.83× speedup on NVIDIA Jetson Thor with negligible accuracy degradation, enabling real-time learning-based VO on edge hardware.
- **CoMe** *(Completed, CVPR 2026)*: Confidence-Guided Token Merging for visual geometry transformers (VGGT, MapAnything). Distills a lightweight confidence predictor to rank tokens by uncertainty; selectively merges low-confidence tokens to reduce computation while preserving geometric fidelity. Up to 11.3× speedup for VGGT, 7.2× for MapAnything; enables real-time 3D perception on Jetson Thor.

### Part III: Uncertainty-Aware Multi-Modal Fusion & SLAM

- **C4b. MAC-I²** *(Completed)*: Robust visual-inertial initialization and online calibration. Leverages metrics-aware uncertainty from MAC-VO and AirIMU for tuning-free initialization across extreme exposure, occlusions, and dynamic objects.
- **C4. MACVIO** *(Proposed)*: Cross-modal uncertainty fusion. Learns cross-modal uncertainty correlations for adaptive fusion weights, sensor selection, and improved consistency.
- **C5. MACSLAM** *(Proposed)*: Uncertainty-aware SLAM. Models measurement covariance, cross-factor correlations, and calibration drift to improve data association, loop closure, and optimization.
- **C6. MAC-IO** *(Proposed)*: Uncertainty-guided self-supervised inertial odometry. Uses predictive uncertainty to calibrate pseudo-labels and objectives for stable self-supervised IO across platforms.

---

## Motivation: Why Learning-Based Uncertainty?

Traditional perception systems exhibit three fundamental limitations:

1. **Hand-tuned uncertainty models**: Manually specified covariances and noise parameters assume stationary, Gaussian noise. Fixed models cannot capture environment-dependent variations in sensor reliability.
2. **Platform-specific calibration**: Each new platform requires extensive manual tuning, weeks of data collection, and empirical validation. This process does not scale.
3. **Poor cross-modal integration**: Multi-sensor fusion treats uncertainties from different modalities as independent, ignoring correlations between visual, inertial, and other measurements. This leads to suboptimal fusion weights and missed opportunities for uncertainty-driven sensor selection.

The dissertation replaces these hand-tuned models with data-driven approaches that learn uncertainty directly from sensor data across diverse conditions and platforms, enabling perception systems that automatically adapt their reliability estimates and optimally fuse multi-modal information.

---

## Evaluation and Impact

The framework is evaluated on challenging benchmarks including the ICCV 2023 SLAM Challenge, SubT-MRS, LARMA, TUM, and EuRoC datasets. A novel robustness metric assesses performance under sensor failure and environmental degradation.

Together, these efforts form a unified framework for building resilient, intelligent, efficient SLAM systems designed to work for any robot, anywhere, with minimal manual tuning.
