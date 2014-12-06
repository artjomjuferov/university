#include "../headers/Guard.h"

Guard::Guard(){
	std::cout << "You see Guard!"<<std::endl;
	bad = 12;
	good = 3;
}

void Guard::badAction(Hero *h){
	std::cout << "You are my enemy!"<<std::endl;
	h->decreaseHp(bad);
	std::cout << "hp: -"<<bad<<std::endl<<std::endl;
}

void Guard::goodAction(Hero *h){
	std::cout << "You are my friend!"<<std::endl;
	h->increaseHp(good);
	std::cout << "hp: +"<<good<<std::endl<<std::endl;
}

