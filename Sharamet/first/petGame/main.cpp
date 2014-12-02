#include <QCoreApplication>
#include "main.h"

using namespace std;

int main(int argc, char *argv[])
{
    QCoreApplication a(argc, argv);

    cout << "Pet's GAME!!!"<<endl<<endl;
        cout << "Rules: you have to choose one of the hero."<<endl;
        cout << "And get from point A to B to get some food."<<endl;
        cout << "Every step you become more hungry."<<endl;
        cout << "On your path you can see some barriers or not."<<endl;
        cout << "And you have choice meet them or not."<<endl;
        cout << "GOOD LUCK!!."<<endl<<endl;


        cout << "Choose one of heroes(1-Dog, 2-Cat, 3-Rat): ";

        int tmp;
        cin >> tmp;

        Hero *mainHero;
        if (tmp == 1){
            mainHero = new Dog;
        } else if(tmp == 2){
            mainHero = new Cat;
        } else{
            mainHero = new Rat;
        }

        mainHero->yelName();
        int t = 0;

        while(mainHero->isAlive()){
            if (t>10){
                cout << "-----------------------------\n";
                cout << "-----------------------------\n";
                cout << "------YOU WIN!!!!!!!!!-------\n";
                cout << "-----------------------------\n";
                cout << "-----------------------------\n";
                return 0;
            }
            t++;

            cout << "For next step enter char\n";
            char temp;
            cin >> temp;
            cout << endl;

            mainHero->yelName();

            tmp = rand() %4;
            Barrier *bar;
            if (tmp == 1){
                bar = new Human;
            } else if(tmp == 2){
                bar = new Guard;
            } else if(tmp == 2){
                bar = new MichalJakson;
            }else{
                mainHero->makeStep();
                continue;
            }

            cout << "do you want to meet? (y/n): ";
            char choice;
            cin >> choice;
            cout << endl;

            if (choice == 'y'){
                bar->doAction(mainHero);
            } else{
                cout << "you have hidden!" << endl;
                mainHero->makeStep();
            }

            mainHero->makeStep();
        }

        cout << "-----------------------------\n";
        cout << "-----------------------------\n";
        cout << "------YOU DEAD((((((((------\n";
        cout << "-----------------------------\n";
        cout << "-----------------------------\n";


    return a.exec();
}
