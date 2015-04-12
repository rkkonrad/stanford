clear; close all;
one_of_these_data;

[U,S,V] = svd(X);
for i = 1:length(X)
    Xtemp = X;
    Xtemp(:,i) = [];
    [Ut, St, Vt] = svd(Xtemp);
    svals(:,i) = diag(St);
end

figure; 
subplot(6,1,1); plot(svals(1,:)); title('1st Singular Value');
subplot(6,1,2); plot(svals(2,:)); title('2nd Singular Value');
subplot(6,1,3); plot(svals(3,:)); title('3rd Singular Value');
subplot(6,1,4); plot(svals(4,:)); title('4th Singular Value');
subplot(6,1,5); plot(svals(5,:)); title('5th Singular Value');
subplot(6,1,6); plot(svals(6,:)); title('6th Singular Value');

[minval,indx] = min(svals(6,:));

disp(['The vector that does not fit in is the column: ' num2str(indx) '.']);
disp(['When the vector is removed the 6th singular value drops down to: ' num2str(minval) '.']);
disp('The singular values when the 147th column is removed is as follows.');
svals(:,147)

%We can see that when the 147th column is removed the last singular value
%drops to around 0.0345 as opposed to being around 7.246 with that vector
%as part of the data set. This means that that one vector is holding up an
%extra "dimension" of the data set. With it removed we see that the
%effective rank of the matrix drops to 5 as opposed to the full ranked
%value of 6. 