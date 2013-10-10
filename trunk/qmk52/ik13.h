class Tir2
{

public:
  void tact_exec ();
  char tact_exec2 (unsigned char in_in);
  char Registr_M[253];
  char Rg_In, Rg_Out;
  int micro_tact;
};

class Tik1302
{

public:
  unsigned char tact_exec (unsigned char in_in);
  unsigned int get_mc ();
  unsigned char read_ri (unsigned char i);
  void write_ri (unsigned char i, unsigned char data);
  unsigned char read_rs (unsigned char i);
  bool bool_ (char i);
  unsigned char read_m (unsigned char i);
  unsigned char read_st (unsigned char i);

  unsigned int mc_130x[68];
  unsigned int cmd_130x[256];
  unsigned char sp_130x[1152];

  unsigned char Registr_M[42];
  unsigned char Registr_R[42];
  unsigned char Registr_ST[42];
  unsigned char Registr_S;
  unsigned char Registr_S1;
  unsigned char L, T, perenos;
  unsigned char H;
  unsigned char micro_tact;

  unsigned int microcommand;

  unsigned char sk;
  unsigned char md;
  unsigned char keyboard_x, keyboard_y, segment_i8;
  unsigned char Rg_In, Rg_Out;
  unsigned char asp, adr_mc;

  bool ind;
  bool ind_multipoint[14];
};

class Tmk52
{
public:
  void create ();
  void exec ();
  void pre_exec (char Rg_In);

  Tik1302 ik1302, ik1303, ik1306;
  Tir2 ir2_1, ir2_2;

  int grd;
  int mode;
};
