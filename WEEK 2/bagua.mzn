int: nSpots; % 10
set of int: SPOT = 1..nSpots; 
array[SPOT] of int: damage;
int: size;

enum SYMB;
array[SYMB] of set of SPOT: group; 

set of int: SPOTx = {0} union SPOT;
array[1..size] of var SPOTx: attacks;
% array[1..size] of var SPOT: attacks;

constraint forall(i in 1..size-1)
(attacks[i] < attacks[i+1]);
constraint forall(s in SYMB)(sum(i in 1..size)
(attacks[i] in group[s]) <= 1);


var int: totalDamages = sum(p in attacks)(damage[p]);

solve maximize (totalDamages); 

output["Total Damages :\(totalDamages)\nAttacks: \(attacks)"]; 