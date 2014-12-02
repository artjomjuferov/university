#include "MichalJakson.h"

MichalJakson::MichalJakson(){
	std::cout << "You see Michal Jakson!"<<std::endl;
	bad = 5;
	good = 10;
}

void MichalJakson::badAction(Hero *h){
	std::cout << "Listen to my music!"<<std::endl;
	h->decreaseHp(bad);
	std::cout << "hp: -"<<bad<<std::endl<<std::endl;
}

void MichalJakson::goodAction(Hero *h){
	std::cout << "Check out my moonwalk!"<<std::endl;
	h->increaseHp(good);
	std::cout << "hp: +"<<good<<std::endl<<std::endl;
}
