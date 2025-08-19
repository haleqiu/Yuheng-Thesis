# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a LaTeX dissertation repository for a PhD thesis on resilient visual perception systems for autonomous robots. The thesis focuses on IMU-centric SLAM systems that treat the IMU as the primary sensor with visual and LiDAR inputs serving as corrective measurements.

## Document Structure

The main document is structured as follows:

- `main.tex` - Root document that includes all chapters and handles document structure
- `preamble.tex` - Contains all package imports, custom commands, and LaTeX configuration
- `references.bib` - Bibliography file with research citations
- `tex/` - Directory containing all chapter content organized by chapter number

### Chapter Organization

The thesis is organized into distinct parts:

**Part I - Prior Work:**
- Chapter 1 (`tex/ch1_intro/`) - Introduction 
- Chapter 2 (`tex/ch2_background/`) - Background
- Chapter 3 (`tex/ch3_superodom/`) - Super Odometry (unified sensor fusion)
- Chapter 4 (`tex/ch4_superloc/`) - SuperLoc (geometric uncertainty estimation)
- Chapter 5 (`tex/ch5_mso/`) - MSO (visual uncertainty estimation)
- Chapter 6 (`tex/ch6_tartanimu/`) - TartanIMU (adaptation strategies)
- Chapter 7 (`tex/ch7_superodom2.0/`) - Super Odometry 2.0

**Part II - Proposed Work:**
- Chapter 8 (`tex/ch8_supermap/`) - SuperMap (semantic SLAM)
- Chapter 9 (`tex/ch9_sparsevio/`) - SparseVIO (foundation model priors)
- Chapter 10 (`tex/ch10_proposed_timeline/`) - Timeline

### Key LaTeX Features

- **Custom Math Commands**: Extensive set of mathematical notation for robotics/SLAM (frames, rotations, vectors)
- **Styling**: Uses `tgpagella` font with custom page geometry and spacing
- **Color Schemes**: Multiple color definitions for different chapters (myblue, mygreen1, myred, etc.)
- **Bibliography**: Uses `natbib` with `unsrtnat` style
- **Figures**: Configured for subfigures with custom referencing format
- **Algorithms**: Support for algorithm2e and custom pseudocode styling

## Build Commands

This is a standard LaTeX project. Common build commands:

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
- **Vector notation**: `\vec`, `\dvec`, `\ddvec` with custom arrow styling
- **Comments**: `\chnote{}`, `\mnote{}`, `\scnote{}` for different reviewers
- **Abbreviations**: `\eg`, `\ie`, `\etc`, `\etal`, `\wrt`

## File Management

The repository uses a comprehensive `.gitignore` for LaTeX auxiliary files. Key files to preserve:
- All `.tex` source files
- `references.bib` bibliography
- `*.sty` style files like `ninecolors.sty`
- Image files (though PDFs are gitignored, source images should be kept)

## Notes for Editing

- Each chapter is self-contained in its directory under `tex/`
- The document uses `\include{}` for chapters and `\input{}` for smaller components
- Custom page styles are defined for different chapters
- The thesis supports both draft and final modes via the `ifdraft` package
- Todo notes are supported via the `todonotes` package