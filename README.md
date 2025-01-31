# Meta-heuristic Optimization for Optimal Block Size in Multi-focus Image Fusion: A Comprehensive Comparative Study
# Citation
Harun AKBULUT, Emre BENDES

Journal: The Visual Computer

DOI: https://link.springer.com/journal/371

# Overview
This repository contains the implementation of a multi-focus image fusion method that utilizes 16 meta-heuristic optimization algorithms to determine the optimal block size for fusion. Multi-focus image fusion combines sharp regions from images captured at different focal distances to create a fully in-focus image in scenes with depth. The objective of this study is to enhance the performance of block-based fusion methods through meta-heuristic optimization, thereby improving both objective and subjective image quality. In this repository, only the Artificial Bee Colony (ABC) algorithm is provided as an example. However, the code can be suitably modified to incorporate the other algorithms.
# Key Features:
Comparison of 16 meta-heuristic optimization algorithms for determining the optimal block size in multi-focus image fusion.
Implementation of block-based fusion methods.
Evaluation through objective quality metrics and subjective assessments.
Lytro dataset used for experiments (five pairs of multi-focus images).
# Dataset
This implementation uses the Lytro dataset, which consists of pairs of multi-focus images. You can download the dataset from the following link:

Lytro Dataset Download (https://www.researchgate.net/publication/291522937_Lytro_Multi-focus_Image_Dataset)

# Requirements
Before running the provided code, ensure that you have the following prerequisites:

MATLAB R2016b or later is recommended.

# Results
The performance of the proposed method has been evaluated using objective metrics:

Variance 

Entropy 

Spatial frequency

Standard deviation 

Edge based QM 

Chen-Blum 

Nonlinear correlation information entropy 

Mutual Information 

Sum of the correlations of differences 

The results show that the Artificial Bee Colony (ABC) algorithm outperforms the other algorithms objective evaluations.


