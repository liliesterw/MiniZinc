enum MOVES;
int: timeBound;

array[MOVES] of int: power;
array[MOVES] of int: duration;
% array[MOVES] of var 0..1: occur;
array[MOVES] of var bool: occur;

% constraint forall(i in MOVES)(occur[i] >= 0);
% constraint forall(i in MOVES)(occur[i] <= 1); 

% constraint sum(i in MOVES) (duration[i] * occur[i])<= timeBound;
constraint sum(i in MOVES) (duration[i] * occur[i])<= timeBound;

var int: total= sum(i in MOVES)(power[i] * occur[i]);
solve maximize total ;
output["\(total)"];