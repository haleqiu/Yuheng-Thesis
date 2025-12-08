# Thesis Title: Learning Uncertainty for Spatial Intelligence

# Thesis Motivation and Contribution
1. 
1. Incoperating the Learning uncertianty in autonomy system to make robust system under extreme condition.
2. bridging the learned visual foundation model to online on-device setup.

## Thesis Statement
**"This thesis develops a comprehensive framework for generalizable robotic perception that leverages learning-based uncertainty estimation across multiple sensor modalities, enabling data-driven uncertainty models that adapt to new environments, platforms, and interaction scenarios without manual parameter tuning."**

## Executive Summary
This thesis presents seven interconnected works that advance learning-based uncertainty estimation across the robotic perception pipeline. Starting with individual sensor modalities (MACVO for visual perception, AirIMU for inertial uncertainty, AirIO for inertial odometry), the research progresses to multi-sensor fusion systems (MACVIO for visual-inertial SLAM, MACIO for cross-platform adaptation), and culminates in physical interaction applications (contact learning from legged odometry and perceptive locomotion). The unified theme is that learned uncertainty models, rather than hand-tuned parameters, enable robust generalization across diverse robotic platforms and environmental conditions, ultimately advancing spatial intelligence for autonomous systems.

## Research Questions

**Part I: Learning Uncertainty from Individual Sensor Modalities**

**RQ1 - Visual Uncertainty Learning (MACVO)**: Why do traditional hand-tuned covariance matrices fail in diverse visual conditions, and how can we learn metrics-aware uncertainty models for visual feature correspondence that generalize across different stereo camera configurations and environmental conditions?

**RQ2 - Inertial Uncertainty Learning (AirIMU)**: Why do fixed IMU noise models perform poorly across different platforms, and how can we develop data-driven approaches to learn IMU preintegration uncertainty models that capture platform-specific noise characteristics?

**RQ3 - Inertial Odometry Enhancement (AirIO)**: Why is enhanced IMU feature observability crucial for robust motion estimation, and how can learning-based approaches enable uncertainty-aware inertial odometry in GPS-denied environments?

**Part II: Learning Uncertainty in Multi-Sensor Systems**

**RQ4 - Cross-Modal Uncertainty Fusion (MACVIO)**: Why is uncertainty the theoretical foundation for optimal sensor fusion, and how can we learn cross-modal uncertainty correlations between visual and inertial sensors to enable adaptive fusion weights and uncertainty-driven sensor selection?

**RQ5 - Cross-Platform Adaptation (MACIO)**: Why do current perception systems fail to generalize across robotic platforms, and how can we develop self-supervised domain transfer methods for uncertainty models that enable zero-shot deployment with automatic sensor configuration?

**Part III: Learning for Contact-Rich Robotics**

**RQ6 - Contact Learning from Legged Odometry**: Why is perception uncertainty propagation critical for contact-rich robotics, and how can we enable force-vision fusion for legged locomotion with contact-aware perception models?

**RQ7 - Uncertainty-Aware Locomotion**: Why does uncertain perception require fundamentally different locomotion strategies, and how can we develop uncertainty-driven planning that learns from physical interaction feedback to enable safe exploration and generalizable skills? 

## Current Research Foundation

**Key Completed Work**:
- **MACVO**: Metrics-aware covariance for stereo visual odometry (ICRA 2025 Best Paper)
- **AirIMU**: Learning the noise and uncertainty inherent in the IMU preintegration
- **AirIO**: Learning inertial odometry with enhanced IMU feature observability  

**Proposed Work**:
- **MACVIO**: Learning-based Visual Inertial SLAM system that benefits from learned-uncertainty
- **MACIO**: Self-adaptation and cross-platform uncertainty models
- **Contact Learning**: Learning from legged odometry for contact-rich robotics
- **Perceptive Locomotion**: Uncertainty-aware locomotion and manipulation
**Research Focus**: Learning-based uncertainty estimation to empower generalizable spatial perception for robotics.


# THESIS ORGANIZATION

## Background and Introduction (Chapters 1-2)
**Focus**: Establishing the problem space and foundations

### Chapter 1: Introduction
- **1.1** Problem Statement: The Need for Generalizable Perception
- **1.2** Research Challenges in Learning-Based Robotic Perception
- **1.3** Thesis Contributions and Organization
- **1.4** Impact on Autonomous Robotics

### Chapter 2: Background and Related Work  
- **2.1** Traditional SLAM and Perception Approaches
- **2.2** Multi-Sensor Fusion and Adaptation
- **2.3** Physical Robot Interaction Systems
- **2.4** Gap Analysis and Research Motivation

---

## Part I: Perception - Learning Uncertainty from Individual Sensor Modalities (Chapters 3-5)
**Focus**: Developing uncertainty models for individual perception modalities

### Chapter 3: Visual Perception Uncertainty (MACVO)
- **3.1** Introduction: Learning uncertainty for visual correspondence
- **3.2** Related work on visual SLAM uncertainty
- **3.3** Method: Metrics-Aware Visual Uncertainty Learning for feature correspondence
- **3.4** Method: Stereo Vision Uncertainty Modeling
- **3.5** System Overview: an efficient and real-time design
- **3.6** Experiment: Generalization Across Visual Conditions

### Chapter 4: Inertial Perception Uncertainty (AirIMU)
- **4.1** IMU Preintegration Uncertainty Learning
- **4.2** Data-Driven Noise Model Estimation
- **4.3** Cross-Platform IMU Adaptation
- **4.4** Uncertainty Propagation in Motion Estimation

### Chapter 5: Inertial Odometry (AirIO)
- **5.1** Learning IMU Feature Observability
- **5.2** Uncertainty-Aware Inertial Odometry
- **5.3** Integration with Visual Perception
- **5.4** Real-Time Uncertainty Estimation

---

## Part II: Fusion - Learning Uncertainty in Multi-Sensor Systems (Chapters 6-7)
**Focus**: Adaptive fusion of learned uncertainties across different sensor configurations

### Chapter 6: Multi-Modal Perception Fusion (MACVIO)
- **6.1** Cross-Modal Uncertainty Correlation Learning
- **6.2** Adaptive Sensor Fusion Weights
- **6.3** Uncertainty-Driven Sensor Selection
- **6.4** Visual-Inertial SLAM with Learned Uncertainty

### Chapter 7: Cross-Platform Adaptation (MACIO)
- **7.1** Self-Supervised Domain Transfer
- **7.2** Platform-Agnostic Uncertainty Models
- **7.3** Automatic Sensor Configuration
- **7.4** Zero-Shot Deployment on New Platforms

---

## Part III: Physical-World Interaction - Learning for Contact-Rich Robotics (Chapters 8-9)
**Focus**: Uncertainty-aware learning for physical robot interaction and manipulation

### Chapter 8: Contact Learning from Legged Odometry
- **8.1** Uncertainty Propagation from Perception to Action
- **8.2** Contact-Rich State Estimation with Uncertain Perception
- **8.3** Force-Vision Fusion for Legged Locomotion
- **8.4** Learning Contact-Aware Perception Models

### Chapter 9: Perceptive Locomotion
- **9.1** Uncertainty-Driven Locomotion Planning
- **9.2** Learning from Physical Interaction Feedback
- **9.3** Safe Exploration with Perception Uncertainty
- **9.4** Generalizable Locomotion Skills

---

## Conclusion and Future Directions (Chapter 10)
**Focus**: Comprehensive evaluation and future research directions
