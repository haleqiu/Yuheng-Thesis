# Thesis Story and TODO Plan

This document defines the overall narrative for `Yuheng-Thesis-Proposal-2026` and lists the highest-impact missing or revision items.
It is written to help drafting decisions stay consistent across chapters, proposed work, and committee review expectations.

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
The completed chapters establish strong evidence on modality-specific uncertainty learning and early fusion.
The proposed chapters convert this foundation into a complete uncertainty-aware multi-modal SLAM and cross-platform adaptation agenda.
The end state is a deployable spatial perception stack that is accurate, robust, and practical on edge hardware.

## Four-Part Narrative Map

### Part I: Vision Uncertainty and Learning-based Visual Odometry

- `MAC-VO` establishes metrics-aware visual covariance for correspondence filtering and residual weighting.
- `QuantMAC-VO` shows the visual uncertainty pipeline can be compressed for edge deployment while preserving reliability.
- Narrative role: establish robust visual uncertainty as the first foundation.

### Part II: Inertial Uncertainty and Learning-based Inertial Odometry

- `AirIMU` learns data-driven IMU preintegration uncertainty with metric calibration.
- `AirIO` uses learned inertial uncertainty and observability-aware features for robust inertial odometry.
- Narrative role: establish robust inertial uncertainty as the second foundation.

### Part III: Sensor Fusion and Adaptation with Metrics-Aware Uncertainty

- `MAC-I^2` (completed) provides uncertainty-aware visual-inertial initialization and online calibration.
- `MACVIO` (proposed) learns cross-modal uncertainty correlation for adaptive visual-inertial fusion.
- `MAC-IO` (proposed) uses EKF and IMU preintegration as structured self-supervision to adapt models on real data.
- Narrative role: couple visual and inertial uncertainty, then adapt fusion behavior under distribution shift.

### Part IV: Full Uncertainty-Aware Spatial Perception

- `MACSLAM` (proposed) extends uncertainty modeling to global multi-frame optimization, robust data association, and uncertainty-aware loop closure.
- Narrative role: deliver a complete SLAM system that unifies local estimation, global consistency, and practical deployment.

## Internalized Completed Works from `PaperOverleaf`

The following completed papers are now aligned with the thesis story and chapter plan.

- `MACVO-ICRARAL-2024`: Introduces metrics-aware 2D uncertainty and 3D covariance (including inter-axis correlations) for keypoint selection and residual weighting in stereo VO.
- `QuantMACVORSS2026`: Adds a deployment path for MAC-VO with sim-to-real calibration and kurtosis-based hybrid quantization; reports up to `1.83x` speedup on Jetson Thor with negligible accuracy loss.
- `AirIMU-paper`: Learns IMU correction and uncertainty propagation jointly with differentiable preintegration/covariance; reports strong cross-device/platform generalization and `31.6%` PGO improvement in ablation.
- `AirIO_RAL`: Shows body-frame IMU representation improves observability; reports large UAV IO gains (including `66.7%` average accuracy improvement from representation and additional gains from attitude encoding) with uncertainty-aware EKF fusion.
- `MACVIinit-RSS2026` (`MAC-I^2`): Uses learned metrics-aware visual and inertial covariances for robust, tuning-free VI initialization and online calibration.
- `CVPR-2026-Confidence-Guided-Token-Merging-submission` (`CoMe`): Confidence-guided token merging for visual geometry transformers, reporting up to `11.3x` (VGGT) and `7.2x` (MapAnything) speedup.
- `Offroad-Nighttime-Autonomy-2026-Shared`: Full-stack passive thermal autonomy system and dataset; currently best treated as supporting system evidence unless you decide to include a dedicated thesis section.

## Source-to-Chapter Copy Map (for Later Draft Transfer)

Use this map when copying and adapting text into the thesis.

- `tex/ch3_macvo/ch3.tex` (MAC-VO)
  - Source files: `PaperOverleaf/MACVO-ICRARAL-2024/Sections/Introduction.tex`, `Sections/Method.tex`, `Sections/Experiment.tex`, `Sections/Conclusion.tex`
  - Copy priority: problem setup, metrics-aware covariance formulation, ablation logic, benchmark comparison narrative

- `tex/ch3b_quantmacvo/ch3b.tex` (QuantMAC-VO)
  - Source files: `PaperOverleaf/QuantMACVORSS2026/paper/0_abstract.tex`, `paper/1_introduction.tex`, `paper/2_method.tex`, `paper/3_experiment.tex`
  - Copy priority: calibration strategy, hybrid quantization rationale, backend quantization consistency argument, edge runtime claims

- `tex/ch4_airimu/ch4.tex` (AirIMU)
  - Source files: `PaperOverleaf/AirIMU-paper/Sections/Introduction.tex`, `Sections/AirIMU_model.tex`, `Sections/Experiment.tex`
  - Copy priority: deterministic vs non-deterministic error framing, differentiable covariance propagation, cross-device validation

- `tex/ch5_airio/ch5.tex` (AirIO)
  - Source files: `PaperOverleaf/AirIO_RAL/Sections/Introduction.tex`, `Sections/Method.tex`, `Sections/Experiment.tex`, `Sections/Ablation.tex`
  - Copy priority: observability argument for body-frame representation, attitude encoding design, EKF fusion details, UAV-specific evidence

- `tex/ch5b_macinit/ch5b.tex` (MAC-I^2)
  - Source files: `PaperOverleaf/MACVIinit-RSS2026/Sections/Introduction.tex`, `Sections/Method.tex`, `Sections/Experiment.tex`, `Sections/Ablation.tex`
  - Copy priority: VI initialization failure modes, metrics-aware visual/inertial covariance fusion, robustness claims in degraded scenes

- `tex/ch1_intro/ch1.tex` and `tex/ch0/abstract.tex` (thesis-level synthesis)
  - Source files: all completed-paper abstracts/introductions above
  - Copy priority: unified motivation paragraph, cross-paper contribution bullets, completed-vs-proposed separation

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

## Priority TODOs for Missing or Revision Work

## P0: Must Fix for Coherent Proposal Defense

- [ ] `tex/ch1_intro/ch1.tex`: Fill `\section{Motivation}` or merge it with `Motivation: The Need for Generalizable Spatial Perception` to remove duplication.
- [ ] `tex/ch1_intro/ch1.tex`: Replace placeholder-level text for `C4`, `C5`, `C6` with concrete contribution claims (method + expected measurable outcome + risk).
- [ ] `tex/ch1_intro/ch1.tex`: Add one short "evidence of completion" paragraph grounded in completed papers (MAC-VO, QuantMAC-VO, AirIMU, AirIO, MAC-I^2).
- [ ] `tex/ch6_macvio/ch6.tex`: Replace all `[Content to be developed]` with full proposal content.
- [ ] `tex/ch7_macslam/ch7.tex`: Replace all `[Content to be developed]` with full proposal content.
- [ ] `tex/ch8_macio/ch8.tex`: Replace all `[Content to be developed]` with full proposal content.
- [ ] `tex/ch0/abstract.tex`: Rewrite abstract so it matches current chapter scope and naming (`MAC-VO`, `QuantMAC-VO`, `AirIMU`, `AirIO`, `MAC-I^2`, `MACVIO`, `MACSLAM`, `MAC-IO`), and clearly separates completed vs proposed work.
- [ ] Build a transfer checklist for completed chapters: copy "Problem", "Method", "Key Results", "Limitations", and "Bridge to next chapter" from each source paper.

## P1: Should Fix Before Sending to Committee

- [ ] `tex/appendices/appendices.tex`: Expand appendix stubs with concrete derivations, extra tables, and runtime details referenced in main chapters.
- [ ] `tex/appendices/notation.tex`: Fill notation appendix and decide whether to include it in `main.tex`.
- [ ] `tex/ch0/title.tex`: Replace committee placeholders (`Prof 1/2/3`) with actual names and affiliations.
- [x] `tex/ch0/part_II_imu.tex`: Part page rewritten for new structure (done).
- [x] `tex/ch0/part_IV_adaptation.tex`: Part page rewritten for new structure (done).
- [ ] Orphan part files and chapters moved to `tex/_orphan_not_in_build/` for reference.

## P2: Quality Upgrades That Improve Readability

- [ ] Add a one-paragraph "chapter bridge" at the end of each completed chapter to explain why the next chapter is needed.
- [ ] Add a consistent "Expected Deliverables and Risks" subsection to each proposed chapter (`ch6`, `ch7`, `ch8`) for proposal-style clarity.
- [ ] Add one thesis-level figure in Chapter 1 that visually maps RQ1-RQ7 to chapter contributions and status.
- [ ] Standardize terminology across all files (`metrics-aware covariance`, `learned uncertainty`, `cross-platform adaptation`) to avoid synonym drift.

## New TODOs from Example Proposal Review

- [ ] Add a short rationale paragraph under each research question in `tex/ch1_intro/ch1.tex` answering: why this question matters and what gap it closes.
- [ ] Add a compact "chapter-by-chapter roadmap" paragraph block at the end of Chapter 1 (one paragraph per chapter, 1-2 sentences each).
- [ ] Add an explicit evaluation framing subsection in Chapter 1 (accuracy, robustness, efficiency, transfer), mirroring how the example proposal separates what will be measured.
- [ ] Add a proposal timeline subsection with milestones and expected artifacts for `MACVIO`, `MACSLAM`, and `MAC-IO` (paper submission target, experiment completion target, writing completion target).
- [ ] Add a risk-and-mitigation table for proposed chapters (`ch6`, `ch7`, `ch8`) to improve committee confidence.
- [ ] Add one explicit statement that separates completed evidence from proposed hypotheses to avoid ambiguity during defense.

## Proposed Writing Order (Fastest Path to a Strong Draft)

1. Lock Chapter 1 story (`Motivation`, `Thesis Statement`, contributions table wording).
2. Fully draft `ch6` (MACVIO) because it is the key bridge from completed work to proposed roadmap.
3. Draft `ch7` (MACSLAM) with explicit covariance modeling and evaluation plan.
4. Draft `ch8` (MAC-IO) with adaptation protocol and zero-shot validation plan.
5. Rewrite abstract last, after chapter claims stabilize.
6. Fill appendices that are required for referenced equations and additional results.

## Execution Sprint (Start Acting on Plan)

Week 1:
- [ ] Rewrite `ch1` Motivation with the human analogy paragraph plus precise technical transition.
- [ ] Finalize RQ text and add one rationale paragraph per RQ.
- [ ] Add Chapter 1 evaluation framing and completed-vs-proposed separator paragraph.

Week 2:
- [ ] Draft full `ch6` (MACVIO): problem, method sketch, experiment plan, risks.
- [ ] Draft full `ch7` (MACSLAM): global covariance modeling, loop closure plan, evaluation plan.
- [ ] Draft full `ch8` (MAC-IO): EKF + preintegration self-supervision protocol and transfer validation.

## Items That Need Your Confirmation

- Confirm whether efficiency work (`QuantMAC-VO` and `CoMe`) is part of the thesis core claim or supporting evidence only.
- Confirm whether the scope includes contact learning / locomotion content (currently present as orphan chapters, not in `main.tex`).
- Confirm expected graduation timeline, because it changes how much depth is needed in proposed chapters versus completed chapters.

## Done-Definition for Proposal Readiness

- Every included chapter in `main.tex` has no placeholder blocks.
- Every research question maps to one chapter with a clear claim and evaluation plan.
- Abstract, introduction, and part pages use the same thesis vocabulary and scope.
- Appendix references resolve and support claims made in the main text.
