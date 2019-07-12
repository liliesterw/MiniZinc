% assignment 2
% select a set of raiding warrior
enum WARRIOR;
WARRIOR: dummy; 
enum CLAN; % the clan they belong too

int: l; % minimum raid party size
int: u; % maximum raid party size
int: m; % limit of hatreds


array[WARRIOR] of int: strength;
array[WARRIOR] of CLAN: clan;
set of int: lengthWarrior = 1..length(WARRIOR);

array[CLAN,CLAN] of 0..1: hates;



array[1..u] of var WARRIOR: setWarrior;
% var set of WARRIOR: setWarrior;
% constraint not(dummy in setWarrior);
% constraint card(setWarrior) <=u ;
% constraint card(setWarrior) >=l ;
constraint forall(i in 1..l)(setWarrior[i] > dummy);
constraint forall(i in 1..u-1)(setWarrior[i] >= setWarrior[i+1] + (setWarrior[i+1] != dummy));

var int: totalStrength = sum(i in setWarrior)(strength[i]);
constraint sum(i,j in setWarrior where i<j)(hates[clan[i],clan[j]]) <= m;

solve maximize totalStrength;

% output["raid = \(setWarrior);\nobj = \(totalStrength);\n"];
% array[1..n] of var OBJx: s;
output ["raid = {"] ++ [if fix(setWarrior[i]) != dummy then show(setWarrior[i])
                        ++ if i < u /\ fix(setWarrior[i+1]) != dummy then ", " else "" endif
                     else "" endif | i in 1..u ] ++ ["};\n"] ++
                     ["obj = \(totalStrength);\n"];