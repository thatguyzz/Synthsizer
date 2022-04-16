# Synthsizer
Synthsizer written in Matlab in 2021

Interface is terrible, but it works and is even listenable :D

![image](https://user-images.githubusercontent.com/84450232/162446717-5a3c6372-8c19-45ed-8ee1-924fd40181f2.png)

Interface description:

·Signal number - number of signal we would like to add

·Shape - shape of signal with selected number

·Middle, Amplitude, X length - signal parameters

·Middle - Signal phase offset

·Amplitude  - Amplitude

·Xlength - Length of signal (does not apply to sine wave, which have max length

·Frequency - Frequency of generated signal (changes appear after pressing play button)

·Add - Add/Update plot of subsignal

·Play - Play signal and scale plot of subsignal

·Update plot - Update main plot

·Subsignal - Displays selected subsignal 

·Generated signal - Displays signal, which is sum of subsignals

-----------------------
How to use:

1. Select signal from Shape group

2. Set signal parameters (Middle, Amplitude, X length, Frequency)

3. Press add

4. You can listen signal by pressing play in Add Signal box

5. We can select new signal in Signal Number, set parameters and add it

6. If you want to see mixed signal press Update Plot above Generated Signal plot

7. If you want to hear mixed signal press Play above Generated Signal plot

8. You can set how to mix signals - Multiply/Sum - you can also append zeros with ones while multiplying

9. You can add low oscillation frequency to the signal - it can be summed and/or multiplied.

10. If you need to save configuration, you can do it by typing new preset name and pressign button below. Make sure you have selected directory.

11. If you want to load presets you can do it with Browse option and by selecting configuration file.
