#include "../headers/Dog.h"

Dog::Dog(){
	hp = 200;
	speed = 50;
	luck = 100;
}

void Dog::yelName(){
	std::cout << "-----------------------------------\n";
	std::cout << "I'm Dog! My stats is:\n ";
	std::cout << "hp - "<<hp<<std::endl;
	std::cout << "speed - "<<speed<<std::endl;
	std::cout << "luck - "<<luck<<std::endl<<std::endl<<std::endl;
}