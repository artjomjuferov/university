#include "../headers/Cat.h"

Cat::Cat(){
	hp = 100;
	speed = 70;
	luck = 200;
}

void Cat::yelName(){
	std::cout << "I'm Cat! My stats is:\n ";
	std::cout << "hp - "<<hp<<std::endl;
	std::cout << "speed - "<<speed<<std::endl;
	std::cout << "luck - "<<luck<<std::endl;
}