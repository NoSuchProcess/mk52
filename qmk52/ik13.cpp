#include "mk52roms.h"
#include "ik13.h"


char J[42] = { 0, 1, 2, 3, 4, 5, 3, 4, 5, 3, 4, 5, 3, 4, 5, 3,
  4, 5, 3, 4, 5, 3, 4, 5, 6, 7, 8, 0, 1, 2, 3, 4, 5, 6, 7, 8, 0, 1, 2, 3, 4, 5
};

  // 2 Вариант  J[tact_i div 12] + (tact_i div 4) mod 3
  // J: array[0..13] of byte = (0, 3, 3, 3, 3, 3, 3, 3, 6, 0, 3, 6, 0, 3);

void
Tir2::tact_exec ()
{
  int n;

  Rg_Out = Registr_M[0];
  for (n = 0; n <= 251; n++)
    Registr_M[n] = Registr_M[n + 1];
  Registr_M[252] = Rg_In;
}

char
Tir2::tact_exec2 (unsigned char in_in)	// Ускоренный вариант
{
  Rg_In = in_in;
  if (micro_tact > 251)
    micro_tact = 0;
  Rg_Out = Registr_M[micro_tact];
  Registr_M[(micro_tact + 252) % 252] = Rg_In;	// +1007 ?
  micro_tact = micro_tact + 1;
  return Rg_Out;
}

unsigned char
Tik1302::read_rs (unsigned char i)
{
  // result =  0;
  if (i == 0)
    {
      return Registr_S;
      //   if Registr_S[0] then result := result + 1;
      //   if Registr_S[1] then result := result + 2;
      //   if Registr_S[2] then result := result + 4;
      //   if Registr_S[3] then result := result + 8;
    }
  else
    {
      return Registr_S1;
//    if Registr_S1[0] then result := result + 1;
//    if Registr_S1[1] then result := result + 2;
//    if Registr_S1[2] then result := result + 4;
//    if Registr_S1[3] then result := result + 8;
    }
}



unsigned char
Tik1302::read_m (unsigned char i)
{
  return Registr_M[i];
  // if Registr_M[i * 4] then result := result + 1;
  // if Registr_M[(i * 4) + 1] then result := result + 2;
  // if Registr_M[(i * 4) + 2] then result := result + 4;
  // if Registr_M[(i * 4) + 3] then result := result + 8;
}



unsigned char
Tik1302::read_ri (unsigned char i)
{
  return Registr_R[i];
  // if Registr_R[i * 4] then result := result + 1;
  // if Registr_R[(i * 4) + 1] then result := result + 2;
  // if Registr_R[(i * 4) + 2] then result := result + 4;
  // if Registr_R[(i * 4) + 3] then result := result + 8;
}



unsigned char
Tik1302::read_st (unsigned char i)
{
  return Registr_ST[i];
  // if Registr_st[i * 4] then result := result + 1;
  // if Registr_st[(i * 4) + 1] then result := result + 2;
  // if Registr_st[(i * 4) + 2] then result := result + 4;
  // if Registr_st[(i * 4) + 3] then result := result + 8;
}


void
Tik1302::write_ri (unsigned char i, unsigned char data)
{
  Registr_R[i] = data;
  // Registr_R[i * 4] := (data and 1) > 0;
  // Registr_R[(i * 4) + 1] := (data and 2) > 0;
  // Registr_R[(i * 4) + 2] := (data and 4) > 0;
  // Registr_R[(i * 4) + 3] := (data and 8) > 0;
}



unsigned int
Tik1302::get_mc ()
{
  char k;
  // asp, adr_mc: byte;

  // J стр. 108
  // 012345678901234567890123456789012345678901  i
  // 012345345345345345345345678012345678012345  J
  k = micro_tact / 36;
  if (k < 3)
    asp = 0xFF & (cmd_130x[sk]);
  if (k == 3)
    asp = 0xFF & (cmd_130x[sk] >> 8);
  if (k == 4)
    asp = 0xFF & (cmd_130x[sk] >> 16);
  md = 0xFF & (cmd_130x[sk] >> 24);

  if ((k == 4) && (asp > 0x1F))	// стр. 115
    {
      if (micro_tact == 144)
	// if (micro_tact div 4) = 36 then
	{
	  // write_ri(1, asp and $F); // Стр 145
	  // write_ri(4, asp shr 4);

	  write_ri (37, asp & 0xF);
	  write_ri (40, asp >> 4);

	  // Registr_R[0] := boolean((asp and $F) and (1 shl (micro_tact mod 4)));
	  // Registr_R[16] := boolean((asp shr 4) and (1 shl (micro_tact mod 4)));
	}
      asp = 0x5F;		// ???   стр 145
    }



  adr_mc = sp_130x[(asp * 9) + J[micro_tact / 4]];	// адрес микроприказа

  adr_mc = adr_mc & 0x3F;
  if (adr_mc > 59)
    {
      adr_mc = (adr_mc - 60) * 2;
      if (!(L > 0))
	adr_mc = adr_mc + 1;
      adr_mc = adr_mc + 60;
    }

  return mc_130x[adr_mc];
}


bool Tik1302::bool_ (char i)
{
  if (i > 0)
    return true;
  else
    return false;
}

unsigned char
Tik1302::tact_exec (unsigned char in_in)	// Ускоренный вариант
{
  int four_1248, tact_0123;
  unsigned char x, y, z;
  unsigned char alfa, beta, gamma, sigma;
  unsigned char summa;
  unsigned char Signal_D, Signal_E, Signal_I;


  Rg_In = in_in;

  tact_0123 = micro_tact % 4;	// 0,1,2,3
  four_1248 = 1 << (micro_tact % 4);	// 1,2,4,8

  Signal_I = micro_tact / 4;	// 0..41
  Signal_D = micro_tact / 12;	// 0..13
  Signal_E = (micro_tact / 4) % 3;	// 0,1,2

  if (micro_tact == 0)
    {

      sk = 0xff & (read_ri (36) + (read_ri (39) << 4));



      if (((cmd_130x[sk] & 0xFC0000) == 0))	// АСП1<4
	T = 0;
    }
  ///////////////////////////////////////////////////////////

  if (four_1248 == 1)
    microcommand = get_mc ();

  alfa = 0;
  beta = 0;
  gamma = 0;

  switch ((microcommand >> 24) & 3)
    {
    case 2:
    case 3:
//    if ((micro_tact div 4) + 3) = (keyboard_x * 3) then // только E = 0 ? Ахинея ?
      if (((micro_tact / 12)) != (keyboard_x - 1))
	if ((keyboard_y > 0))
	  {
	    // keyboard_y = K2 * 8 + K1
	    if (four_1248 == 1)
	      Registr_S1 = Registr_S1 | keyboard_y;
	    // T := true;
	  }
    }


  if ((microcommand & 1) > 0)
    alfa = alfa | Registr_R[Signal_I];
  if ((microcommand & 2) > 0)
    alfa = alfa | Registr_M[Signal_I];	//micro_tact
  if ((microcommand & 4) > 0)
    alfa = alfa | Registr_ST[Signal_I];
  if ((microcommand & 8) > 0)
    alfa = alfa | ((~Registr_R[Signal_I]) & 0xF);
  if ((microcommand & 16) > 0)

    //  alfa := alfa or ((($0A and four_1248) > 0) and (not L)); // 1,2,4,8 alfa := $0A * (not L); //  *
    if (L == 0)
      alfa = alfa | 0x0A;




  if ((microcommand & 32) > 0)
    alfa = alfa | Registr_S;
  if ((microcommand & 64) > 0)
    alfa = alfa | 0x04;

  if (((microcommand >> 7) & 16) > 0)
    beta = beta | 0x01;
  if (((microcommand >> 7) & 8) > 0)
    beta = beta | 0x06;
  if (((microcommand >> 7) & 4) > 0)
    beta = beta | Registr_S1;
  if (((microcommand >> 7) & 2) > 0)
    beta = beta | ((~Registr_S) & 0xF);
  if (((microcommand >> 7) & 1) > 0)
    beta = beta | Registr_S;



/***   {
  if tact_0123 = 0 then
    if (Signal_D >= 0) and (Signal_D < 12) then
      if L then segment_i8 := Signal_D;
    */


  if (((cmd_130x[sk] & 0xFC0000) > 0))
    {
      // АСП1>=4
      if ((keyboard_y == 0))
	T = 0;
    }
  else
    {
      ind = true;
      // АСП1<4
      //  if ((micro_tact div 4) + 3) = (keyboard_x * 3) then // только E = 0 ?  Ахинея ?
      if (((micro_tact / 12) + 0) == (keyboard_x - 1))	// только E = 0 ?

	if ((keyboard_y > 0))
	  {
	    // keyboard_y = K2 * 8 + K1
	    Registr_S1 = keyboard_y;
	    T = 1;
	  }

      if (tact_0123 == 0)
	if ((Signal_D >= 0) && (Signal_D < 12))
	  if (L > 0)
	    segment_i8 = Signal_D;

      ind_multipoint[Signal_D] = L > 0;

      // Диод VD4
      //if ((micro_tact div 12) + 1) = 13 then
      /* if((micro_tact  /  4) == 36   )
         { 
         Registr_S1[tact_0123] =  ((8 &  four_1248) > 0);
         T =  true;
         } 
       */
    }


  if (((microcommand >> 12) & 4) > 0)
    gamma = (~T) & 1;
  if (((microcommand >> 12) & 2) > 0)
    gamma = gamma | ((~L) & 1);
  if (((microcommand >> 12) & 1) > 0)
    gamma = gamma | (L & 1);

  //if four_1248 <> 1 then gamma := perenos; // gamma or

  // summa := (byte(alfa) and 1) + (byte(beta) and 1) + (byte(gamma) and 1);
  summa = alfa + beta + gamma;
  // if alfa then summa := summa + 1;
  // if beta then summa := summa + 1;
  // if gamma then summa := summa + 1;


  sigma = summa & 0xF;
  perenos = summa >> 4;

  if ((md == 0) || ((micro_tact / 4) >= 36))
    {
      switch (((microcommand >> 15) & 7))
	{
	case 1:
	  Registr_R[Signal_I] = Registr_R[(Signal_I + 3) % 42];
	  break;		// i+3   // ???? 12 16
	case 2:
	  Registr_R[Signal_I] = sigma;
	  break;
	case 3:
	  Registr_R[Signal_I] = Registr_S;
	  break;
	case 4:
	  Registr_R[Signal_I] = Registr_R[Signal_I] | Registr_S | sigma;
	  break;
	case 5:
	  Registr_R[Signal_I] = Registr_S | sigma;
	  break;
	case 6:
	  Registr_R[Signal_I] = Registr_R[Signal_I] | Registr_S;
	  break;
	case 7:
	  Registr_R[Signal_I] = Registr_R[Signal_I] | sigma;
	  break;
	}
      if (((microcommand >> 18) & 1) > 0)
	Registr_R[(Signal_I + 41) % 42] = sigma;	// i-1
      if (((microcommand >> 19) & 1) > 0)
	Registr_R[(Signal_I + 40) % 42] = sigma;	// i-2
    }

  if (((microcommand >> 21) & 1) > 0)
    {
      // if tact_0123 = 3 then
      L = 1 & perenos;
    }

  if (((microcommand >> 20) & 1) > 0)
    Registr_M[Signal_I] = Registr_S;	//micro_tact

  switch (((microcommand >> 22) & 3))
    {
    case 1:
      Registr_S = Registr_S1;
      break;
    case 2:
      Registr_S = sigma;
      break;
    case 3:
      Registr_S = Registr_S1 | sigma;
      break;			//    Registr_S1 ?
    }
  switch (((microcommand >> 24) & 3))
    {
    case 1:
      Registr_S1 = sigma;
      break;
    case 2:
      Registr_S1 = Registr_S1;
      break;			// or ((H and four_1248) > 0);
    case 3:
      Registr_S1 = Registr_S1 | sigma;
      break;			// or ((H and four_1248) > 0) or sigma;
    }


  //    i-3              i-2                   i-1
  // 156 157 158 159   160 161 162 163   164 165 166 167
  //    i                i+1                i+2                i+3
  // 0 1 2 3           4 5 6 7           8 9 10 11         12 13 14 15

  switch (((microcommand >> 26) & 3))
    {
      // if ((microcommand shr 26) and 3) = 1 then
    case 1:
      {
	Registr_ST[(Signal_I + 2) % 42] = Registr_ST[(Signal_I + 1) % 42];	// i+2 i+1
	Registr_ST[(Signal_I + 1) % 42] = Registr_ST[Signal_I];	// i+1 i+0
	Registr_ST[Signal_I] = sigma;	// i+0
      };
      break;

      // if ((microcommand shr 26) and 3) = 2 then
    case 2:
      {
	x = Registr_ST[Signal_I];
	Registr_ST[Signal_I] = Registr_ST[(Signal_I + 1) % 42];	// i+0 i+1
	Registr_ST[(Signal_I + 1) % 42] = Registr_ST[(Signal_I + 2) % 42];	// i+1 i+2
	Registr_ST[(Signal_I + 2) % 42] = x;	// i+2
      };
      break;

      // if ((microcommand shr 26) and 3) = 3 then
    case 3:
      {
	x = Registr_ST[Signal_I];	// i+0
	y = Registr_ST[(Signal_I + 1) % 42];	// i+1
	z = Registr_ST[(Signal_I + 2) % 42];	// i+2
	Registr_ST[(Signal_I + 0) % 42] = sigma | y;	// i+0
	Registr_ST[(Signal_I + 1) % 42] = x | z;	// i+1
	Registr_ST[(Signal_I + 2) % 42] = y | x;	// i+2
      };
      break;
    }

  //(micro_tact + 8) mod 168


/***{ рабочий вариант
  Rg_Out := Registr_M[0];
  for( n := 0 to 166 do Registr_M[n] := Registr_M[n + 1];
  Registr_M[167] := Rg_In;
  */



  Rg_Out = 0xF & Registr_M[Signal_I];
  //Registr_M[(micro_tact + 167) mod 168] := Rg_In; // +167 ?
  Registr_M[Signal_I] = Rg_In;	// +167 ?


  ///////////////////////////////////////////////////////////


  ///////////////////////////////////////////////////////////

  micro_tact = micro_tact + 4;
  if (micro_tact > 167)
    micro_tact = 0;


  return Rg_Out;
}


void
Tmk52::create ()
{
  int i;


  //Tik1302 ik1302;
  //Tik1302 ik1303;
  //Tik1302 ik1306;
  //Tir2 ir2_1;
  //Tir2 ir2_2;

  ik1302.micro_tact = 0;
  ik1303.micro_tact = 0;
  ik1306.micro_tact = 0;
  grd = 1;
  mode = 1;

  for (i = 0; i <= 67; i++)
    {
      ik1302.mc_130x[i] = mc_1302[i];
      ik1303.mc_130x[i] = mc_1303[i];
      ik1306.mc_130x[i] = mc_1306[i];
    }

  for (i = 0; i <= 255; i++)
    {
      ik1302.cmd_130x[i] = cmd_1302[i];
      ik1303.cmd_130x[i] = cmd_1303[i];
      ik1306.cmd_130x[i] = cmd_1306[i];
    }

  for (i = 0; i <= 1151; i++)
    {
      ik1302.sp_130x[i] = sp_1302[i];
      ik1303.sp_130x[i] = sp_1303[i];
      ik1306.sp_130x[i] = sp_1306[i];
    }



}

void
Tmk52::pre_exec (char Rg_In)
{
  ik1302.Registr_M[((ik1302.micro_tact / 4) + 41) % 42] = Rg_In;
}


void
Tmk52::exec ()
{
  //int i;
  char tmp;

//  for( i := 0 to 3 do
  {
    tmp = ir2_2.Rg_Out;
    tmp = ik1302.tact_exec (tmp);

    // Р ГРД Г
    //ik1303.keyboard_y := 1;
    //ik1303.keyboard_x := 0;

    //if (grd = 3) or (grd = 2) then if (ik1303.micro_tact div 12) = 9 then ik1303.keyboard_x := 10; // true
    //if grd = 2 then if (ik1303.micro_tact div 12) = 10 then ik1303.keyboard_x := 11; // true
    //if (ik1303.micro_tact div 12) = 11 then ik1303.keyboard_x := 12; // false


    //ik1303.Rg_In := ik1302.Rg_Out;
    tmp = ik1303.tact_exec (tmp);

    //ik1306.Rg_In := ik1303.Rg_Out;
    if ((mode == 1))
      tmp = ik1306.tact_exec (tmp);

    //ir2_1.Rg_In := tmp;
    tmp = ir2_1.tact_exec2 (tmp);

    //ir2_2.Rg_In := ir2_1.Rg_Out;
    tmp = ir2_2.tact_exec2 (tmp);

    //  ik1302.Registr_M [167] := ir2_2.Rg_Out;

    // ik1302.Registr_M[(ik1302.micro_tact + 167) mod 168] := ir2_2.Rg_Out;

    pre_exec (tmp);

  }
}

// http://vak.ru/doku.php/proj/calculator/b3-34
