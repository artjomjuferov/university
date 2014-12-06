#include <iostream>

class Hero{
	public:
		void decreaseHp(int);
		void increaseHp(int);   
		int getLuck();
		bool isAlive();
		void makeStep();
		virtual void yelName()=0;
	protected:
		int hp, speed, luck;
};