% Beauty Trap
% Create the most magnificient feast 
include "globals.mzn";
enum DISH;
enum TASTE = {spicy, sour, salty, sweet, umame, bland};
enum TEMP = {hot, cold, warm};
%int: ndish;
%set of int: DISH = 1..ndish;
%set of int: TASTE = 1..6;
%int: spicy = 1; int: sour = 2; int: salty = 3; int: sweet = 4; int: umame = 5; int: bland = 6;
%set of int: TEMP = 1..3;
%int: hot = 1; int: cold = 2; int: warm = 3;


array[DISH] of TASTE: taste;
array[DISH] of TEMP: temp;
array[DISH] of bool: heavy;
array[DISH] of int: value;

int: len; % length of banquet
set of int: COURSE = 1..len;

array[COURSE] of var DISH: dish;

constraint forall(i in 1..len-1)(dish[i] < dish[i+1] );
% constraint forall(i in dish)(taste[i] != taste[i+1] );
var int: obj = sum(i in dish)(value[i]);
solve maximize obj;
output["\(taste)\n\(dish)"];


