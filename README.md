# Max Lyapunov Exponent

Here we apply max Lyapunov exponent approach using the algorithm suggested by Rosenstein, 1993 with the modification suggested by Beaudette, 2016 to two different examples:

1. Calculating max Lyapunov exponent for recorded kinematic data of a repetitive handling task.
2. Lorenz system.

**Refs:**

1. Rosenstein, Michael T., James J. Collins, and Carlo J. De Luca. "A practical method for calculating largest Lyapunov exponents from small data sets." _Physica D: Nonlinear Phenomena_ 65.1-2 (1993): 117-134.
2. Beaudette, Shawn M., et al. "On the use of a Euclidean norm function for the estimation of local dynamic stability from 3D kinematics using time-delayed Lyapunov analyses." _Medical engineering & physics_ 38.10 (2016): 1139-1145.

**Prerequisits:**

1. Statistics and Machine Learning Toolbox (_ **pdist** _ function)

## Repetitive lifting task

Trunk rotation was extracted from the T8 segment. As the number of data samples per cycle can influence the estimate of stability, the data were resampled to obtain a mean value of 300 data samples per movement cycle (50 samples per second) while preserving the cycle-to-cycle variability in movement. The Euclidean norm transformation function was used to combine the rotation into a single time-series. Prior to normalization, T8 rotations were independently shifted to avoid the incidence of zero-crossings (Beaudette et al., 2016). In order to reconstruct the state-space of the normalized signal, a constant time delay of 30 samples (10% of the length of the average cycle) with embedding dimension of 5 was used for all trials (Granata and England, 2006).

 **Ref:** Granata, Kevin P., and Scott A. England. "Stability of dynamic trunk movement." Spine 31.10 (2006)

![Original rotation data of thorax](README-figs\spine-org-sig.jpg "Original rotation data of thorax")

### Normalizing signal using method proposed by Beaudette et al. 2016

Based on Beaudette, 2016, to develop a standard for the analysis of 3D dynamic kinematic waveforms, all dimensions of a 3D signal should be shifted independently to avoid the incidence of zero-crossings prior to the calculation of Euclidean norm and subsequent estimation of local dynamic stability through the use of .

![Normalized signal](README-figs\spine-org-sig-norm.jpg "Normalized signal")

### Calculating Lyapunov Exponent

Short-term and long-term LyE (LyE-S, LyE-L) were identified by fitting a line through the average logarithmic divergence plot spanning over 0–0.5 and 4–10 cycles, respectively (Beaudette et al., 2016; Madinei et al., 2021). Larger exponents indicate greater sensitivity to local perturbations, with negative and positive signs corresponding to local stability and local instability, respectively.

### Reconstructed trajectory

![Normalized signal](README-figs\spine-sig-reconstructed.jpg "Normalized signal")

## Divergence curve

![Normalized signal](README-figs\spine-convergence.jpg "Normalized signal")

## Lorenz system

### Data generation

![Normalized signal](README-figs\lorenz-org-sig.jpg "Normalized signal")

### Calculating max Lyapunov exponent based on a single state

Taking the first state of the original signal.

![Normalized signal](README-figs\lorenz-org-sig-x.jpg "Normalized signal")

## Reconstructed trajectory

![Normalized signal](README-figs\lorenz-reconstructed.jpg "Normalized signal")

## Divergence curve

![Normalized signal](README-figs\lorenz-convergence.jpg "Normalized signal")