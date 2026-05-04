# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a LaTeX dissertation repository for a PhD thesis on **Uncertainty-Aware Spatial Perception for Generalizable State Estimation**. The thesis develops a framework for learning-based uncertainty estimation across visual and inertial modalities, enabling data-driven uncertainty models that adapt to new environments and platforms.

## Document Structure

The main document is structured as follows:

- `main.tex` - Root document that includes all chapters and handles document structure
- `preamble.tex` - Contains all package imports, custom commands, and LaTeX configuration
- `references.bib` - Bibliography file with research citations
- `tex/` - Directory containing all chapter content organized by chapter number

### Chapter Organization

The thesis is organized into three parts:

**Introduction & Background**
- Chapter 1 (`tex/ch1_intro/`) - Introduction
- Chapter 2 (`tex/ch2_background/`) - Background

**Part I: Vision Uncertainty and Learning-based Visual Odometry**
- Chapter 3 (`tex/ch3_macvo/`) - MAC-VO (stereo visual odometry)

**Part II: Inertial Uncertainty and Learning-based Inertial Odometry**
- Chapter 4 (`tex/ch4_airimu/`) - AirIMU (IMU preintegration uncertainty)
- Chapter 5 (`tex/ch5_airio/`) - AirIO (inertial odometry)

**Part III: Sensor Fusion and Adaptation with Metrics-Aware Uncertainty**
- Chapter 6 (`tex/ch6_macio/`) - MAC-IO (self-supervised inertial adaptation)
- Chapter 7 (`tex/ch7_macinit/`) - MAC-I² (VI initialization and calibration)

**Conclusion**
- Chapter 8 (`tex/ch9_conclusion/`) - Conclusion and Future Directions

**Appendices**
- `tex/appendices/appendices.tex` - Stub appendices for cross-references

### Key LaTeX Features

- **Custom Math Commands**: Extensive set of mathematical notation for robotics/SLAM (frames, rotations, vectors)
- **Styling**: Custom page geometry and spacing
- **Color Schemes**: Multiple color definitions (myblue, mygreen1, myred, etc.)
- **Bibliography**: Uses `natbib` with `unsrtnat` style
- **Figures**: Configured for subfigures with custom referencing format

## Build Commands

```bash
# Compile the document
pdflatex main.tex

# Build with bibliography
pdflatex main.tex
bibtex main
pdflatex main.tex
pdflatex main.tex

# Using latexmk (if available)
latexmk -pdf main.tex

# Clean auxiliary files
latexmk -c
```

## Custom Commands and Macros

The `preamble.tex` file defines extensive custom commands for:

- **Reference frames**: `\frm{I}`, `\frm{B}`, `\frm{C}` for inertial, body, camera frames
- **Rotation matrices**: `\RBI`, `\RIB`, etc.
- **Mathematical operators**: `\argmax`, `\argmin`, `\trace`, `\rank`
- **Abbreviations**: `\eg`, `\ie`, `\etc`, `\etal`, `\wrt`
- **Comments**: `\chnote{}`, `\mnote{}`, `\scnote{}` for different reviewers

## Notes for Editing

- Each chapter is self-contained in its directory under `tex/`
- The document uses `\include{}` for chapters and `\input{}` for smaller components
- See `THESIS_STORY_AND_TODO_PLAN.md` for the narrative plan and incomplete items
- Orphan files not in the build are stored in `tex/_orphan_not_in_build/`
- Always compile to verify LaTeX correctness
