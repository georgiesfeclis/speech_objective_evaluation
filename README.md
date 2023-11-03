# Audio Quality Evaluation

This MATLAB function evaluates the quality of enhanced audio files by comparing them with their clean references.

## Functionality

The `evaluateEnhancedAudio` function takes two directory paths as input: one for the clean audio files and another for the enhanced audio files. It calculates the Perceptual Evaluation of Speech Quality (PESQ) and the Extended Short-Time Objective Intelligibility (ESTOI) scores for each pair of audio files.

## Usage

To use this function, provide the paths to the directories containing the clean and enhanced `.wav` files, as well as the sampling frequency (`fs`) of the audio files.

```matlab
evaluateEnhancedAudio(cleanFolder, enhancedFolder, fs)
```

### Arguments

- `cleanFolder`: Path to the directory containing the clean `.wav` files.
- `enhancedFolder`: Path to the directory containing the enhanced `.wav` files.
- `fs`: Sampling frequency of the audio files.

### Output

The function will print out the total number of files evaluated and the mean PESQ and ESTOI scores for the dataset.

### Dependencies

The function requires `natsortfiles`, which can be obtained from MATLAB Central File Exchange or included in the repository under `./../natsortfiles/`.



