#include "../headers/Barrier.h"

void Barrier::doAction(Hero *h){
	if ((rand()%200) > 100){
		badAction(h);
	}else{
		goodAction(h);
	}
}
