unit ik13;

interface

uses mk52roms;

type
  Tir2 = class
    procedure tact_exec;
    procedure tact_exec2;

  public
    Registr_M: array[0..1024] of boolean;
    Rg_In, Rg_Out: boolean;
    micro_tact: integer;
  end;

  Tik1302 = class
    procedure tact_exec;
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



    Registr_M: array[0..168] of boolean;
    Registr_R: array[0..167] of boolean;
    Registr_ST: array[0..167] of boolean;
    Registr_S: array[0..3] of boolean;
    Registr_S1: array[0..3] of boolean;
    L, T, perenos: boolean;
    H: byte;
    micro_tact, microcommand: integer;

    sk: byte;
    md: byte;
    keyboard_x, keyboard_y, segment_i8: byte;
    Rg_In, Rg_Out: boolean;
    asp, adr_mc: byte;

    ind: boolean;
  end;

  Tmk52 = class
    constructor create;
    procedure exec;

  public
    ik1302, ik1303, ik1306: Tik1302;
    ir2_1, ir2_2: Tir2;

    grd: integer;
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
  for n := 0 to 1006 do Registr_M[n] := Registr_M[n + 1];
  Registr_M[1007] := Rg_In;
end;

procedure Tir2.tact_exec2; // Ускоренный вариант
begin
  if micro_tact > 1007 then micro_tact := 0;
  Rg_Out := Registr_M[micro_tact];
  Registr_M[(micro_tact + 1008) mod 1008] := Rg_In; // +1007 ?
  micro_tact := micro_tact + 1;
end;

function Tik1302.read_rs(i: byte): byte;

begin
  result := 0;
  if i = 0 then
  begin
    if Registr_S[0] then result := result + 1;
    if Registr_S[1] then result := result + 2;
    if Registr_S[2] then result := result + 4;
    if Registr_S[3] then result := result + 8;
  end else
  begin
    if Registr_S1[0] then result := result + 1;
    if Registr_S1[1] then result := result + 2;
    if Registr_S1[2] then result := result + 4;
    if Registr_S1[3] then result := result + 8;
  end;
end;



function Tik1302.read_m(i: byte): byte;

begin
  result := 0;
  if Registr_M[i * 4] then result := result + 1;
  if Registr_M[(i * 4) + 1] then result := result + 2;
  if Registr_M[(i * 4) + 2] then result := result + 4;
  if Registr_M[(i * 4) + 3] then result := result + 8;
end;



function Tik1302.read_ri(i: byte): byte;

begin
  result := 0;
  if Registr_R[i * 4] then result := result + 1;
  if Registr_R[(i * 4) + 1] then result := result + 2;
  if Registr_R[(i * 4) + 2] then result := result + 4;
  if Registr_R[(i * 4) + 3] then result := result + 8;
end;



function Tik1302.read_st(i: byte): byte;

begin
  result := 0;
  if Registr_st[i * 4] then result := result + 1;
  if Registr_st[(i * 4) + 1] then result := result + 2;
  if Registr_st[(i * 4) + 2] then result := result + 4;
  if Registr_st[(i * 4) + 3] then result := result + 8;
end;


procedure Tik1302.write_ri(i, data: byte);

begin
  Registr_R[i * 4] := (data and 1) > 0;
  Registr_R[(i * 4) + 1] := (data and 2) > 0;
  Registr_R[(i * 4) + 2] := (data and 4) > 0;
  Registr_R[(i * 4) + 3] := (data and 8) > 0;
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
    if not L then adr_mc := adr_mc + 1;
    adr_mc := adr_mc + 60;
  end;

  result := mc_130x[adr_mc];
end;


function Tik1302.bool(i: byte): boolean;
begin
  if i > 0 then result := true else result := false;
end;

procedure Tik1302.tact_exec; // Ускоренный вариант
var
  four_1248, tact_0123, n: integer;
  x, y, z: boolean;
  alfa, beta, gamma, sigma: boolean;
  summa: byte;
  Signal_D, Signal_E, Signal_I: byte;
begin

  tact_0123 := micro_tact mod 4; // 0,1,2,3
  four_1248 := 1 shl (micro_tact mod 4); // 1,2,4,8

  Signal_I := micro_tact div 4; // 0..41
  Signal_D := micro_tact div 12; // 0..13
  Signal_E := (micro_tact div 4) mod 3; // 0,1,2

  if micro_tact = 0 then
  begin
    sk := read_ri(36) + 16 * read_ri(39);

    if ((cmd_130x[sk] and $FC0000) = 0) then // АСП1<4
      T := false;
  end;
  ///////////////////////////////////////////////////////////

  if four_1248 = 1 then microcommand := get_mc();

  alfa := false;
  beta := false;
  gamma := false;

  case ((microcommand shr 24) and 3) of
    2, 3:
//    if ((micro_tact div 4) + 3) = (keyboard_x * 3) then // только E = 0 ? Ахинея ?
      if ((micro_tact div 12)) <> (keyboard_x - 1) then
        if (keyboard_y > 0) then
        begin
          // keyboard_y = K2 * 8 + K1
          if four_1248 = 1 then
            Registr_S1[tact_0123] := Registr_S1[tact_0123] or ((keyboard_y and four_1248) > 0);
          // T := true;
        end;
  end;


  if (microcommand and 1) > 0 then alfa := alfa or Registr_R[micro_tact];
  if (microcommand and 2) > 0 then alfa := alfa or Registr_M[micro_tact]; //micro_tact
  if (microcommand and 4) > 0 then alfa := alfa or Registr_ST[micro_tact];
  if (microcommand and 8) > 0 then alfa := alfa or not Registr_R[micro_tact];
  if (microcommand and 16) > 0 then

    alfa := alfa or ((($0A and four_1248) > 0) and (not L)); // 1,2,4,8 alfa := $0A * (not L); //  *
  if (microcommand and 32) > 0 then alfa := alfa or Registr_S[tact_0123];
  if (microcommand and 64) > 0 then alfa := alfa or (($04 and four_1248) > 0);

  if ((microcommand shr 7) and 16) > 0 then beta := beta or (($01 and four_1248) > 0);
  if ((microcommand shr 7) and 8) > 0 then beta := beta or (($06 and four_1248) > 0);
  if ((microcommand shr 7) and 4) > 0 then beta := beta or Registr_S1[tact_0123];
  if ((microcommand shr 7) and 2) > 0 then beta := beta or not Registr_S[tact_0123];
  if ((microcommand shr 7) and 1) > 0 then beta := beta or Registr_S[tact_0123];



    {
  if tact_0123 = 0 then
    if (Signal_D >= 0) and (Signal_D < 12) then
      if L then segment_i8 := Signal_D;
    }


  if ((cmd_130x[sk] and $FC0000) > 0) then
  begin
    // АСП1>=4
    if (keyboard_y = 0) then T := false;
  end else
  begin
    ind := true;
  // АСП1<4
  //  if ((micro_tact div 4) + 3) = (keyboard_x * 3) then // только E = 0 ?  Ахинея ?
    if ((micro_tact div 12) + 0) = (keyboard_x - 1) then // только E = 0 ?

      if (keyboard_y > 0) then
      begin
        // keyboard_y = K2 * 8 + K1
        Registr_S1[tact_0123] := ((keyboard_y and four_1248) > 0);
        T := true;
      end;

    if tact_0123 = 0 then
      if (Signal_D >= 0) and (Signal_D < 12) then
        if L then segment_i8 := Signal_D;
  // Диод VD4
  //if ((micro_tact div 12) + 1) = 13 then
  (* if (micro_tact div 4) = 36 then
    begin
      Registr_S1[tact_0123] := ((8 and four_1248) > 0);
      T := true;
    end;
    *)
  end;


  if ((microcommand shr 12) and 4) > 0 then gamma := not T;
  if ((microcommand shr 12) and 2) > 0 then gamma := gamma or not L;
  if ((microcommand shr 12) and 1) > 0 then gamma := gamma or L;

  if four_1248 <> 1 then gamma := perenos; // gamma or

  // summa := (byte(alfa) and 1) + (byte(beta) and 1) + (byte(gamma) and 1);
  summa := 0;
  if alfa then summa := summa + 1;
  if beta then summa := summa + 1;
  if gamma then summa := summa + 1;


  sigma := ((summa and 1) > 0);
  perenos := ((summa and 2) > 0);

  if ((md = 0) or ((micro_tact div 4) >= 36)) then
  begin
    case ((microcommand shr 15) and 7) of
      1: Registr_R[micro_tact] := Registr_R[(micro_tact + 12) mod 168]; // i+3   // ???? 12 16
      2: Registr_R[micro_tact] := sigma;
      3: Registr_R[micro_tact] := Registr_S[tact_0123];
      4: Registr_R[micro_tact] := Registr_R[micro_tact] or Registr_S[tact_0123] or sigma;
      5: Registr_R[micro_tact] := Registr_S[tact_0123] or sigma;
      6: Registr_R[micro_tact] := Registr_R[micro_tact] or Registr_S[tact_0123];
      7: Registr_R[micro_tact] := Registr_R[micro_tact] or sigma;
    end;
    if ((microcommand shr 18) and 1) > 0 then Registr_R[(micro_tact + 164) mod 168] := sigma; // i-1
    if ((microcommand shr 19) and 1) > 0 then Registr_R[(micro_tact + 160) mod 168] := sigma; // i-2
  end;

  if ((microcommand shr 21) and 1) > 0 then
  begin
    if tact_0123 = 3 then
      L := perenos;
  end;

  if ((microcommand shr 20) and 1) > 0 then Registr_M[micro_tact] := Registr_S[tact_0123]; //micro_tact

  case ((microcommand shr 22) and 3) of
    1: Registr_S[tact_0123] := Registr_S1[tact_0123];
    2: Registr_S[tact_0123] := sigma;
    3: Registr_S[tact_0123] := Registr_S1[tact_0123] or sigma; //    Registr_S1 ?
  end;
  case ((microcommand shr 24) and 3) of
    1: Registr_S1[tact_0123] := sigma;
    2: Registr_S1[tact_0123] := Registr_S1[tact_0123]; // or ((H and four_1248) > 0);
    3: Registr_S1[tact_0123] := Registr_S1[tact_0123] or sigma; // or ((H and four_1248) > 0) or sigma;
  end;


  //    i-3              i-2                   i-1
  // 156 157 158 159   160 161 162 163   164 165 166 167
  //    i                i+1                i+2                i+3
  // 0 1 2 3           4 5 6 7           8 9 10 11         12 13 14 15

  case ((microcommand shr 26) and 3) of
    // if ((microcommand shr 26) and 3) = 1 then
    1: begin
        Registr_ST[(micro_tact + 8) mod 168] := Registr_ST[(micro_tact + 4) mod 168]; // i+2 i+1
        Registr_ST[(micro_tact + 4) mod 168] := Registr_ST[micro_tact]; // i+1 i+0
        Registr_ST[micro_tact] := sigma; // i+0
      end;

    // if ((microcommand shr 26) and 3) = 2 then
    2: begin
        x := Registr_ST[micro_tact];
        Registr_ST[micro_tact] := Registr_ST[(micro_tact + 4) mod 168]; // i+0 i+1
        Registr_ST[(micro_tact + 4) mod 168] := Registr_ST[(micro_tact + 8) mod 168]; // i+1 i+2
        Registr_ST[(micro_tact + 8) mod 168] := x; // i+2
      end;

    // if ((microcommand shr 26) and 3) = 3 then
    3: begin
        x := Registr_ST[micro_tact]; // i+0
        y := Registr_ST[(micro_tact + 4) mod 168]; // i+1
        z := Registr_ST[(micro_tact + 8) mod 168]; // i+2
        Registr_ST[(micro_tact + 0) mod 168] := sigma or y; // i+0
        Registr_ST[(micro_tact + 4) mod 168] := x or z; // i+1
        Registr_ST[(micro_tact + 8) mod 168] := y or x; // i+2
      end;
  end;

  //(micro_tact + 8) mod 168


 { рабочий вариант
  Rg_Out := Registr_M[0];
  for n := 0 to 166 do Registr_M[n] := Registr_M[n + 1];
  Registr_M[167] := Rg_In;
  }



  Rg_Out := Registr_M[micro_tact];
  //Registr_M[(micro_tact + 167) mod 168] := Rg_In; // +167 ?
  Registr_M[micro_tact] := Rg_In; // +167 ?


  ///////////////////////////////////////////////////////////


  ///////////////////////////////////////////////////////////

  micro_tact := micro_tact + 1;
  if micro_tact > 167 then micro_tact := 0;
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

procedure Tmk52.exec;
var
  i: integer;

begin
  for i := 0 to 3 do
  begin
    ik1302.Rg_In := ir2_2.Rg_Out;
    ik1302.tact_exec;

    // Р ГРД Г
    //ik1303.keyboard_y := 1;
    //ik1303.keyboard_x := 0;

    //if (grd = 3) or (grd = 2) then if (ik1303.micro_tact div 12) = 9 then ik1303.keyboard_x := 10; // true
    //if grd = 2 then if (ik1303.micro_tact div 12) = 10 then ik1303.keyboard_x := 11; // true
    //if (ik1303.micro_tact div 12) = 11 then ik1303.keyboard_x := 12; // false


    ik1303.Rg_In := ik1302.Rg_Out;
    ik1303.tact_exec;

    ik1306.Rg_In := ik1303.Rg_Out;
    ik1306.tact_exec;

    ir2_1.Rg_In := ik1306.Rg_Out;
    ir2_1.tact_exec2;

    ir2_2.Rg_In := ir2_1.Rg_Out;
    ir2_2.tact_exec2;

    //  ik1302.Registr_M [167] := ir2_2.Rg_Out;

    ik1302.Registr_M[(ik1302.micro_tact + 167) mod 168] := ir2_2.Rg_Out;

  end;
end;

// http://vak.ru/doku.php/proj/calculator/b3-34
end.

