close; clear all;
mass_spec_data;

% Creates the matrix A describing how the concentration of each species
% effects a particular mass in the total mass spectrum
M = length(total_spectrum);
N = length(ion_masses);
A = zeros(M,N);
for i = 1:M
   for j = 1:N
       indx = find(ion_masses{j} == masses(i));
       if(~isempty(indx))
           imass = ion_masses{j};
           ispec = ion_spectra{j};
           A(i,j) = imass(indx)*ispec(indx);
       end
   end
end

% Gets the indexes of the columns of A that are all 0
for i = 1:275
    if(sum(A(:,i)) == 0)
        Iempty(i) = i;
    end
end
Iempty(:,find(sum(Iempty,1) == 0)) = [];

% Removes the columns of A that are 0
A(:, find(sum(abs(A)) == 0)) = [];
C = (A'*A)\A'*total_spectrum;
[sorted, I] = sort(C, 'descend');

% Removes the species that don't contribute to the total mass spectrum
ion_masses(Iempty) = [];
ion_names(Iempty) = [];
ion_spectra(Iempty) = [];

disp(['The top 10 species with the greatest concentration are']);
for i = 1:10
    disp(['Species #' num2str(I(i)) ' with name: ' ion_names{I(i)} ' and concentration ' num2str(sorted(i))]);
end