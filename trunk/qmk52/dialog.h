#ifndef DIALOG_H
#define DIALOG_H

#include <QDialog>

namespace Ui
{
  class Dialog;
}

class Dialog:public QDialog
{
Q_OBJECT public:
    explicit Dialog (QWidget * parent = 0);
   ~Dialog ();

private:
    Ui::Dialog * ui;

    QList < QPushButton * >btns;




  public slots:private slots:void OnTimer ();
  void onkeypad_clicked ();

  void on_radioButton_clicked ();
  void on_radioButton_2_clicked ();
  void on_radioButton_3_clicked ();
};

#endif // DIALOG_H
