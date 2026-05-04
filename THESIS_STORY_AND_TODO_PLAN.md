# Thesis Story and TODO Plan

This document defines the overall narrative for the dissertation and lists the highest-impact missing or revision items.
It mirrors the structure used in the thesis defense (`Thesis-Yuheng.pdf`) so drafting decisions stay consistent across chapters.

## Working Thesis Title

Uncertainty-Aware Spatial Perception for Generalizable State Estimation

## One-Sentence Thesis Story

State estimation generalizes across environments, sensors, and robot platforms when covariance is learned from data with physical scale, then carried through visual perception, inertial perception, and visual-inertial fusion as a first-class signal.

## Origin Story (Bitter Lesson from AirDOS)

The dissertation grows out of AirDOS, an early dynamic-object SLAM system that required heavy manual tuning of factor uncertainties and still failed to generalize to new dynamic scenes.
That experience produced the bitter lesson at the core of this thesis: in spatial perception, performance scales not by adding human-crafted heuristics for every failure mode, but by learning uncertainty directly from data.
The thesis applies this lesson by replacing hand-tuned covariance with learned, metrics-aware covariance throughout visual, inertial, and visual-inertial estimation.

## Three-Part Story Map (matches defense)

### Part I — Visual Perception with Learned Metrics-Aware Covariance (Ch 3)

- `MAC-VO` (Ch 3): metrics-aware 2D matching covariance and 3D point covariance with inter-axis correlations for stereo VO.
- Cross-payload extension `MAC-Thermal`: zero-shot transfer of MAC-VO to thermal cameras, enabling passive night-time off-road autonomy.
- Efficiency extension `QuantMACVO`: quantization for efficient deployment of learned VO on embedded compute.
- Narrative role: establish learned metrics-aware visual covariance as the first foundation, with deployment evidence on diverse cameras and payloads.

### Part II — Inertial Perception with Learned Uncertainty (Ch 4--5)

- `AirIMU` (Ch 4): differentiable IMU integration and covariance propagation for learning IMU sensor noise and uncertainty across automotive-grade to navigation-grade IMUs (TUMVI, EuRoC, SubT-MRS, KITTI, ALTO).
- `AirIO` (Ch 5): body-frame IMU representation with attitude encoding and uncertainty-aware EKF fusion of AirIMU; outperforms global-frame baselines and works on UAVs without thrust or external sensors.
- Narrative role: build a learned inertial counterpart to MAC-VO that supports continuous motion estimation when external sensing degrades.

### Part III — Sensor Fusion and Adaptation Powered by Learned Uncertainty (Ch 6--7)

- `MAC-IO` (Ch 6): self-supervised pretrain-then-adapt pipeline for inertial odometry on a new embodiment from unlabeled IMU; embodiment pretraining matches network-predicted velocity increments to AirIMU-corrected preintegration increments with a Mahalanobis loss, and PGO posterior adaptation distills sliding-window posterior velocity mean and covariance back into the network through teacher-to-student KL. Works in both from-scratch (random init) and adaptation (supervised checkpoint) settings, with optional labeled-memory rehearsal for covariance anchoring.
- `MAC-I^2` (Ch 7): tuning-free visual-inertial initialization and online camera-IMU calibration using metrics-aware visual and inertial covariance from MAC-VO and AirIMU.
- Narrative role: turn metrics-aware covariance into practical adaptation, initialization, and calibration tools for visual-inertial deployment.

### Conclusion and Future Work (Ch 9)

- Synthesis of contributions and the bitter-lesson framing.
- Future direction 1: reformulate the objective of state estimation around uncertainty-aware data generation (`OmniRetarget`-style for humanoid loco-manipulation).
- Future direction 2: spatial memory through confidence-guided token merging in visual geometric transformers (`Co-Me`).

## Chapter-to-Directory Map

| Ch # | Directory | Topic | Defense slide block |
|------|-----------|-------|---------------------|
| 1 | `tex/ch1_intro/` | Introduction (bitter lesson, thesis statement, organization) | 1--11 |
| 2 | `tex/ch2_background/` | Background and Related Work | 4 (SLAM background) |
| 3 | `tex/ch3_macvo/` | MAC-VO (with MAC-Thermal, QuantMACVO discussion) | 11--26 |
| 4 | `tex/ch4_airimu/` | AirIMU | 27--39 |
| 5 | `tex/ch5_airio/` | AirIO | 40--51 |
| 6 | `tex/ch6_macio/` | MAC-IO | 53--70 |
| 7 | `tex/ch7_macinit/` | MAC-I^2 | 71--81 |
| 8 | `tex/ch9_conclusion/` | Conclusion and Future Directions | 85--87 |

The defense order presents MAC-IO before MAC-I^2; the thesis keeps MAC-I^2 first because initialization logically precedes adaptation in a written narrative. Both orderings are acceptable, but be consistent in transitions.

## Internalized Completed Works from `PaperOverleaf`

- `MACVO-ICRARAL-2024`: metrics-aware 2D uncertainty and 3D covariance with inter-axis correlations for stereo VO. Source for Ch 3.
- `AirIMU-paper`: differentiable preintegration and covariance learning across IMU grades; reports cross-device generalization and 31.6\% PGO improvement. Source for Ch 4.
- `AirIO_RAL`: body-frame IMU representation with 66.7\% average improvement and additional 23.8\% from attitude encoding; uncertainty-aware EKF fusion. Source for Ch 5.
- `MACVIinit-RSS2026` (`MAC-I^2`): tuning-free VI initialization and online calibration with learned visual and inertial covariance. Source for Ch 6.
- `MACIO-CORL-2026` (`MAC-IO`): self-supervised pretrain-then-adapt pipeline for embodiment-specific inertial odometry from unlabeled IMU. Step 1 (embodiment pretraining) uses AirIMU-corrected preintegration as a Mahalanobis teacher for velocity increments. Step 2 (PGO posterior adaptation) builds a sliding-window pose graph that fuses AirIMU preintegration with network velocity factors, computes a Laplace posterior, and distills posterior velocity mean and covariance back into the network through teacher-to-student KL. Optional labeled-memory rehearsal anchors covariance when a small labeled split is available. Verified on TLIO with AVE reduced from `0.1025` m/s (non-adapted baseline) to `0.0398` m/s after PGO posterior adaptation (61% reduction without embodiment labels), and a further `0.0334` m/s when a final PGO is run on top. The same machinery improves a supervised pretrained IO model by up to `2.6x` in network AVE and `3.1x` after PGO. Source for Ch 7.
- `CVPR-2026-Confidence-Guided-Token-Merging-submission` (`Co-Me`): efficient visual geometry transformers via confidence-guided token merging; cited as a future direction (spatial memory) in Ch 9.
- `Offroad-Nighttime-Autonomy-2026-Shared`: full-stack passive thermal autonomy; appears as the MAC-Thermal extension within Ch 3 and as deployment evidence.

## Source-to-Chapter Copy Map (for Draft Transfer)

- `tex/ch3_macvo/ch3.tex` (MAC-VO)
  - Source files: `PaperOverleaf/MACVO-ICRARAL-2024/Sections/{Introduction,Method,Experiment,Conclusion}.tex`
  - Copy priority: problem setup, metrics-aware covariance formulation, ablation logic, benchmark comparison narrative.
  - Add: short MAC-Thermal subsection on payload generalization, brief mention of QuantMACVO for efficient deployment.

- `tex/ch4_airimu/ch4.tex` (AirIMU)
  - Source files: `PaperOverleaf/AirIMU-paper/Sections/{Introduction,AirIMU_model,Experiment}.tex`
  - Copy priority: deterministic vs non-deterministic error framing, differentiable covariance propagation, cross-device validation across TUMVI/EuRoC/SubT-MRS/KITTI/ALTO.

- `tex/ch5_airio/ch5.tex` (AirIO)
  - Source files: `PaperOverleaf/AirIO_RAL/Sections/{Introduction,Method,Experiment,Ablation}.tex`
  - Copy priority: observability argument for body-frame representation, attitude encoding design, EKF fusion with AirIMU, UAV-specific evidence on Blackbird and Pegasus.

- `tex/ch7_macinit/ch7.tex` (MAC-I^2)
  - Source files: `PaperOverleaf/MACVIinit-RSS2026/Sections/{Introduction,Method,Experiment,Ablation}.tex`
  - Copy priority: VI initialization failure modes, metrics-aware visual/inertial covariance fusion, robustness in extreme exposure, occlusion, and dynamic objects.

- `tex/ch6_macio/ch6.tex` (MAC-IO)
  - Source files: `PaperOverleaf/MACIO-CORL-2026/corl_2026_template_submission/Sections/{Introduction,RelatedWork,Method,Experiment,Ablation,Conclusion}.tex` and `STORY.md` for vocabulary.
  - Copy priority:
    1. Embodiment label bottleneck and the question "Can an IMU perception model learn an embodiment-specific motion prior from unlabeled IMU alone?"
    2. Universal IMU integration as the source of self-supervision; AirIMU as the optional learned correction and uncertainty model.
    3. Step 1 embodiment pretraining: Mahalanobis loss on velocity-increment residual, with the teacher covariance defining the metric (no log-det term).
    4. Step 2 PGO posterior adaptation: sliding-window pose graph, Laplace posterior, posterior-velocity loss plus teacher-to-student KL on covariance.
    5. From-scratch vs adaptation settings reported as separate results.
    6. Optional labeled-memory rehearsal for covariance anchoring.
    7. TLIO numbers: 0.1025 -> 0.0858 (Step 1) -> 0.0398 (Step 2) -> 0.0334 (PGO on adapted network); pretrained-model setting up to 2.6x and 3.1x improvement.
    8. BlackBird, MIPO, EuRoC results (mark `[VERIFY]` until reproduced); EuRoC must be stated as IMU-stream-only.
  - Vocabulary: use "embodiment", "embodiment-specific motion prior", "embodiment pretraining", "PGO posterior adaptation", "pretrain-then-adapt pipeline", "few-label variant", "fully supervised upper bound". Avoid "target-domain", "anchor-assisted", "reliability-weighted", "velocity-value constraint", "sequence-level motion context", "global velocity context".

- `tex/ch1_intro/ch1.tex` and `tex/ch0/abstract.tex` (thesis-level synthesis)
  - Sources: bitter-lesson framing from defense slides 5--9; current paper introductions.
  - Copy priority: unified motivation paragraph, three-part organization, contribution table mirrored from defense slide 84.

## Reuse Rules for Copying from Papers

- Reuse contribution-level technical claims, but reframe per chapter in thesis voice (what this chapter establishes for the next chapter).
- Keep quantitative claims only when exact numbers appear in the source paper or defense slides and stay consistent with the current draft scope.
- Prefer copying method/problem paragraphs first, then rewrite transitions for thesis flow.
- Mark uncertain performance numbers with `[VERIFY]` during transfer if tables are not yet copied.
- Do not introduce em dashes; keep one sentence per line in `.tex` source.

## What the Committee Should Remember

- The problem is uncertainty miscalibration under shift, not just model accuracy.
- The central technical currency is metrics-aware covariance, learned and calibrated from data.
- The progression is visual perception, inertial perception, then sensor fusion and adaptation through MAC-IO and MAC-I^2.
- The practical claim is robust and efficient transfer to real deployments without per-platform retuning.

## Inconsistencies Resolved In This Pass

- Defense uses three parts; thesis previously used four. The thesis now uses three parts and removes the unfinished system chapter from the active build.
- Previous plan listed an unfinished visual-inertial SLAM system as both a Part III item and a Part IV item. That material is now excluded from the submitted thesis draft until it is complete.
- `\partIVTitle` macro removed from `preamble.tex`; remaining part macros renamed to match defense titles. Any chapter using `\partIVTitle` must be updated.
- Abstract, introduction, and `main.tex` part comments now refer to the same three parts.
- MAC-IO description aligned with `MACIO-CORL-2026`: pretrain-then-adapt rather than just "adaptation", PGO (not EKF) for the posterior step, and "embodiment" rather than "platform" or "real data" as the unit of transfer.

## Inconsistencies To Watch (Cross-Document)

- Defense slides and thesis contributions use slightly different MAC-IO framing. The defense calls it "Self-supervised method for Learning IO" and lists racing drones, VR glasses, legged robots as deployment targets. The CORL paper uses "embodiment" as the unifying term and reports TLIO as the verified dataset, with BlackBird/MIPO/EuRoC in progress. The thesis chapter should follow the paper's vocabulary and reserve the broader deployment list as evidence to add once verified.
- Defense slides 56--62 show a labeled "anchoring" route in MAC-IO. In the CORL paper, this corresponds to the optional labeled-memory rehearsal in `\mathcal{L}^{\mathrm{mem}}`. The thesis should not promise label-free anchoring; describe rehearsal as an optional add-on to the fully self-supervised core.

## Priority TODOs

### P0: Must Fix for Complete Thesis

- [ ] `tex/ch6_macio/ch6.tex`: Expand into a full MAC-IO chapter using `PaperOverleaf/MACIO-CORL-2026` as source. Use the paper's vocabulary (`embodiment`, `embodiment pretraining`, `PGO posterior adaptation`, `pretrain-then-adapt pipeline`). Frame the chapter around the embodiment label bottleneck, present Step 1 and Step 2 with their math, and report TLIO numbers (0.1025 -> 0.0398 m/s, 61% reduction) as the headline result. Add BlackBird, MIPO, EuRoC results when verified, with `[VERIFY]` tags otherwise. Mention the optional labeled-memory rehearsal as an anchoring add-on.
- [ ] Search the repo for any remaining `\partIVTitle` references in chapter or appendix files and remove or remap them.
- [ ] Confirm the `tex/ch1_intro/YuhengThesisfig1.pdf` overview figure shows three parts (not four). If not, regenerate from defense slide 10 or slide 84.

### P1: Should Fix Before Submission

- [ ] Add a one-paragraph chapter bridge at the end of Ch 3, Ch 5, Ch 6, Ch 7 that previews the next chapter using the part-level narrative.
- [ ] In Ch 3, add brief MAC-Thermal and QuantMACVO subsections so Part I matches the defense scope.
- [ ] `tex/appendices/appendices.tex`: Expand stubs with derivations and runtime details referenced in main chapters.
- [x] `tex/appendices/notation.tex`: Removed (was empty `\chnote{to fill}` placeholder, never `\input`-ed).
- [ ] Ensure orphan chapter files in `tex/_orphan_not_in_build/` are not referenced by `main.tex`.

### P2: Quality Upgrades That Improve Readability

- [ ] Standardize terminology across all files (`metrics-aware covariance`, `learned uncertainty`, `cross-platform adaptation`).
- [ ] Add a thesis-level contribution figure adapted from defense slide 84 to the conclusion chapter.
- [ ] Make sure the MAC-IO chapter introduces self-supervision with the same motivation phrasing as the defense (Generic vs Overfitting on Blackbird/EuRoC).

## Writing Order (Fastest Path to a Strong Draft)

1. Lock Chapter 1 story (`Motivation`, `Thesis Statement`, contributions list) with the three-part structure.
2. Draft Ch 6 (MAC-IO) using the CORL source paper.
3. Polish Ch 7 (MAC-I^2) as the final technical chapter.
4. Light-touch revision pass on Ch 3, Ch 4, Ch 5, Ch 6, and Ch 7 to align voice and bridges.
5. Rewrite abstract last, after chapter claims stabilize.
6. Fill appendices for referenced equations and additional results.

## Done-Definition for Thesis Readiness

- Every included chapter in `main.tex` has no placeholder blocks and follows the three-part narrative.
- Every contribution maps to one chapter with a clear claim and evaluation.
- Abstract, introduction, and chapter intros use the same three-part vocabulary and do not reference unfinished system material.
- Appendix references resolve and support claims made in the main text.
- The bitter-lesson framing from AirDOS appears explicitly in the introduction and is referenced once in the conclusion.
