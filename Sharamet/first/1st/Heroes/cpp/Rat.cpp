#include "../headers/Rat.h"


Rat::Rat(){
	hp = 200;
	speed = 20;
	luck = 200;
}

void Rat::yelName(){
	std::cout << "I'm Rat! My stats is:\n ";
	std::cout << "hp - "<<hp<<std::endl;
	std::cout << "speed - "<<speed<<std::endl;
	std::cout << "luck - "<<luck<<std::endl<<std::endl;
}