unit ik13;

interface

uses mk52roms;

type
  Tir2 = class
    procedure tact_exec;
    function tact_exec2(in_in: byte): byte;

  public
    Registr_M: array[0..252] of byte;
    Rg_In, Rg_Out: byte;
    micro_tact: integer;
  end;

  Tik1302 = class
    function tact_exec(in_in: byte): byte;
    function get_mc(): cardinal;
    function read_ri(i: byte): byte;
    procedure write_ri(i, data: byte);
    function read_rs(i: byte): byte;
    function bool(i: byte): boolean;

    function read_m(i: byte): byte;
    function read_st(i: byte): byte;

  public
    mc_130x: array[0..67] of cardinal;
    cmd_130x: array[0..255] of cardinal;
    sp_130x: array[0..1151] of byte;



    Registr_M: array[0..41] of byte;
    Registr_R: array[0..41] of byte;
    Registr_ST: array[0..41] of byte;
    Registr_S: byte;
    Registr_S1: byte;
    L, T, perenos: byte;
    H: byte;
    micro_tact, microcommand: integer;

    sk: byte;
    md: byte;
    keyboard_x, keyboard_y, segment_i8: byte;
    Rg_In, Rg_Out: byte;
    asp, adr_mc: byte;

    ind: boolean;
    ind_multipoint: array[0..13] of boolean;
  end;

  Tmk52 = class
    constructor create;
    procedure exec;
    procedure pre_exec(Rg_In: byte);

  public
    ik1302, ik1303, ik1306: Tik1302;
    ir2_1, ir2_2: Tir2;

    grd: integer;
    mode: integer;
  end;

var


  J: array[0..41] of byte = (0, 1, 2, 3, 4, 5, 3, 4, 5, 3, 4, 5, 3, 4, 5, 3,
    4, 5, 3, 4, 5, 3, 4, 5, 6, 7, 8, 0, 1, 2, 3, 4, 5, 6, 7, 8, 0, 1, 2, 3, 4, 5);

  // 2 Вариант  J[tact_i div 12] + (tact_i div 4) mod 3
  // J: array[0..13] of byte = (0, 3, 3, 3, 3, 3, 3, 3, 6, 0, 3, 6, 0, 3);



implementation


procedure Tir2.tact_exec;
var
  n: integer;
begin
  Rg_Out := Registr_M[0];
  for n := 0 to 251 do Registr_M[n] := Registr_M[n + 1];
  Registr_M[252] := Rg_In;
end;

function Tir2.tact_exec2(in_in: byte): byte;  // Ускоренный вариант
begin
  Rg_In := in_in;
  if micro_tact > 251 then micro_tact := 0;
  Rg_Out := Registr_M[micro_tact];
  Registr_M[(micro_tact + 252) mod 252] := Rg_In; // +1007 ?
  micro_tact := micro_tact + 1;
  result := Rg_Out;
end;

function Tik1302.read_rs(i: byte): byte;

begin
  result := 0;
  if i = 0 then
  begin
    result := Registr_S;
 //   if Registr_S[0] then result := result + 1;
 //   if Registr_S[1] then result := result + 2;
 //   if Registr_S[2] then result := result + 4;
 //   if Registr_S[3] then result := result + 8;
  end else
  begin
    result := Registr_S1;
//    if Registr_S1[0] then result := result + 1;
//    if Registr_S1[1] then result := result + 2;
//    if Registr_S1[2] then result := result + 4;
//    if Registr_S1[3] then result := result + 8;
  end;
end;



function Tik1302.read_m(i: byte): byte;

begin
  result := Registr_M[i];
 // if Registr_M[i * 4] then result := result + 1;
 // if Registr_M[(i * 4) + 1] then result := result + 2;
 // if Registr_M[(i * 4) + 2] then result := result + 4;
 // if Registr_M[(i * 4) + 3] then result := result + 8;
end;



function Tik1302.read_ri(i: byte): byte;

begin
  result := Registr_R[i];
 // if Registr_R[i * 4] then result := result + 1;
 // if Registr_R[(i * 4) + 1] then result := result + 2;
 // if Registr_R[(i * 4) + 2] then result := result + 4;
 // if Registr_R[(i * 4) + 3] then result := result + 8;
end;



function Tik1302.read_st(i: byte): byte;

begin
  result := Registr_st[i];
 // if Registr_st[i * 4] then result := result + 1;
 // if Registr_st[(i * 4) + 1] then result := result + 2;
 // if Registr_st[(i * 4) + 2] then result := result + 4;
 // if Registr_st[(i * 4) + 3] then result := result + 8;
end;


procedure Tik1302.write_ri(i, data: byte);

begin
  Registr_R[i] := data;
 // Registr_R[i * 4] := (data and 1) > 0;
 // Registr_R[(i * 4) + 1] := (data and 2) > 0;
 // Registr_R[(i * 4) + 2] := (data and 4) > 0;
 // Registr_R[(i * 4) + 3] := (data and 8) > 0;
end;


function Tik1302.get_mc(): cardinal;
var
  k: byte;
  // asp, adr_mc: byte;
begin
  // J стр. 108
  // 012345678901234567890123456789012345678901  i
  // 012345345345345345345345678012345678012345  J
  k := micro_tact div 36;
  if k < 3 then asp := $FF and (cmd_130x[sk]);
  if k = 3 then asp := $FF and (cmd_130x[sk] shr 8);
  if k = 4 then
    asp := $FF and (cmd_130x[sk] shr 16);
  md := $FF and (cmd_130x[sk] shr 24);

  if (k = 4) and (asp > $1F) then // стр. 115
  begin
    if micro_tact = 144 then
    // if (micro_tact div 4) = 36 then
    begin
      // write_ri(1, asp and $F); // Стр 145
      // write_ri(4, asp shr 4);

      write_ri(37, asp and $F);
      write_ri(40, asp shr 4);

      // Registr_R[0] := boolean((asp and $F) and (1 shl (micro_tact mod 4)));
      // Registr_R[16] := boolean((asp shr 4) and (1 shl (micro_tact mod 4)));
    end;
    asp := $5F; // ???   стр 145
  end;

  adr_mc := sp_130x[(asp * 9) + J[micro_tact div 4]]; // адрес микроприказа

  adr_mc := adr_mc and $3F;
  if (adr_mc > 59)
    then begin
    adr_mc := (adr_mc - 60) * 2;
    if not (L > 0) then adr_mc := adr_mc + 1;
    adr_mc := adr_mc + 60;
  end;

  result := mc_130x[adr_mc];
end;


function Tik1302.bool(i: byte): boolean;
begin
  if i > 0 then result := true else result := false;
end;

function Tik1302.tact_exec(in_in : byte): byte; // Ускоренный вариант
var
  four_1248, tact_0123, n: integer;
  x, y, z: byte;
  alfa, beta, gamma, sigma: byte;
  summa: byte;
  Signal_D, Signal_E, Signal_I: byte;
begin

  Rg_In :=  in_in;

  tact_0123 := micro_tact mod 4; // 0,1,2,3
  four_1248 := 1 shl (micro_tact mod 4); // 1,2,4,8

  Signal_I := micro_tact div 4; // 0..41
  Signal_D := micro_tact div 12; // 0..13
  Signal_E := (micro_tact div 4) mod 3; // 0,1,2

  if micro_tact = 0 then
  begin
    sk := read_ri(36) + 16 * read_ri(39);

    if ((cmd_130x[sk] and $FC0000) = 0) then // АСП1<4
      T := 0;
  end;
  ///////////////////////////////////////////////////////////

  if four_1248 = 1 then microcommand := get_mc();

  alfa := 0;
  beta := 0;
  gamma := 0;

  case ((microcommand shr 24) and 3) of
    2, 3:
//    if ((micro_tact div 4) + 3) = (keyboard_x * 3) then // только E = 0 ? Ахинея ?
      if ((micro_tact div 12)) <> (keyboard_x - 1) then
        if (keyboard_y > 0) then
        begin
          // keyboard_y = K2 * 8 + K1
          if four_1248 = 1 then
            Registr_S1 := Registr_S1 or keyboard_y;
          // T := true;
        end;
  end;


  if (microcommand and 1) > 0 then alfa := alfa or Registr_R[Signal_I];
  if (microcommand and 2) > 0 then alfa := alfa or Registr_M[Signal_I]; //micro_tact
  if (microcommand and 4) > 0 then alfa := alfa or Registr_ST[Signal_I];
  if (microcommand and 8) > 0 then alfa := alfa or ((not Registr_R[Signal_I]) and $F);
  if (microcommand and 16) > 0 then

  //  alfa := alfa or ((($0A and four_1248) > 0) and (not L)); // 1,2,4,8 alfa := $0A * (not L); //  *
    if L = 0 then alfa := alfa or $0A;




  if (microcommand and 32) > 0 then alfa := alfa or Registr_S;
  if (microcommand and 64) > 0 then alfa := alfa or $04;

  if ((microcommand shr 7) and 16) > 0 then beta := beta or $01;
  if ((microcommand shr 7) and 8) > 0 then beta := beta or $06;
  if ((microcommand shr 7) and 4) > 0 then beta := beta or Registr_S1;
  if ((microcommand shr 7) and 2) > 0 then beta := beta or ((not Registr_S) and $F);
  if ((microcommand shr 7) and 1) > 0 then beta := beta or Registr_S;



    {
  if tact_0123 = 0 then
    if (Signal_D >= 0) and (Signal_D < 12) then
      if L then segment_i8 := Signal_D;
    }


  if ((cmd_130x[sk] and $FC0000) > 0) then
  begin
    // АСП1>=4
    if (keyboard_y = 0) then T := 0;
  end else
  begin
    ind := true;
  // АСП1<4
  //  if ((micro_tact div 4) + 3) = (keyboard_x * 3) then // только E = 0 ?  Ахинея ?
    if ((micro_tact div 12) + 0) = (keyboard_x - 1) then // только E = 0 ?

      if (keyboard_y > 0) then
      begin
        // keyboard_y = K2 * 8 + K1
        Registr_S1 := keyboard_y;
        T := 1;
      end;

    if tact_0123 = 0 then
      if (Signal_D >= 0) and (Signal_D < 12) then
        if L > 0 then segment_i8 := Signal_D;

    ind_multipoint[Signal_D] := L > 0;

  // Диод VD4
  //if ((micro_tact div 12) + 1) = 13 then
  (* if (micro_tact div 4) = 36 then
    begin
      Registr_S1[tact_0123] := ((8 and four_1248) > 0);
      T := true;
    end;
    *)
  end;


  if ((microcommand shr 12) and 4) > 0 then gamma := (not T) and 1;
  if ((microcommand shr 12) and 2) > 0 then gamma := gamma or ((not L) and 1);
  if ((microcommand shr 12) and 1) > 0 then gamma := gamma or (L and 1);

  //if four_1248 <> 1 then gamma := perenos; // gamma or

  // summa := (byte(alfa) and 1) + (byte(beta) and 1) + (byte(gamma) and 1);
  summa := alfa + beta + gamma;
 // if alfa then summa := summa + 1;
 // if beta then summa := summa + 1;
 // if gamma then summa := summa + 1;


  sigma := summa and $F;
  perenos := summa shr 4;

  if ((md = 0) or ((micro_tact div 4) >= 36)) then
  begin
    case ((microcommand shr 15) and 7) of
      1: Registr_R[Signal_I] := Registr_R[(Signal_I + 3) mod 42]; // i+3   // ???? 12 16
      2: Registr_R[Signal_I] := sigma;
      3: Registr_R[Signal_I] := Registr_S;
      4: Registr_R[Signal_I] := Registr_R[Signal_I] or Registr_S or sigma;
      5: Registr_R[Signal_I] := Registr_S or sigma;
      6: Registr_R[Signal_I] := Registr_R[Signal_I] or Registr_S;
      7: Registr_R[Signal_I] := Registr_R[Signal_I] or sigma;
    end;
    if ((microcommand shr 18) and 1) > 0 then Registr_R[(Signal_I + 41) mod 42] := sigma; // i-1
    if ((microcommand shr 19) and 1) > 0 then Registr_R[(Signal_I + 40) mod 42] := sigma; // i-2
  end;

  if ((microcommand shr 21) and 1) > 0 then
  begin
   // if tact_0123 = 3 then
    L := 1 and perenos;
  end;

  if ((microcommand shr 20) and 1) > 0 then Registr_M[Signal_I] := Registr_S; //micro_tact

  case ((microcommand shr 22) and 3) of
    1: Registr_S := Registr_S1;
    2: Registr_S := sigma;
    3: Registr_S := Registr_S1 or sigma; //    Registr_S1 ?
  end;
  case ((microcommand shr 24) and 3) of
    1: Registr_S1 := sigma;
    2: Registr_S1 := Registr_S1; // or ((H and four_1248) > 0);
    3: Registr_S1 := Registr_S1 or sigma; // or ((H and four_1248) > 0) or sigma;
  end;


  //    i-3              i-2                   i-1
  // 156 157 158 159   160 161 162 163   164 165 166 167
  //    i                i+1                i+2                i+3
  // 0 1 2 3           4 5 6 7           8 9 10 11         12 13 14 15

  case ((microcommand shr 26) and 3) of
    // if ((microcommand shr 26) and 3) = 1 then
    1: begin
        Registr_ST[(Signal_I + 2) mod 42] := Registr_ST[(Signal_I + 1) mod 42]; // i+2 i+1
        Registr_ST[(Signal_I + 1) mod 42] := Registr_ST[Signal_I]; // i+1 i+0
        Registr_ST[Signal_I] := sigma; // i+0
      end;

    // if ((microcommand shr 26) and 3) = 2 then
    2: begin
        x := Registr_ST[Signal_I];
        Registr_ST[Signal_I] := Registr_ST[(Signal_I + 1) mod 42]; // i+0 i+1
        Registr_ST[(Signal_I + 1) mod 42] := Registr_ST[(Signal_I + 2) mod 42]; // i+1 i+2
        Registr_ST[(Signal_I + 2) mod 42] := x; // i+2
      end;

    // if ((microcommand shr 26) and 3) = 3 then
    3: begin
        x := Registr_ST[Signal_I]; // i+0
        y := Registr_ST[(Signal_I + 1) mod 42]; // i+1
        z := Registr_ST[(Signal_I + 2) mod 42]; // i+2
        Registr_ST[(Signal_I + 0) mod 42] := sigma or y; // i+0
        Registr_ST[(Signal_I + 1) mod 42] := x or z; // i+1
        Registr_ST[(Signal_I + 2) mod 42] := y or x; // i+2
      end;
  end;

  //(micro_tact + 8) mod 168


 { рабочий вариант
  Rg_Out := Registr_M[0];
  for n := 0 to 166 do Registr_M[n] := Registr_M[n + 1];
  Registr_M[167] := Rg_In;
  }



  Rg_Out := $F and Registr_M[Signal_I];
  //Registr_M[(micro_tact + 167) mod 168] := Rg_In; // +167 ?
  Registr_M[Signal_I] := Rg_In; // +167 ?


  ///////////////////////////////////////////////////////////


  ///////////////////////////////////////////////////////////

  micro_tact := micro_tact + 4;
  if micro_tact > 167 then micro_tact := 0;


  result :=  Rg_Out;
end;


constructor Tmk52.create;
var
  i: integer;
begin
  inherited Create;
  ik1302 := Tik1302.Create;
  ik1303 := Tik1302.Create;
  ik1306 := Tik1302.Create;
  ir2_1 := Tir2.Create;
  ir2_2 := Tir2.Create;

  ik1302.micro_tact := 0;
  ik1303.micro_tact := 0;
  grd := 1;
  mode := 1;

  for i := 0 to 67 do
  begin
    ik1302.mc_130x[i] := mk52roms.mc_1302[i];
    ik1303.mc_130x[i] := mk52roms.mc_1303[i];
    ik1306.mc_130x[i] := mk52roms.mc_1306[i];
  end;

  for i := 0 to 255 do
  begin
    ik1302.cmd_130x[i] := mk52roms.cmd_1302[i];
    ik1303.cmd_130x[i] := mk52roms.cmd_1303[i];
    ik1306.cmd_130x[i] := mk52roms.cmd_1306[i];
  end;

  for i := 0 to 1151 do
  begin
    ik1302.sp_130x[i] := mk52roms.sp_1302[i];
    ik1303.sp_130x[i] := mk52roms.sp_1303[i];
    ik1306.sp_130x[i] := mk52roms.sp_1306[i];
  end;



end;

procedure Tmk52.pre_exec(Rg_In: byte);
begin
  ik1302.Registr_M[((ik1302.micro_tact div 4) + 41) mod 42] := Rg_In;
end;


procedure Tmk52.exec;
var
  i: integer;
  tmp : byte;
begin
//  for i := 0 to 3 do
  begin
    tmp := ir2_2.Rg_Out;
    tmp := ik1302.tact_exec(tmp);

    // Р ГРД Г
    //ik1303.keyboard_y := 1;
    //ik1303.keyboard_x := 0;

    //if (grd = 3) or (grd = 2) then if (ik1303.micro_tact div 12) = 9 then ik1303.keyboard_x := 10; // true
    //if grd = 2 then if (ik1303.micro_tact div 12) = 10 then ik1303.keyboard_x := 11; // true
    //if (ik1303.micro_tact div 12) = 11 then ik1303.keyboard_x := 12; // false


    //ik1303.Rg_In := ik1302.Rg_Out;
    tmp := ik1303.tact_exec(tmp);

    //ik1306.Rg_In := ik1303.Rg_Out;
 if (mode = 1) then  tmp := ik1306.tact_exec(tmp);

    //ir2_1.Rg_In := tmp;
    tmp :=ir2_1.tact_exec2(tmp);

    //ir2_2.Rg_In := ir2_1.Rg_Out;
    tmp :=ir2_2.tact_exec2(tmp);

    //  ik1302.Registr_M [167] := ir2_2.Rg_Out;

   // ik1302.Registr_M[(ik1302.micro_tact + 167) mod 168] := ir2_2.Rg_Out;

    pre_exec(tmp);

  end;
end;

// http://vak.ru/doku.php/proj/calculator/b3-34
end.
