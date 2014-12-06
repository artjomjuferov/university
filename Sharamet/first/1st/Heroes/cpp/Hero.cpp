#include "../headers/Hero.h"

void Hero::decreaseHp(int a){
	hp -= a;
}

void Hero::increaseHp(int a){
	hp += a;
}

int Hero::getLuck(){
	return luck;
}

bool Hero::isAlive(){
	return hp>0;
}

void Hero::makeStep(){
	hp -= 10-int(speed/10); 
}