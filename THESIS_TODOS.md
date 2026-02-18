# Thesis Proposal TODOs and Notes

Generated from project review. Use this file to track incomplete or attention-needed items.

## High Priority

### Title Page
- [ ] **tex/ch0/title.tex**: Replace "Prof 1", "Prof 2", "Prof 3" with actual thesis committee members

### Introduction (Ch1)
- [ ] **tex/ch1_intro/ch1.tex**: Fill or merge empty `\section{Motivation}` (line ~13); currently duplicated with `\section{Motivation: The Need for Generalizable Spatial Perception}`

### Appendices
- [ ] **tex/appendices/appendices.tex**: Expand stub appendices with full content:
  - `appendix:Project2DTo3D`: 2D→3D covariance derivation
  - `appendix:AdditionalResults`: EuRoC even, KITTI odd, TartanAir Easy tables
  - `appendix:AdditionalAblation`: Per-trajectory ablation
  - `appendix:RuntimeAnalysis`: Runtime breakdown for MAC-VO modes

### Proposed Chapters (Placeholder Content)
- [ ] **tex/ch6_macvio/ch6.tex**: Replace "[Content to be developed]" throughout
- [ ] **tex/ch7_macslam/ch7.tex**: Replace "[Content to be developed]" throughout
- [ ] **tex/ch8_macio/ch8.tex**: Replace "[Content to be developed]" throughout

## Medium Priority

### Abstract
- [ ] **tex/ch0/abstract.tex**: Align abstract with current thesis scope (MAC-VO, AirIMU, AirIO, QuantMAC-VO, MAC-I², MACVIO, MACSLAM, MAC-IO). Consider adding CoMe and RQ7 (efficiency).

### Notation Appendix
- [ ] **tex/appendices/notation.tex**: Fill content (currently `\chnote{to fill}`). Not included in main.tex; add `\input{tex/appendices/notation}` if needed.

## Orphan Files (Not in main.tex Build)

These files exist but are not included in the compiled document. Keep for future use or remove if obsolete:

| File | Description |
|------|-------------|
| tex/ch8_conclusion/ch8.tex | Old conclusion chapter (superseded by ch11_conclusion/ch10.tex) |
| tex/ch9_contact_learning/ch9.tex | Contact learning from legged odometry (not in current scope) |
| tex/ch10_IMU_tokenizer/ch9.tex | Uncertainty-aware perceptive locomotion (not in current scope) |
| tex/ch0/part_V_prior.tex | Part V: Foundation model prior (references non-existent chapters) |
| tex/ch0/part_I_spatial.tex | Alternate part header |
| tex/ch0/part_IV_scene.tex | Alternate part header |
| tex/ch0/part_II_uncertainty.tex | Alternate part header |
| tex/ch0/part_III_adaptation.tex | Alternate part header |
| tex/ch0/acknowledgements.tex | Acknowledgements (not included) |

## Completed Fixes (This Review)

- [x] Abstract: Fixed "AirDOS" → "AirIMU"
- [x] ch8_macio: Fixed fancyhead "Chapter 7" → "Chapter 8"
- [x] ch8_macio: Fixed MACIO expansion "Multi-Agent..." → "Metrics-Aware Cross-Platform Inertial Odometry"
- [x] preamble.tex: Removed duplicate xcolor package
- [x] ch1: Replaced template placeholders for C4, C5, C6 with brief descriptions + TODO
- [x] Added appendix stubs to resolve undefined references

## CLAUDE.md

- [ ] **CLAUDE.md**: Update chapter organization to match main.tex (MAC-VO, QuantMAC-VO, AirIMU, AirIO, MAC-I², MACVIO, MACSLAM, MAC-IO structure)
