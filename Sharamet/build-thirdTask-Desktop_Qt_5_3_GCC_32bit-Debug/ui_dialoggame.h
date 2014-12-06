/********************************************************************************
** Form generated from reading UI file 'dialoggame.ui'
**
** Created by: Qt User Interface Compiler version 5.3.1
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_DIALOGGAME_H
#define UI_DIALOGGAME_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QDialog>
#include <QtWidgets/QGraphicsView>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QTextBrowser>

QT_BEGIN_NAMESPACE

class Ui_DialogGame
{
public:
    QLabel *label;
    QGraphicsView *graphicsView;
    QPushButton *pushButton_2;
    QPushButton *pushButton;
    QTextBrowser *textBrowser_3;
    QLabel *label_2;
    QLabel *label_3;
    QTextBrowser *textBrowser_2;
    QTextBrowser *textBrowser;
    QPushButton *pushButton_5;
    QPushButton *pushButton_6;

    void setupUi(QDialog *DialogGame)
    {
        if (DialogGame->objectName().isEmpty())
            DialogGame->setObjectName(QStringLiteral("DialogGame"));
        DialogGame->resize(810, 464);
        label = new QLabel(DialogGame);
        label->setObjectName(QStringLiteral("label"));
        label->setGeometry(QRect(10, 140, 45, 17));
        graphicsView = new QGraphicsView(DialogGame);
        graphicsView->setObjectName(QStringLiteral("graphicsView"));
        graphicsView->setGeometry(QRect(360, 20, 411, 321));
        QSizePolicy sizePolicy(QSizePolicy::Minimum, QSizePolicy::Preferred);
        sizePolicy.setHorizontalStretch(123);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(graphicsView->sizePolicy().hasHeightForWidth());
        graphicsView->setSizePolicy(sizePolicy);
        pushButton_2 = new QPushButton(DialogGame);
        pushButton_2->setObjectName(QStringLiteral("pushButton_2"));
        pushButton_2->setEnabled(true);
        pushButton_2->setGeometry(QRect(710, 420, 85, 27));
        pushButton = new QPushButton(DialogGame);
        pushButton->setObjectName(QStringLiteral("pushButton"));
        pushButton->setGeometry(QRect(490, 360, 85, 27));
        textBrowser_3 = new QTextBrowser(DialogGame);
        textBrowser_3->setObjectName(QStringLiteral("textBrowser_3"));
        textBrowser_3->setGeometry(QRect(20, 40, 101, 71));
        QSizePolicy sizePolicy1(QSizePolicy::Minimum, QSizePolicy::Minimum);
        sizePolicy1.setHorizontalStretch(12);
        sizePolicy1.setVerticalStretch(0);
        sizePolicy1.setHeightForWidth(textBrowser_3->sizePolicy().hasHeightForWidth());
        textBrowser_3->setSizePolicy(sizePolicy1);
        label_2 = new QLabel(DialogGame);
        label_2->setObjectName(QStringLiteral("label_2"));
        label_2->setGeometry(QRect(140, 10, 20, 17));
        label_3 = new QLabel(DialogGame);
        label_3->setObjectName(QStringLiteral("label_3"));
        label_3->setGeometry(QRect(20, 10, 98, 17));
        textBrowser_2 = new QTextBrowser(DialogGame);
        textBrowser_2->setObjectName(QStringLiteral("textBrowser_2"));
        textBrowser_2->setGeometry(QRect(140, 40, 71, 71));
        QSizePolicy sizePolicy2(QSizePolicy::Minimum, QSizePolicy::Minimum);
        sizePolicy2.setHorizontalStretch(12);
        sizePolicy2.setVerticalStretch(40);
        sizePolicy2.setHeightForWidth(textBrowser_2->sizePolicy().hasHeightForWidth());
        textBrowser_2->setSizePolicy(sizePolicy2);
        textBrowser = new QTextBrowser(DialogGame);
        textBrowser->setObjectName(QStringLiteral("textBrowser"));
        textBrowser->setGeometry(QRect(10, 163, 256, 192));
        QSizePolicy sizePolicy3(QSizePolicy::Minimum, QSizePolicy::Minimum);
        sizePolicy3.setHorizontalStretch(0);
        sizePolicy3.setVerticalStretch(0);
        sizePolicy3.setHeightForWidth(textBrowser->sizePolicy().hasHeightForWidth());
        textBrowser->setSizePolicy(sizePolicy3);
        pushButton_5 = new QPushButton(DialogGame);
        pushButton_5->setObjectName(QStringLiteral("pushButton_5"));
        pushButton_5->setGeometry(QRect(370, 360, 95, 27));
        pushButton_6 = new QPushButton(DialogGame);
        pushButton_6->setObjectName(QStringLiteral("pushButton_6"));
        pushButton_6->setGeometry(QRect(600, 360, 95, 27));

        retranslateUi(DialogGame);

        QMetaObject::connectSlotsByName(DialogGame);
    } // setupUi

    void retranslateUi(QDialog *DialogGame)
    {
        DialogGame->setWindowTitle(QApplication::translate("DialogGame", "GamePet", 0));
        label->setText(QApplication::translate("DialogGame", "Action", 0));
        pushButton_2->setText(QApplication::translate("DialogGame", "Exit", 0));
        pushButton->setText(QApplication::translate("DialogGame", "Next step", 0));
        label_2->setText(QApplication::translate("DialogGame", "Hp", 0));
        label_3->setText(QApplication::translate("DialogGame", "Steps to wood", 0));
        pushButton_5->setText(QApplication::translate("DialogGame", "Hide", 0));
        pushButton_6->setText(QApplication::translate("DialogGame", "Meet", 0));
    } // retranslateUi

};

namespace Ui {
    class DialogGame: public Ui_DialogGame {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_DIALOGGAME_H
