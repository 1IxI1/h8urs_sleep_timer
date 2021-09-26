#include "mainwindow.h"
#include "./ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}


void MainWindow::on_pushButton_2_clicked()
{
    ui->label_2->setText("Status: Pressed");
    ui->label_2->setStyleSheet("QLabel { color : green; }");
    ui->label_2->setStyleSheet("QFont {font : Ubuntu; size : 16;}");
}
