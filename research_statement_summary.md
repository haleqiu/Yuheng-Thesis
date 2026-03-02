# Research Statement Summary: Yuheng Qiu

**Uncertainty-Aware Spatial Perception for Generalizable State Estimation**

---

## Framework Overview

```
  Mammalian Spatial Perception Blueprint
  ───────────────────────────────────────
  Vision (retinal)          Inertial (vestibular + proprioceptive)
        │                              │
        ▼                              ▼

  ┌─────────────────┐      ┌──────────────────────┐
  │  Part I: Vision │      │  Part II: Inertial   │
  │  Uncertainty    │      │  Uncertainty         │
  │  MAC-VO         │      │  AirIMU              │
  │  QuantMAC-VO    │      │  AirIO               │
  └────────┬────────┘      └──────────┬───────────┘
           │   Metrics-aware covariance│
           └──────────┬───────────────┘
                      ▼
        ┌─────────────────────────────┐
        │  Part III: Sensor Fusion    │
        │  and Adaptation             │
        │  MAC-I²  · MACVIO · MAC-IO  │
        │  Confidence-weighted fusion │
        │  (analogous to brain        │
        │   re-weighting V/I cues)    │
        └──────────────┬──────────────┘
                       ▼
        ┌─────────────────────────────┐
        │  Part IV: Full Uncertainty- │
        │  Aware Spatial Perception   │
        │  MACSLAM                    │
        │  Global consistency ·       │
        │  Loop closure · Deployment  │
        └─────────────────────────────┘
```

**Figure caption (for LaTeX figure):** *From Biological Blueprint to Uncertainty-Aware Spatial Perception.* Mammalian navigation relies on two complementary streams, vision and inertial sensing, whose confidence the brain continuously re-weights. This thesis mirrors that architecture. Parts I and II learn metrics-aware uncertainty for each modality independently. Part III fuses them through reliability-aware weighting and adapts models across platforms. Part IV extends the pipeline to a full SLAM system with global consistency, validating that learned uncertainty can drive an end-to-end spatial perception stack.

---

## Introduction

Mammals navigate the world by seamlessly combining two complementary sensing streams. Vision provides rich external scene structure, while inertial sensing (vestibular and proprioceptive cues) stabilizes self-motion and orientation even when visual input is momentarily lost. Crucially, the brain does not treat these signals as equally reliable at all times; it continuously re-weights them based on context and confidence, fusing uncertain estimates into a coherent spatial representation. This biological architecture offers a powerful blueprint for robotic perception.

Robotic perception systems today face a dual challenge: they must be *generalizable* and *robust* across diverse environments and platforms, yet they must also run *efficiently* in real time on edge hardware. Current systems treat uncertainty as an afterthought, relying on hand-tuned covariance matrices that fail under varying lighting, different sensors, or new robotic platforms. Unlike mammalian systems, which continuously assess and adapt sensory reliability, engineered SLAM pipelines assume fixed noise characteristics that break down whenever the deployment shifts away from the calibration setting.

This research centers on one core idea: **learned uncertainty**. Uncertainty is not a nuisance parameter; it is the *currency* that makes spatial perception both reliable and practical, much as confidence weighting is the currency of biological multisensory integration. The uncertainty is learned from two complementary sources, **vision** and **inertial sensing**, mirroring the two foundational modalities of mammalian spatial perception. These learned, metrics-aware, calibrated beliefs transfer across cameras, platforms, and operating conditions. They play three roles. First, they enable **principled multi-modal fusion** by weighting measurements and modeling cross-modal correlations, analogous to how the brain re-weights visual and vestibular cues depending on reliability. Second, they improve **robustness and generalization** by reflecting when perception is reliable and when it is not. Third, they enable **system acceleration**, where uncertainty signals guide compute-efficient inference (for example, by focusing computation on informative regions and supporting deployment-oriented compression). Together, these roles form a compute-efficient spatial perception stack that is generalizable, robust, and deployable.

---

## Thesis Statement

> This thesis delivers a unified, uncertainty-driven spatial perception stack that converts visual and inertial measurements into *metrics-aware, calibrated beliefs*, enabling reliable correspondence, principled fusion, and consistent multi-frame SLAM across platforms and conditions—and leverages that same uncertainty to enable *compute-efficient, real-time on-device* deployment.

The work reframes uncertainty from a fixed, hand-tuned quantity to a learnable, metrics-aware signal with three effects: it improves robustness and generalization, it enables principled fusion across modalities, and it supports compute-efficient acceleration for real-time deployment. The framework learns and calibrates uncertainty from data across sensors and environments, then uses that calibrated signal to shape both estimation and efficiency mechanisms.

---

## Research Questions

The dissertation organizes seven research questions across four parts:

| Part | Research Question |
|------|-------------------|
| **Part I: Vision Uncertainty and Learning-based Visual Odometry** | **RQ1**: How can we build a learning-based visual odometry system that jointly learns metrics-aware visual uncertainty for robust correspondence selection and residual weighting across cameras and environments? |
| **Part I** | **RQ2**: How can we deploy learning-based visual odometry with metrics-aware covariance on resource-constrained edge hardware while preserving uncertainty quality and pose accuracy? |
| **Part II: Inertial Uncertainty and Learning-based Inertial Odometry** | **RQ3**: How can we learn and calibrate a data-driven model of IMU preintegration uncertainty for pose-graph optimization? |
| **Part II** | **RQ4**: What IMU feature representations enable robust learning-based inertial odometry under high dynamics (e.g., drones)? |
| **Part III: Sensor Fusion and Adaptation with Metrics-Aware Uncertainty** | **RQ5**: How can we leverage metrics-aware uncertainties from vision and inertia to enable robust, versatile VIO without manual tuning? |
| **Part III** | **RQ6**: How can we use EKF and IMU preintegration as structured self-supervision to adapt uncertainty-aware inertial models on real data across platforms? |
| **Part IV: Full Uncertainty-Aware Spatial Perception** | **RQ7**: How can we design a robust SLAM system that explicitly models multi-frame measurement covariance to improve feature selection, loop closure, and estimator consistency? |

---

## Key Contributions

### Pillar 1: Learned Uncertainty (Generalizable & Robust)

#### Part I: Vision Uncertainty and Learning-based Visual Odometry

- **C1. MAC-VO** *(Completed)*: Metrics-aware covariance learning for stereo visual odometry. Predicts uncertainty from visual features rather than fixed geometric models. Trained across diverse cameras and lighting; yields scale-consistent uncertainty that improves localization and fusion. Best Paper, ICRA 2025.
- **C2. QuantMAC-VO** *(Completed, RSS 2026)*: Full-stack quantization for learning-based VO with metrics-aware covariance. Sim-to-real calibration on TartanAir enables zero-shot generalization; kurtosis-based hybrid quantization selectively applies Hadamard rotations to critical layers. Achieves 1.83× speedup on NVIDIA Jetson Thor with negligible accuracy degradation, enabling real-time learning-based VO on edge hardware.

#### Part II: Inertial Uncertainty and Learning-based Inertial Odometry

- **C3. AirIMU** *(Completed)*: Data-driven framework for learning IMU preintegration uncertainty. Captures platform- and motion-specific noise without manual tuning via differentiable integration and covariance propagation.
- **C4. AirIO** *(Completed)*: Uncertainty-aware inertial odometry. Leverages learned IMU uncertainty and improved observability for robust operation in GPS-denied environments and reduced drift over long trajectories.

### Efficiency via Uncertainty (Compute-Aware Deployment)

- **CoMe** *(Completed, CVPR 2026)*: Confidence-Guided Token Merging for visual geometry transformers (VGGT, MapAnything). Distills a lightweight confidence predictor to rank tokens by uncertainty; selectively merges low-confidence tokens to reduce computation while preserving geometric fidelity. Up to 11.3× speedup for VGGT, 7.2× for MapAnything; enables real-time 3D perception on Jetson Thor.

### Part III: Sensor Fusion and Adaptation with Metrics-Aware Uncertainty

- **C5. MAC-I²** *(Completed)*: Robust visual-inertial initialization and online calibration. Leverages metrics-aware uncertainty from MAC-VO and AirIMU for tuning-free initialization across extreme exposure, occlusions, and dynamic objects.
- **C6. MACVIO** *(Proposed)*: Cross-modal uncertainty fusion. Learns cross-modal uncertainty correlations for adaptive fusion weights, sensor selection, and improved consistency.
- **C7. MAC-IO** *(Proposed)*: Self-supervised inertial adaptation. Uses EKF and IMU preintegration as structured self-supervision to adapt uncertainty-aware inertial models on real data across platforms.

### Part IV: Full Uncertainty-Aware Spatial Perception

- **C8. MACSLAM** *(Proposed)*: Uncertainty-aware SLAM. Models multi-frame measurement covariance, cross-factor correlations, and calibration drift in a global factor graph to improve data association, loop closure, and global consistency.

---

## Motivation: Why Learning-Based Uncertainty?

Mammalian navigation succeeds precisely because the brain treats sensory confidence as a dynamic, context-dependent quantity. A mouse crossing an open field relies heavily on visual landmarks, but switches to path integration (inertial cues) when entering a dark burrow. The transition is governed by the brain's real-time assessment of each signal's reliability. Current robotic perception systems lack this adaptive confidence mechanism and exhibit three fundamental limitations:

1. **Hand-tuned uncertainty models**: Manually specified covariances and noise parameters assume stationary, Gaussian noise. Fixed models cannot capture environment-dependent variations in sensor reliability, unlike biological systems that continuously recalibrate confidence.
2. **Platform-specific calibration**: Each new platform requires extensive manual tuning, weeks of data collection, and empirical validation. This process does not scale, whereas biological sensory systems generalize across body plans and environments through developmental learning.
3. **Poor cross-modal integration**: Multi-sensor fusion treats uncertainties from different modalities as independent, ignoring correlations between visual, inertial, and other measurements. In contrast, the mammalian brain exploits rich cross-modal correlations for robust spatial awareness.

The dissertation replaces these hand-tuned models with data-driven approaches that learn uncertainty directly from sensor data across diverse conditions and platforms, enabling perception systems that automatically adapt their reliability estimates and optimally fuse multi-modal information, bringing robotic perception closer to the adaptive confidence-driven integration found in biological systems.

---

## Evaluation and Impact

The framework is evaluated on challenging benchmarks including the ICCV 2023 SLAM Challenge, SubT-MRS, LARMA, TUM, and EuRoC datasets. A novel robustness metric assesses performance under sensor failure and environmental degradation.

Together, these efforts form a unified framework for building resilient, intelligent, efficient SLAM systems designed to work for any robot, anywhere, with minimal manual tuning.
