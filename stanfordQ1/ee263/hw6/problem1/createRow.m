function [ row ] = createRow( k, K )
%Creates the appropraite entries for the given row of A
alpha = 0.1;
for j = 1:k-2
    sum = 0;
   for i = 0:k-3-(j-1)
       sum = sum + (1-alpha)^i;
   end
   a(j) = sum;
end
row = padarray(a, [0,K-length(a)], 'post');
    
end

