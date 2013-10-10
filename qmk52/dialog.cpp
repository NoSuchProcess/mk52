#include "dialog.h"
#include "ui_dialog.h"
#include <QTimer>

#include <QStandardItemModel>

#include "ik13.h"


Tmk52 mk52;

Dialog::Dialog (QWidget * parent):
QDialog (parent), ui (new Ui::Dialog)
{
  ui->setupUi (this);

  mk52.create ();

  mk52.ik1302.write_ri (36, 0);	// start 00
  mk52.ik1302.write_ri (39, 0);

  mk52.ik1303.write_ri (36, 0);	// start 00
  mk52.ik1303.write_ri (39, 0);


  mk52.ik1306.write_ri (36, 0);	// start 00
  mk52.ik1306.write_ri (39, 0);


  QTimer *timer = new QTimer (this);
  connect (timer, SIGNAL (timeout ()), this, SLOT (OnTimer ()));
  timer->start (100);

  //////////////////////////


  btns.clear ();
  btns.append (ui->b_1_2);
  btns.append (ui->b_1_3);
  btns.append (ui->b_1_4);
  btns.append (ui->b_1_5);
  btns.append (ui->b_1_6);
  btns.append (ui->b_1_7);
  btns.append (ui->b_1_8);
  btns.append (ui->b_1_9);
  btns.append (ui->b_1_10);
  btns.append (ui->b_1_11);


  btns.append (ui->b_2_2);
  btns.append (ui->b_2_3);
  btns.append (ui->b_2_4);
  btns.append (ui->b_2_5);
  btns.append (ui->b_2_6);
  btns.append (ui->b_2_7);
  btns.append (ui->b_2_8);
  btns.append (ui->b_2_9);
  btns.append (ui->b_2_10);
  btns.append (ui->b_2_11);


  btns.append (ui->b_3_2);
  btns.append (ui->b_3_3);
  btns.append (ui->b_3_4);
  btns.append (ui->b_3_5);
  btns.append (ui->b_3_6);
  btns.append (ui->b_3_7);
  btns.append (ui->b_3_8);
  btns.append (ui->b_3_9);
  btns.append (ui->b_3_10);
  btns.append (ui->b_3_11);

  int i;

  for (i = 0; i < btns.count (); i++)
    {
      connect (btns.at (i), SIGNAL (pressed ()), this,
	       SLOT (onkeypad_clicked ()));
      connect (btns.at (i), SIGNAL (released ()), this,
	       SLOT (onkeypad_clicked ()));
    }


}

Dialog::~Dialog ()
{
  delete ui;
}


void
Dialog::OnTimer ()
{
  int i2, i;
  char chr[] = "0123456789-LCrE ";
  char ind[24] = "";


  // Р ГРД Г
  mk52.ik1303.keyboard_y = 1;
  mk52.ik1303.keyboard_x = mk52.grd + 9;



  bool twinkle;
  twinkle = true;


  for (i2 = 1; i2 <= 56; i2++)

    {
      for (i = 0; i <= 41; i++)
	mk52.exec ();

      if (mk52.ik1302.ind > 0)

	{
	  strcpy (ind, "");

	  for (i = 0; i <= 8; i++)
	    {
	      strncat (ind, &chr[mk52.ik1302.read_ri ((8 - i) * 3)], 1);

	      if (mk52.ik1302.ind_multipoint[9 - i] > 0)
		strncat (ind, ".", 1);
	    }

	  for (i = 0; i <= 2; i++)
	    {
	      strncat (ind, &chr[mk52.ik1302.read_ri ((11 - i) * 3)], 1);
	      if (mk52.ik1302.ind_multipoint[12 - i] > 0)
		strncat (ind, ".", 1);

	    }
	  mk52.ik1302.ind = false;
	  twinkle = false;
	}
    }

  if (twinkle)
    {
      strcpy (ind, "");
    }
  else
    {
      mk52.ik1302.keyboard_y = 0;
      mk52.ik1302.keyboard_x = 0;
    }

  ui->lcdNumber->setSmallDecimalPoint (true);

  ui->lcdNumber->display (QString ().sprintf ("%s", ind));


//  strncat (ind, &chr[8 - mk52.ik1302.segment_i8], 1);


/*

  ui->lineEdit->setText (ind);


  QStandardItemModel *model = new QStandardItemModel (9, 14, this);	//2 Rows and 3 Columns

  QStandardItem *firstRow[200];

  //  model->setItem(0,0,firstRow);

  for (i = 0; i <= 13; i++)
    {

      firstRow[0 * 14 + i] =
	new QStandardItem (QString ().
			   sprintf ("%X", mk52.ik1302.read_m (i * 3), 1));
      model->setItem (0, i, firstRow[0 * 14 + i]);

      firstRow[1 * 14 + i] =
	new QStandardItem (QString ().
			   sprintf ("%X", mk52.ik1302.read_m ((i * 3) + 1),
				    1));
      model->setItem (1, i, firstRow[1 * 14 + i]);

      firstRow[2 * 14 + i] =
	new QStandardItem (QString ().
			   sprintf ("%X", mk52.ik1302.read_m ((i * 3) + 2),
				    1));
      model->setItem (2, i, firstRow[2 * 14 + i]);



      firstRow[3 * 14 + i] =
	new QStandardItem (QString ().
			   sprintf ("%X", mk52.ik1302.read_ri (i * 3), 1));
      model->setItem (3, i, firstRow[3 * 14 + i]);

      firstRow[4 * 14 + i] =
	new QStandardItem (QString ().
			   sprintf ("%X", mk52.ik1302.read_ri ((i * 3) + 1),
				    1));
      model->setItem (4, i, firstRow[4 * 14 + i]);

      firstRow[5 * 14 + i] =
	new QStandardItem (QString ().
			   sprintf ("%X", mk52.ik1302.read_ri ((i * 3) + 2),
				    1));
      model->setItem (5, i, firstRow[5 * 14 + i]);




      firstRow[6 * 14 + i] =
	new QStandardItem (QString ().
			   sprintf ("%X", mk52.ik1302.read_st (i * 3), 1));
      model->setItem (6, i, firstRow[6 * 14 + i]);

      firstRow[7 * 14 + i] =
	new QStandardItem (QString ().
			   sprintf ("%X", mk52.ik1302.read_st ((i * 3) + 1),
				    1));
      model->setItem (7, i, firstRow[7 * 14 + i]);

      firstRow[8 * 14 + i] =
	new QStandardItem (QString ().
			   sprintf ("%X", mk52.ik1302.read_st ((i * 3) + 2),
				    1));
      model->setItem (8, i, firstRow[8 * 14 + i]);
    }


  ui->tableView->setModel (model);




  ui->textEdit->clear ();
  ui->textEdit->append (QString ().sprintf ("asp :=  %.2X", mk52.ik1302.asp));

  ui->textEdit->append (QString ().
			sprintf ("adr mc :=  %.2X", mk52.ik1302.adr_mc));
  ui->textEdit->append (QString ().
			sprintf ("S :=  %.2i", mk52.ik1302.read_rs (0)));
  ui->textEdit->append (QString ().
			sprintf ("S1 :=  %.2i", mk52.ik1302.read_rs (1)));
  ui->textEdit->append (QString ().sprintf ("L :=  %.2i", mk52.ik1302.L));
  ui->textEdit->append (QString ().
			sprintf ("adr SK :=  %.2X", mk52.ik1302.sk));
  ui->textEdit->append (QString ().
			sprintf ("micro_tact :=  %.4i",
				 mk52.ik1302.micro_tact));


  unsigned int a;
  a = 0xE2;


  //  ui->textEdit->append(QString().sprintf("micro_tact :=  %.2X",a));


  */

}

void
Dialog::onkeypad_clicked ()
{
  int i, key_y, key_x;

  mk52.ik1302.keyboard_y = 0;
  mk52.ik1302.keyboard_x = 0;

  //cycle

  //if(btnpressed) //one button is still processing
  //  return;

  for (i = 0; i < btns.count (); i++)
    {
      if (btns.at (i)->isDown ())
	{
	  //ui->textEdit->append (QString ().sprintf ("key  :=  %.2i ", i));

	  key_y = ((i) / 10) + 1;
	  if (key_y == 2)
	    key_y = 8;
	  if (key_y == 3)
	    key_y = 9;
	  key_x = ((i) % 10) + 2;

	  mk52.ik1302.keyboard_y = key_y;
	  mk52.ik1302.keyboard_x = key_x;


	  //ui->textEdit->append (QString ().       sprintf ("key  :=  %.2i , %i", key_y, key_x));

	  //    btnpressed=(i/10)+1;
	  //    btnpressed<<=8;
	  //     btnpressed|=i%10;
	  //     ui->ik1302_d->setText(QString().sprintf("d=%x  ",btnpressed));
	  //    emit keypad(btnpressed);
	  //    return;
	}
    }
  // btnpressed=0;
  // emit keypad(0);
}

void
Dialog::on_radioButton_clicked ()
{
  mk52.grd = 1;
}

void
Dialog::on_radioButton_2_clicked ()
{
  mk52.grd = 3;
}

void
Dialog::on_radioButton_3_clicked ()
{
  mk52.grd = 2;
}
