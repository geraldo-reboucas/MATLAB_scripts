function [one_sided_spectrum_dB, one_sided_spectrum, frequency_domain, signal_phase] = FFT(signal_in_time, sampling_frequency, maximum_freq, use_window, maximum_dB_level)
%FFT calculates the FFT of a signal. This function is based on:
% http://se.mathworks.com/help/matlab/ref/fft.html and on the code provided
% by Jon J. Thomsen, DTU.
% y: signal to be decomposed
% freq

    % obtain the length of the signal:
    number_of_samples = length(signal_in_time);
    % Define the frequency domain f:
    frequency_domain = sampling_frequency*(0:(number_of_samples/2))/number_of_samples;
    % Cut it at the desired maximum frequency:
    idx = find(frequency_domain <= maximum_freq, 1, 'last');
    frequency_domain = frequency_domain(1:idx);
    
    % Calculate window:
    if(use_window == true)
        signal_window = hann(number_of_samples);
    else
        signal_window = ones(size(signal_in_time));
    end
    
    % reshape arrays so one can multiply them:
    signal_window  = reshape(signal_window, [number_of_samples, 1]);
    signal_in_time = reshape(signal_in_time, [number_of_samples, 1]);
    
    % compute the Fourier transform of the signal:
    transformed_signal = fft(signal_in_time.*signal_window);
    signal_phase = unwrap(angle(transformed_signal))*180/pi;
    
    % Compute the two-sided spectrum P2
    two_sided_spectrum = abs(transformed_signal/number_of_samples);
    % Round the signal's half-length, so it is an integer:
    tmp = ceil(number_of_samples/2+1); 
    % Then compute the single-sided spectrum P1 based on P2
    one_sided_spectrum = two_sided_spectrum(1:tmp);
    
    one_sided_spectrum(2:end-1) = 2*one_sided_spectrum(2:end-1);

    % Cut P1 at the desired maximum frequency:
    one_sided_spectrum = one_sided_spectrum(1:idx);
    signal_phase = signal_phase(1:idx);
    
    dBnorm = maximum_dB_level - mag2db(max(one_sided_spectrum)); % Constant needed for calculating dB
    one_sided_spectrum_dB   = mag2db(one_sided_spectrum) + dBnorm; % For displaying the FFT: calculate |xFFT| in dB. 
    
end
