# Fast-Fourier-Transform-on-VHDL
In this VHDL module FFT IP core on vivado has been used and signal that is comprised of additions of 31Hz and 97Hz has been sent via Coe file. After fast fourier transform operations on IP core real and imaginary axis are multiplied by themselves seperately and those results were added and recorded on another dual port ram. To have approximate squareroot operation truncation method has been selected. There is no pre-ready IP core in vivado that takes squeroot of 61 bit vector. 
As FPGA basys 3 has been considered and FFT operation has occured on 25 MHz. 
Signal has been multiplied by hanning window coefficients. 
At the end, codes are saved on dual port ram because they will become available to be applied by Mel filters to get accurate results on FFT operations. 
As a recommendation, after applying MEL filters also discrete cosine Transform should be applied if anyone tries to achieve speech recoginition system. 
Another recommendation if anyone uses this , they should divide their data to windows with 50% overlap and then they should take fft .
All logics and the codes are belongs to Arda Anıl Dönmez.
