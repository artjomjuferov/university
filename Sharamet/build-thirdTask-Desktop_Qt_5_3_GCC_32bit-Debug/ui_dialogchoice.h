/********************************************************************************
** Form generated from reading UI file 'dialogchoice.ui'
**
** Created by: Qt User Interface Compiler version 5.3.1
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_DIALOGCHOICE_H
#define UI_DIALOGCHOICE_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QComboBox>
#include <QtWidgets/QDialog>
#include <QtWidgets/QGraphicsView>
#include <QtWidgets/QGridLayout>
#include <QtWidgets/QHBoxLayout>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QTextBrowser>
#include <QtWidgets/QVBoxLayout>

QT_BEGIN_NAMESPACE

class Ui_DialogChoice
{
public:
    QGridLayout *gridLayout;
    QHBoxLayout *horizontalLayout;
    QVBoxLayout *verticalLayout_4;
    QVBoxLayout *verticalLayout;
    QLabel *label;
    QComboBox *comboBox;
    QVBoxLayout *verticalLayout_2;
    QLabel *label_2;
    QTextBrowser *textBrowser;
    QVBoxLayout *verticalLayout_3;
    QGraphicsView *graphicsView;
    QPushButton *pushButton;

    void setupUi(QDialog *DialogChoice)
    {
        if (DialogChoice->objectName().isEmpty())
            DialogChoice->setObjectName(QStringLiteral("DialogChoice"));
        DialogChoice->resize(635, 406);
        gridLayout = new QGridLayout(DialogChoice);
        gridLayout->setObjectName(QStringLiteral("gridLayout"));
        horizontalLayout = new QHBoxLayout();
        horizontalLayout->setObjectName(QStringLiteral("horizontalLayout"));
        verticalLayout_4 = new QVBoxLayout();
        verticalLayout_4->setObjectName(QStringLiteral("verticalLayout_4"));
        verticalLayout = new QVBoxLayout();
        verticalLayout->setObjectName(QStringLiteral("verticalLayout"));
        label = new QLabel(DialogChoice);
        label->setObjectName(QStringLiteral("label"));

        verticalLayout->addWidget(label);

        comboBox = new QComboBox(DialogChoice);
        comboBox->setObjectName(QStringLiteral("comboBox"));

        verticalLayout->addWidget(comboBox);


        verticalLayout_4->addLayout(verticalLayout);

        verticalLayout_2 = new QVBoxLayout();
        verticalLayout_2->setObjectName(QStringLiteral("verticalLayout_2"));
        label_2 = new QLabel(DialogChoice);
        label_2->setObjectName(QStringLiteral("label_2"));

        verticalLayout_2->addWidget(label_2);

        textBrowser = new QTextBrowser(DialogChoice);
        textBrowser->setObjectName(QStringLiteral("textBrowser"));

        verticalLayout_2->addWidget(textBrowser);


        verticalLayout_4->addLayout(verticalLayout_2);


        horizontalLayout->addLayout(verticalLayout_4);

        verticalLayout_3 = new QVBoxLayout();
        verticalLayout_3->setObjectName(QStringLiteral("verticalLayout_3"));
        graphicsView = new QGraphicsView(DialogChoice);
        graphicsView->setObjectName(QStringLiteral("graphicsView"));

        verticalLayout_3->addWidget(graphicsView);

        pushButton = new QPushButton(DialogChoice);
        pushButton->setObjectName(QStringLiteral("pushButton"));

        verticalLayout_3->addWidget(pushButton);


        horizontalLayout->addLayout(verticalLayout_3);


        gridLayout->addLayout(horizontalLayout, 0, 0, 1, 1);


        retranslateUi(DialogChoice);

        QMetaObject::connectSlotsByName(DialogChoice);
    } // setupUi

    void retranslateUi(QDialog *DialogChoice)
    {
        DialogChoice->setWindowTitle(QApplication::translate("DialogChoice", "PetGame", 0));
        label->setText(QApplication::translate("DialogChoice", "Choose Hero", 0));
        label_2->setText(QApplication::translate("DialogChoice", "Hero Attributes", 0));
        pushButton->setText(QApplication::translate("DialogChoice", "Choose", 0));
    } // retranslateUi

};

namespace Ui {
    class DialogChoice: public Ui_DialogChoice {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_DIALOGCHOICE_H
