function plotFFT(f,x)
    n = length(x);
    plot(f, abs(x(1:(0.5*n+1))));
    xlabel('f [Hz]');
    ylabel('|X(f)|');
end