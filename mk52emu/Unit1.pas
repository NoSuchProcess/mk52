unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ik13, ExtCtrls, Grids;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Edit1: TEdit;
    Memo1: TMemo;
    Timer1: TTimer;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Button19: TButton;
    Button20: TButton;
    Button21: TButton;
    Button22: TButton;
    Button23: TButton;
    Button24: TButton;
    Button25: TButton;
    Button26: TButton;
    Button27: TButton;
    Button28: TButton;
    Button29: TButton;
    Button30: TButton;
    Button31: TButton;
    Image1: TImage;
    Button32: TButton;
    StringGrid1: TStringGrid;
    Button33: TButton;
    Button34: TButton;
    Button35: TButton;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    RadioButton3: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Button31Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure show_ind();
    procedure Button32Click(Sender: TObject);
    procedure Button33Click(Sender: TObject);
    procedure Button34Click(Sender: TObject);
    procedure Button35Click(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
    procedure RadioButton3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    ind, ind_old: array[0..12] of byte;

    mk52: Tmk52;
  end;

var
  Form1: TForm1;


implementation

{$R *.dfm}

procedure TForm1.FormCreate(Sender: TObject);
begin
  mk52 := Tmk52.Create;
  mk52.ik1302.write_ri(36, 0); // start 00
  mk52.ik1302.write_ri(39, 0);

  mk52.ik1303.write_ri(36, 0); // start 00
  mk52.ik1303.write_ri(39, 0);
//  mk52.init;



//mk52.ik1302.Registr_M[0] := true;
//mk52.ik1302.Registr_M[1] := true;
//mk52.ik1302.Registr_M[2] := true;
//mk52.ik1302.Registr_M[3] := true;


  (*
  Indicator1 := TIndicator.Create(nil);
  Indicator1.Parent := form1;
  Indicator1.Left := 400;
  Indicator1.Top := 150;
  Indicator1.Width := 250;
  Indicator1.Height := 50;
  Indicator1.show_ind();
   *)
  Timer1.Enabled := true;
  ind_old[1] := 1;
  show_ind;
end;

procedure TForm1.show_ind();

var
  bmp: tbitmap;
  str: string;
  x, y, dig, i, step: integer;
  update: boolean;
begin
  update := false;
  for i := 0 to 12 do
  begin
    if ind_old[i] <> ind[i] then update := true;
    ind_old[i] := ind[i];
  end;
  if update then
  begin
 /////////////////////////
    bmp := tbitmap.Create;
    bmp.Width := 220;
    bmp.Height := 50;

 // bmp.Transparent := true;
    bmp.TransparentColor := clwhite;

 // bmp.Canvas.Brush.Color := clgreen;
    bmp.Canvas.Pen.Style := psSolid;
    bmp.Canvas.Pen.Width := 3;
    bmp.Canvas.Pen.Color := $E0FF00;
    bmp.Canvas.Pen.Color := clBlack;

    for i := 0 to 11 do
    begin
      x := 5 + (i * 16); y := 5;
      case ind[i] of
        10: dig := 64;
        0: dig := 63;
        1: dig := 6;
        2: dig := 91;
        3: dig := 79;
        4: dig := 102;
        5: dig := 109;
        6: dig := 125;
        7: dig := 7;
        8: dig := 127;
        9: dig := 111;
    //if ind[i + 1] = 'A' then dig := 64;
        11: dig := 56;
        12: dig := 57;
        13: dig := 49;
        14: dig := 121;
       // 15: dig := 113;

        15: dig := 0;

    //if ind[i + 1] = ' ' then dig := 0;
      end;
      if (dig and 1) > 0 then begin bmp.Canvas.MoveTo(x + 0, y + 0); bmp.Canvas.LineTo(x + 10, y + 0); end; //a
      if (dig and 2) > 0 then begin bmp.Canvas.MoveTo(x + 10, y + 0); bmp.Canvas.LineTo(x + 10, y + 10); end; //b
      if (dig and 4) > 0 then begin bmp.Canvas.MoveTo(x + 10, y + 10); bmp.Canvas.LineTo(x + 10, y + 20); end; //c
      if (dig and 8) > 0 then begin bmp.Canvas.MoveTo(x + 10, y + 20); bmp.Canvas.LineTo(x + 0, y + 20); end; //d
      if (dig and 16) > 0 then begin bmp.Canvas.MoveTo(x + 0, y + 20); bmp.Canvas.LineTo(x + 0, y + 10); end; //e
      if (dig and 32) > 0 then begin bmp.Canvas.MoveTo(x + 0, y + 10); bmp.Canvas.LineTo(x + 0, y + 00); end; //f
      if (dig and 64) > 0 then begin bmp.Canvas.MoveTo(x + 0, y + 10); bmp.Canvas.LineTo(x + 10, y + 10); end; //g
      if ((ind[12] + 1) = i) and (i <> 9) then begin bmp.Canvas.MoveTo(x + 12, y + 22); bmp.Canvas.LineTo(x + 12, y + 23); end; //g
    end;
    Image1.Transparent := true;
    Image1.Picture.Bitmap.Assign(bmp);
    bmp.Free;
  end;
end;



procedure TForm1.Timer1Timer(Sender: TObject);
var
  i: integer;
begin

  for i := 1 to 16800 do mk52.exec; // 2352 реальная скорость (23520 тик/сек)

 // for i := 0 to 11 do
 // begin
 //   ind[i] := mk52.ik1302.read_ri(i * 3);
 //   ind[12] := mk52.ik1302.segment_i8;
 // end;

  for i := 0 to 8 do
  begin
    ind[i] := mk52.ik1302.read_ri((8 - i) * 3);
  end;

  for i := 0 to 2 do
  begin
    ind[i + 9] := mk52.ik1302.read_ri((11 - i) * 3);
  end;

  ind[12] := 8 - mk52.ik1302.segment_i8;


  show_ind;

  mk52.ik1302.keyboard_y := 0;
  mk52.ik1302.keyboard_x := 0;
end;

procedure TForm1.Button31Click(Sender: TObject);
var
  i: integer;
  alfa: boolean;
  ind_str: string;
begin
//  for i := 0 to 0 do
  begin
    // if (ik1302.micro_tact div 12) = 11 then ik1302.h := 8 else ik1302.h := 0;
    // mk52.ik1302.h := 8+1;
    ///mk52.ik1302.keyboard_y := 9;
    // mk52.ik1302.keyboard_x := 5; // 2,3,4,5,6,7,8,9,10,11
    mk52.exec;
  end;

  // tact_exec   10 000 000 - 30 сек
  // tact_exec2 100 000 000 - 20 сек
  memo1.Lines.Add('asp := ' + inttohex(mk52.ik1302.asp, 2));
  memo1.Lines.Add('adr mc := ' + inttohex(mk52.ik1302.adr_mc, 2));

  memo1.Lines.Add('S := ' + inttostr(mk52.ik1302.read_rs(0)));
  memo1.Lines.Add('S1 := ' + inttostr(mk52.ik1302.read_rs(1)));
  memo1.Lines.Add('L := ' + inttostr(byte(mk52.ik1302.l)));
  memo1.Lines.Add('SK := ' + inttohex(mk52.ik1302.sk, 2));
  ///
  memo1.Lines.Add('micro_tact := ' + inttostr(byte(mk52.ik1302.micro_tact)));

  StringGrid1.Cells[1, 1] := '1';

  for i := 0 to 13 do
  begin
    StringGrid1.Cells[i + 1, 1] := inttohex(mk52.ik1302.read_m(i * 3), 1);
    StringGrid1.Cells[i + 1, 2] := inttohex(mk52.ik1302.read_m((i * 3) + 1), 1);
    StringGrid1.Cells[i + 1, 3] := inttohex(mk52.ik1302.read_m((i * 3) + 2), 1);

    StringGrid1.Cells[i + 1, 4] := inttohex(mk52.ik1302.read_ri(i * 3), 1);
    StringGrid1.Cells[i + 1, 5] := inttohex(mk52.ik1302.read_ri((i * 3) + 1), 1);
    StringGrid1.Cells[i + 1, 6] := inttohex(mk52.ik1302.read_ri((i * 3) + 2), 1);

    StringGrid1.Cells[i + 1, 7] := inttohex(mk52.ik1302.read_st(i * 3), 1);
    StringGrid1.Cells[i + 1, 8] := inttohex(mk52.ik1302.read_st((i * 3) + 1), 1);
    StringGrid1.Cells[i + 1, 9] := inttohex(mk52.ik1302.read_st((i * 3) + 2), 1);
  end;

  // indikator

  ind_str := '';
  for i := 0 to 11 do
  begin
    ind_str := ind_str + inttohex(mk52.ik1302.read_ri(i * 3), 1);
    ind[i] := mk52.ik1302.read_ri(i * 3);
    ind[12] := mk52.ik1302.segment_i8;
  end;
  edit1.Text := ind_str;
  show_ind;

  //alfa := boolean($FFFF);
  i := 7;
  alfa := not boolean(i and $F);
  alfa := not ((i and $F) > 0);

  //edit1.Text := inttostr(byte(true));
  //dit1.Text := inttostr(not 1);


end;

procedure TForm1.Button1Click(Sender: TObject);
var
  key, key_x, key_y: integer;
begin
//
  key := strtoint(copy(TButton(Sender).Name, 7, 2)) - 1;
  key_y := (key div 10) + 1;
  if key_y = 2 then key_y := 8;
  if key_y = 3 then key_y := 9;
  key_x := (key mod 10) + 2;

  mk52.ik1302.keyboard_y := key_y;
  mk52.ik1302.keyboard_x := key_x;

  edit1.Text := inttostr(key_y) + ' ' + inttostr(key_x);

end;

procedure TForm1.Button32Click(Sender: TObject);
begin
  mk52.ik1302.keyboard_y := 0;
  mk52.ik1302.keyboard_x := 0;
end;

procedure TForm1.Button33Click(Sender: TObject);
var
  i: integer;
begin
  Timer1.Enabled := false;
  for i := 0 to 41 do Button31Click(sender);

end;

procedure TForm1.Button34Click(Sender: TObject);
var
  ir2_1: Tir2;
  i: integer;

begin
  ir2_1 := Tir2.Create;

  for i := 0 to 1010 do
  begin
    ir2_1.Rg_In := true;
    ir2_1.tact_exec2;
    memo1.Lines.Add('ir2_1 := ' + inttostr(i) + ' - ' + inttostr(integer(ir2_1.Rg_Out)));

  end;
end;

procedure TForm1.Button35Click(Sender: TObject);
begin
  Timer1.Enabled := true;
end;

procedure TForm1.RadioButton1Click(Sender: TObject);
begin
  mk52.grd := 1;
  memo1.Lines.Add('1');
end;

procedure TForm1.RadioButton2Click(Sender: TObject);
begin
  mk52.grd := 2;
  memo1.Lines.Add('2');
end;

procedure TForm1.RadioButton3Click(Sender: TObject);
begin
  mk52.grd := 3;
  memo1.Lines.Add('3');
end;

end.

