# Thesis Story and TODO Plan

This document defines the overall narrative for the dissertation and lists the highest-impact missing or revision items.
It is written to help drafting decisions stay consistent across chapters.

## Working Thesis Title

Uncertainty-Aware Spatial Perception for Generalizable State Estimation

## One-Sentence Thesis Story

This thesis argues that learned, metrics-aware uncertainty should be treated as a first-class signal in spatial perception, because it enables robust estimation, principled visual-inertial fusion, and efficient deployment across platforms.

## Human Analogy (Use Sparingly in Thesis Text)

Mammalian spatial perception combines complementary sensing streams.
Vision provides rich external scene structure, while inertial sensing (vestibular and proprioceptive cues) stabilizes self-motion and orientation.
Inspired by this division of roles, the thesis first builds reliable uncertainty for vision and inertial sensing separately, then fuses them for robust and adaptive state estimation.
Use this analogy in motivation only, not as biological proof.

## BLUF Story Spine

Current SLAM and VIO systems fail in the field because they rely on fixed, hand-tuned uncertainty models that do not transfer across sensors, environments, and platforms.
The dissertation replaces these brittle assumptions with learned uncertainty models for vision and IMU sensing, then uses those models to drive fusion, SLAM consistency, and adaptation.
The end state is a deployable spatial perception stack that is accurate, robust, and practical.

## Four-Part Narrative Map

### Part I: Vision Uncertainty and Learning-based Visual Odometry (Ch 3)

- `MAC-VO` establishes metrics-aware visual covariance for correspondence filtering and residual weighting.
- Narrative role: establish robust visual uncertainty as the first foundation.

### Part II: Inertial Uncertainty and Learning-based Inertial Odometry (Ch 4--5)

- `AirIMU` learns data-driven IMU preintegration uncertainty with metric calibration.
- `AirIO` uses learned inertial uncertainty and observability-aware features for robust inertial odometry.
- Narrative role: establish robust inertial uncertainty as the second foundation.

### Part III: Sensor Fusion and Adaptation with Metrics-Aware Uncertainty (Ch 6--8)

- `MAC-I^2` provides uncertainty-aware visual-inertial initialization and online calibration.
- `MACVIO` learns cross-modal uncertainty correlation for adaptive visual-inertial fusion.
- `MAC-IO` uses EKF and IMU preintegration as structured self-supervision to adapt models on real data.
- Narrative role: couple visual and inertial uncertainty, then adapt fusion behavior under distribution shift.

### Part IV: Full Uncertainty-Aware Spatial Perception (Ch 9)

- `MACSLAM` extends uncertainty modeling to global multi-frame optimization, robust data association, and uncertainty-aware loop closure.
- Narrative role: deliver a complete SLAM system that unifies local estimation, global consistency, and practical deployment.

## Chapter-to-Directory Map

| Ch # | Directory | Topic |
|------|-----------|-------|
| 1 | `tex/ch1_intro/` | Introduction |
| 2 | `tex/ch2_background/` | Background and Related Work |
| 3 | `tex/ch3_macvo/` | MAC-VO |
| 4 | `tex/ch4_airimu/` | AirIMU |
| 5 | `tex/ch5_airio/` | AirIO |
| 6 | `tex/ch6_macinit/` | MAC-I² |
| 7 | `tex/ch7_macvio/` | MACVIO |
| 8 | `tex/ch8_macio/` | MAC-IO |
| 9 | `tex/ch9_macslam/` | MACSLAM |
| 10 | `tex/ch10_conclusion/` | Conclusion and Future Directions |

## Internalized Completed Works from `PaperOverleaf`

The following completed papers are now aligned with the thesis story and chapter plan.

- `MACVO-ICRARAL-2024`: Introduces metrics-aware 2D uncertainty and 3D covariance (including inter-axis correlations) for keypoint selection and residual weighting in stereo VO.
- `AirIMU-paper`: Learns IMU correction and uncertainty propagation jointly with differentiable preintegration/covariance; reports strong cross-device/platform generalization and `31.6%` PGO improvement in ablation.
- `AirIO_RAL`: Shows body-frame IMU representation improves observability; reports large UAV IO gains (including `66.7%` average accuracy improvement from representation and additional gains from attitude encoding) with uncertainty-aware EKF fusion.
- `MACVIinit-RSS2026` (`MAC-I^2`): Uses learned metrics-aware visual and inertial covariances for robust, tuning-free VI initialization and online calibration.
- `CVPR-2026-Confidence-Guided-Token-Merging-submission` (`CoMe`): Confidence-guided token merging for visual geometry transformers, reporting up to `11.3x` (VGGT) and `7.2x` (MapAnything) speedup.
- `Offroad-Nighttime-Autonomy-2026-Shared`: Full-stack passive thermal autonomy system and dataset; currently best treated as supporting system evidence.

## Source-to-Chapter Copy Map (for Draft Transfer)

Use this map when copying and adapting text into the thesis.

- `tex/ch3_macvo/ch3.tex` (MAC-VO)
  - Source files: `PaperOverleaf/MACVO-ICRARAL-2024/Sections/Introduction.tex`, `Sections/Method.tex`, `Sections/Experiment.tex`, `Sections/Conclusion.tex`
  - Copy priority: problem setup, metrics-aware covariance formulation, ablation logic, benchmark comparison narrative

- `tex/ch4_airimu/ch4.tex` (AirIMU)
  - Source files: `PaperOverleaf/AirIMU-paper/Sections/Introduction.tex`, `Sections/AirIMU_model.tex`, `Sections/Experiment.tex`
  - Copy priority: deterministic vs non-deterministic error framing, differentiable covariance propagation, cross-device validation

- `tex/ch5_airio/ch5.tex` (AirIO)
  - Source files: `PaperOverleaf/AirIO_RAL/Sections/Introduction.tex`, `Sections/Method.tex`, `Sections/Experiment.tex`, `Sections/Ablation.tex`
  - Copy priority: observability argument for body-frame representation, attitude encoding design, EKF fusion details, UAV-specific evidence

- `tex/ch6_macinit/ch6.tex` (MAC-I²)
  - Source files: `PaperOverleaf/MACVIinit-RSS2026/Sections/Introduction.tex`, `Sections/Method.tex`, `Sections/Experiment.tex`, `Sections/Ablation.tex`
  - Copy priority: VI initialization failure modes, metrics-aware visual/inertial covariance fusion, robustness claims in degraded scenes

- `tex/ch1_intro/ch1.tex` and `tex/ch0/abstract.tex` (thesis-level synthesis)
  - Source files: all completed-paper abstracts/introductions above
  - Copy priority: unified motivation paragraph, cross-paper contribution bullets

## Reuse Rules for Copying from Papers

- Reuse contribution-level technical claims, but reframe per chapter in thesis voice (what this chapter establishes for the next chapter).
- Keep quantitative claims only when exact numbers are already reported in the source paper and remain consistent with current draft scope.
- Prefer copying method/problem paragraphs first, then rewrite transitions to maintain thesis flow.
- Mark any uncertain performance numbers with `[VERIFY]` during transfer if tables are not yet copied.

## What the Committee Should Remember

- The problem is not just model accuracy; it is uncertainty miscalibration under shift.
- The central technical currency is metrics-aware covariance, learned and calibrated from data.
- The methodological progression is vision uncertainty -> inertial uncertainty -> fusion and adaptation -> full spatial perception.
- The practical claim is robust and efficient transfer to real deployments through uncertainty-aware estimation and adaptation.

## Priority TODOs

### P0: Must Fix for Complete Thesis

- [ ] `tex/ch7_macvio/ch7.tex`: Expand method, experiments, and results into full chapter content.
- [ ] `tex/ch8_macio/ch8.tex`: Expand method, experiments, and results into full chapter content.
- [ ] `tex/ch9_macslam/ch9.tex`: Expand method, experiments, and results into full chapter content.
- [ ] Build a transfer checklist for completed chapters: copy "Problem", "Method", "Key Results", "Limitations", and "Bridge to next chapter" from each source paper.

### P1: Should Fix Before Submission

- [ ] `tex/appendices/appendices.tex`: Expand appendix stubs with concrete derivations, extra tables, and runtime details referenced in main chapters.
- [ ] `tex/appendices/notation.tex`: Fill notation appendix and decide whether to include it in `main.tex`.
- [ ] Orphan part files and chapters moved to `tex/_orphan_not_in_build/` for reference.

### P2: Quality Upgrades That Improve Readability

- [ ] Add a one-paragraph "chapter bridge" at the end of each chapter to explain why the next chapter is needed.
- [ ] Standardize terminology across all files (`metrics-aware covariance`, `learned uncertainty`, `cross-platform adaptation`) to avoid synonym drift.

## Writing Order (Fastest Path to a Strong Draft)

1. Lock Chapter 1 story (`Motivation`, `Thesis Statement`, contributions table wording).
2. Fully draft Ch 7 (MACVIO) because it is the key bridge from single-sensor chapters to full fusion.
3. Draft Ch 9 (MACSLAM) with explicit covariance modeling and evaluation.
4. Draft Ch 8 (MAC-IO) with adaptation protocol and zero-shot validation.
5. Rewrite abstract last, after chapter claims stabilize.
6. Fill appendices that are required for referenced equations and additional results.

## Done-Definition for Thesis Readiness

- Every included chapter in `main.tex` has no placeholder blocks.
- Every contribution maps to one chapter with a clear claim and evaluation.
- Abstract, introduction, and part pages use the same thesis vocabulary and scope.
- Appendix references resolve and support claims made in the main text.
