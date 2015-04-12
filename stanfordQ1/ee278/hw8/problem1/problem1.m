clear; close all;

%% Part A)
alpha = [0.1 0.3 0.6 0.9];
for i=1:length(alpha)
    f = linspace(-0.5, 0.5);
    Sx = -1./(0.5 * log((1-2*alpha(i))*exp(-2*pi*1i*f)));
    subplot(4,1,i);
    plot(f*pi,abs(Sx));
    title(['Plot of power spectral density with alpha = ' num2str(alpha(i)) ]);
end

% We can see that these plots align with our plots of the covariance
% functions from last week. When alpha is less than 0.5 we have a normal
% decaying exponential in the covariance function. When alpha is greater
% than 0.5, there is a higher tendancy to switch states than remain in the
% same one and we can see that the higher frequencies of the power spectral
% density are now occupied. As alpha increases higher and higher
% frequencies occur in the power spectral density, because of the higher
% frequency of state switches in the markov chain.




