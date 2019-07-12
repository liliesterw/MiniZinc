% 1.2
% int: n;
% % output[show(n)];
% output["\(n)"];

% 1.3
% var 0..10: x;
% constraint x mod 4 = 0 ;
% solve minimize (x-7)^2;
% output[show(x)];

% 1.5
% int: n;
% array[1..n] of var 0..9: x;
% constraint sum(x) = product(x);
% constraint forall(i in 1..n-1)(x[i] <= x[i+1]);
% solve satisfy;

% 1.6
int: n;

array[1..n] of var 0..3: x;

constraint x[1] = 0;
constraint x[n] = 3;
constraint forall(i in 1..n-1) (x[i] + x[i+1]<=3);
constraint forall(i in 1..n-1 where i mod 3 = 0) (x[i] >=2);
output["\(sum(x))=\(x)"];

solve satisfy; 
 





