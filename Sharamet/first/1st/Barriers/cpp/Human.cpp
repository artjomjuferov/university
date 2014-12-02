#include "../headers/Human.h"

Human::Human(){
	std::cout << "You see Human!"<<std::endl;
	bad = 10;
	good = 5;
}

void Human::badAction(Hero *h){
	std::cout << "I will punish you!"<<std::endl;
	h->decreaseHp(bad);
	std::cout << "hp: -"<<bad<<std::endl<<std::endl;
}

void Human::goodAction(Hero *h){
	std::cout << "Do you want to eat!"<<std::endl;
	h->increaseHp(good);
	std::cout << "hp: +"<<good<<std::endl<<std::endl;
}

