enum MOVES;
int: timeBound;

array[MOVES] of int: power;
array[MOVES] of int: duration;
var set of MOVES: occur;


constraint sum(i in occur) (duration[i] ) <= timeBound;
var int: total = sum(i in occur) (power[i] );
solve maximize total;

output[show(total)];
