int: start;
array[int] of int: readings;
int: l_readings = length(readings);
enum CHOICE = {heat, strongly_heat, cool, strongly_cool, do_nothing};

array[TIME_CHOICE] of var CHOICE: choice;
array[CHOICE] of int: effect = [+1,+4,-2,-5,0];
array[CHOICE] of int: cost = [1,5,3,9,0];

set of int: TIME = 0..length(readings);
set of int: TIME_CHOICE = 1..length(readings);
array[TIME] of var int: temp;


constraint forall(i in 1..l_readings)(temp[i] <= 30);
constraint forall(i in 1..l_readings)(temp[i] >= 25);

constraint temp[0] = start;
constraint forall(i in 1..l_readings)(temp[i] = (temp[i-1] + readings[i]) div 2 +  effect[choice[i]] );
var int: costs = sum(i in 1..l_readings)(cost[choice[i]]);
solve minimize costs;

output["temp = \(temp[1..l_readings])\nchoice = \(choice)\ncost = \(costs)"];





