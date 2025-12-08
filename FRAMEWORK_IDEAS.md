# Framework Development - Yuheng Qiu's Thesis

## Current Research Summary
Based on http://haleqiu.github.io/, Yuheng's research focuses on:

**Vision**: "I hope that one day, SLAM will be fully automated—so much so that SLAM engineers like me will become unnecessary."

**Key Completed Work**:
- **MAC-VO**: Metrics-aware covariance for stereo visual odometry (ICRA 2025 Best Paper)
- **AirIO**: Learning inertial odometry with enhanced IMU feature observability  
- **AirIMU**: Learning the noise and uncertainty inherent in the IMU preintegration

**Research Focus**: Learning-based SLAM systems that automatically adapt to different platforms and sensors

## Proposed Framework Ideas

### Framework 1: [To be discussed with Yuheng]
**Name**: MACVIO
**Core Concept**: learning the metrics-aware uncertainty from both the visual input and the IMU. 
**Key Components**:
- Maximum performance for multisensor fusion, since the
- Competable with LiDAR
- 

**Technical Approach**:
- 
- 

**Expected Contributions**:
- 
- 

### Framework 2: .03MACIO [To be discussed with Yuheng]
**Name**: MACIO
**Core Concept**: Frist Self learning and adaptable framework when transform the algorithm to a new payload or data modality 
**Key Components**:
- Use the integration and learned uncertainty from AirIMU to run self supervision on other platforms.
- 

### Framework 3: [To be discussed with Yuheng]
**Name**: 
**Core Concept**: Frist Self learning and adaptable framework when transform the algorithm to a new payload or data modality 
**Key Components**:
- 
- 

### Questions for Discussion:
1. What is the overarching framework you envision for automated SLAM?
2. How do foundation models fit into your proposed approach?
3. What are the key technical challenges you want to address?
4. How does this build on your existing work (MAC-VO, AirIO, AirDOS)?
5. What makes your approach different from existing learning-based SLAM methods?

### Technical Considerations:
- **Generalization**: How to ensure the framework works across different platforms
- **Uncertainty**: How to handle uncertainty estimation in learned systems
- **Efficiency**: Computational requirements for real-time operation
- **Robustness**: Handling failure cases and degraded conditions

### Evaluation Plan:
- Datasets to use
- Metrics for measuring "automation" success
- Comparison baselines
- Real-world validation scenarios

---

## Notes:
- This document should be used to brainstorm and refine framework ideas
- Will be updated based on discussions with Yuheng
- Should inform the proposed work sections of the thesis