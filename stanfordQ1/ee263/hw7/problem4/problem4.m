clear; close all;
walks_data;

A5 = A^5;

max = 0;
maxi = 1;
for i = 1:length(A5)
    if(i==1)
        max = A5(i,i);
    end
    if(max < A5(i,i))
       max = A5(i,i);
       maxi = i;
    end
end

disp(['The ihat that maximizes N5(i) is ' num2str(maxi) '.']);
disp(['The value of N5(ihat) is ' num2str(max) ]);

[W,D] = eig(A);
real(W);
V = inv(W);

max=0;
maxi=1;
for i=1:length(A5)
    cur = W(i,1)*D(1,1)*V(1,i);
    if(i==1)
        max = cur;
    end
    if( max < cur)
       max = cur;
       maxi = i;
    end
end

disp(['The ihat that maximizes G(i) is ' num2str(maxi) '.']);


