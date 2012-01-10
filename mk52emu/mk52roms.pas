unit mk52roms;

interface

var
  mc_1302: array[0..67] of cardinal = (
    $0000000, //
    $0800001, //sum=R[i]; S=sum;
    $0A00820, //sum=(S)+($1); S=sum; L=cry;
    $0040020, //sum=S; R[i-1]=sum;
    $0A03180, //sum=(~S|S)+(L|!L); S=sum; L=cry;
    $0203081, //sum=(R[i])+(S)+(L|!L); L=cry;
    $0A00181, //sum=(R[i])+(~S|S); S=sum; L=cry;
    $0803800, //sum=($1)+(L|!L); S=sum;
    $0818001, //sum=R[i]; R[i]=S; S=sum;
    $0800400, //sum=($6); S=sum;
    $0A00089, //sum=(R[i]|~R[i])+(S); S=sum; L=cry;
    $0A03C20, //sum=(S)+($1|$6)+(L|!L); S=sum; L=cry;
    $0800820, //sum=(S)+($1); S=sum;
    $0080020, //sum=S; R[i-2]=sum;
    $0800180, //sum=(~S|S); S=sum;
    $1400020, //sum=S; S=S1; S1=sum;
    $0800081, //sum=(R[i])+(S); S=sum;
    $0210801, //sum=(R[i])+($1); R[i]=sum; L=cry;
    $0043180, //sum=(~S|S)+(L|!L); R[i-1]=sum;
    $0058001, //sum=R[i]; R[i]=S; R[i-1]=sum;
    $0808001, //sum=R[i]; R[i]=R[i+3]; S=sum;
    $0A03081, //sum=(R[i])+(S)+(L|!L); S=sum; L=cry;
    $0A01081, //sum=(R[i])+(S)+(L); S=sum; L=cry;
    $0A01181, //sum=(R[i])+(~S|S)+(L); S=sum; L=cry;
    $0040090, //sum=($A*!L)+(S); R[i-1]=sum;
    $0800401, //sum=(R[i])+($6); S=sum;
    $0A00081, //sum=(R[i])+(S); S=sum; L=cry;
    $0040001, //sum=R[i]; R[i-1]=sum;
    $0800801, //sum=(R[i])+($1); S=sum;
    $1003180, //sum=(~S|S)+(L|!L); S1=sum;
    $0800100, //sum=(~S); S=sum;
    $1200801, //sum=(R[i])+($1); L=cry; S1=sum;
    $0013C01, //sum=(R[i])+($1|$6)+(L|!L); R[i]=sum;
    $0800008, //sum=~R[i]; S=sum;
    $0A00088, //sum=(~R[i])+(S); S=sum; L=cry;
    $0010200, //sum=(S1); R[i]=sum;
    $0800040, //sum=$4; S=sum;
    $0801280, //sum=(S|S1)+(L); S=sum;
    $1801200, //sum=(S1)+(L); S=sum; S1=sum;
    $1000208, //sum=(~R[i])+(S1); S1=sum;
    $0080001, //sum=R[i]; R[i-2]=sum;
    $0A00082, //sum=(M[i])+(S); S=sum; L=cry;
    $0A01008, //sum=~R[i]+(L); S=sum; L=cry;
    $1000001, //sum=R[i]; S1=sum;
    $0A00808, //sum=(~R[i])+($1); S=sum; L=cry;
    $0900001, //sum=R[i]; M[i]=S; S=sum;
    $0010004, //sum=ST[i]; R[i]=sum;
    $0080820, //sum=(S)+($1); R[i-2]=sum;
    $0800002, //sum=M[i]; S=sum;
    $0140002, //sum=M[i]; R[i-1]=sum; M[i]=S;
    $0008000, //R[i]=R[i+3];
    $0A00090, //sum=($A*!L)+(S); S=sum; L=cry;
    $0A00220, //sum=(S)+(S1); S=sum; L=cry;
    $0801001, //sum=R[i]+(L); S=sum;
    $1203200, //sum=(S1)+(L|!L); L=cry; S1=sum;
    $4800001, //sum=R[i]; S=sum; ST[i]=sum;
    $0011801, //sum=(R[i])+($1)+(L); R[i]=sum;
    $1808001, //sum=R[i]; R[i]=R[i+3]; S=sum; S1=sum;
    $0A04020, //sum=S+(!T); S=sum; L=cry;
    $4800801, //sum=(R[i])+($1); S=sum; ST[i]=sum;
    $0840801, //sum=(R[i])+($1); R[i-1]=sum; S=sum;
    $0840020, //sum=S; R[i-1]=sum; S=sum;
    $0813081, //sum=(R[i])+(S)+(L|!L); R[i]=sum; S=sum;
    $0810801, //sum=(R[i])+($1); R[i]=sum; S=sum;
    $0810180, //sum=(~S|S); R[i]=sum; S=sum;
    $0800180, //sum=(~S|S); S=sum;
    $0A00081, //sum=(R[i])+(S); S=sum; L=cry;
    $0800001 //sum=R[i]; S=sum;
    );


  cmd_1302: array[0..255] of cardinal = (
    //0
    $0000000, $0117360, $0114840, $1040240, //0  1  2  3
    $0164040, $0000000, $0000000, $0000000, //4  5  6  7
    $0000000, $0000000, $1A52014, $0000000, //8  9  a  b
    $0000000, $0000000, $0000000, $0000000, //c  d  e  f
    //1
    $0000000, $0000000, $0000000, $0000000, //0  1  2  3
    $0000000, $0000000, $0000000, $0000000, //4  5  6  7
    $0000000, $0000000, $0000000, $0000000, //8  9  a  b
    $0000000, $0000000, $0000000, $0000000, //c  d  e  f
    //2
    $0000000, $0000000, $0000000, $0000000, //0  1  2  3
    $0000000, $0000000, $0000000, $0000000, //4  5  6  7
    $0000000, $0000000, $0000000, $0000000, //8  9  a  b
    $0000000, $0000000, $0000000, $0000000, //c  d  e  f
    //3
    $0000000, $0000000, $0000000, $1015C5B, //0  1  2  3
    $0000000, $0005E5D, $0000000, $0000000, //4  5  6  7
    $0000000, $0000000, $0000000, $0000000, //8  9  a  b
    $0000000, $0000000, $0000000, $0000000, //c  d  e  f
    //4
    $0000000, $0000000, $0000000, $0000000, //0  1  2  3
    $0000000, $0792120, $0000000, $0000000, //4  5  6  7
    $1AF1140, $0000000, $039324C, $00B324C, //8  9  a  b
    $008326D, $00D404C, $0854D40, $0000000, //c  d  e  f
    //5
    $009404C, $06D7770, $0000000, $0000000, //0  1  2  3
    $0A54C7E, $0F44E40, $0000000, $00C580E, //4  5  6  7
    $03C5262, $005716D, $13C4013, $0104070, //8  9  a  b
    $0056F6D, $0A62070, $0106F40, $1056F40, //c  d  e  f
    //6
    $0000000, $0000000, $0000000, $0064B40, //0  1  2  3
    $0524A40, $0692120, $01B4940, $0000000, //4  5  6  7
    $0000000, $0000000, $0000000, $0000000, //8  9  a  b
    $0000000, $0000000, $0000000, $0000000, //c  d  e  f
    //7
    $0000000, $0000000, $0000000, $0000000, //0  1  2  3
    $0740F40, $0000000, $0D05373, $05B205C, //4  5  6  7
    $06D2062, $133200C, $10D7D62, $0A52120, //8  9  a  b
    $1054072, $1494013, $0000000, $0217362, //c  d  e  f
    //8
    $0000000, $0000000, $0000000, $1332014, //0  1  2  3
    $0000000, $0000000, $0C15340, $0000000, //4  5  6  7
    $0000000, $0000000, $0532120, $0365562, //8  9  a  b
    $0000000, $0000000, $04C2120, $0000000, //c  d  e  f
    //9
    $0000000, $0000000, $0000000, $0000000, //0  1  2  3
    $0000000, $0000000, $0000000, $1514078, //4  5  6  7
    $0000000, $1622206, $0000000, $0000000, //8  9  a  b
    $0000000, $0000000, $0000000, $0000000, //c  d  e  f
    //a
    $0000000, $0000000, $0000000, $0000000, //0  1  2  3
    $0000000, $0000000, $0000000, $0000000, //4  5  6  7
    $0000000, $0000000, $0000000, $0000000, //8  9  a  b
    $0000000, $0000000, $0000000, $0000000, //c  d  e  f
    //b
    $0000000, $00B7840, $17C400E, $0056F6D, //0  1  2  3
    $1470E40, $1716B62, $06B2120, $0332120, //4  5  6  7
    $06D204C, $0E67362, $10D0940, $0062423, //8  9  a  b
    $01A3A3A, $0000000, $0000000, $0000000, //c  d  e  f
    //c
    $0000000, $0000000, $0000000, $0000000, //0  1  2  3
    $0000000, $0782120, $0000000, $01E3434, //4  5  6  7
    $0193838, $0183939, $0000000, $10D7A40, //8  9  a  b
    $10E1740, $0057340, $0000000, $0000000, //c  d  e  f
    //d
    $0000000, $0000000, $0000000, $0000000, //0  1  2  3
    $01E3737, $0000000, $01E3636, $0000000, //4  5  6  7
    $0000000, $0000000, $0000000, $0000000, //8  9  a  b
    $0000000, $005565A, $0000000, $0000000, //c  d  e  f
    //e
    $0000000, $0000000, $0000000, $0000000, //0  1  2  3
    $0000000, $0000000, $0000000, $0000000, //4  5  6  7
    $0000000, $0000000, $0000000, $0000000, //8  9  a  b
    $0000000, $0000000, $0000000, $0000000, //c  d  e  f
    //f
    $0000000, $0000000, $0000000, $0000000, //0  1  2  3
    $0000000, $0000000, $0000000, $0000000, //4  5  6  7
    $1015C5B, $0000000, $0005E5D, $0000000, //8  9  a  b
    $0000000, $0000000, $0000000, $0000000 //c  d  e  f
    );


  sp_1302: array[0..1151] of byte = (
    //0
    $00, $00, $00, $10, $03, $00, $00, $00, $00, //$00
    $10, $03, $00, $00, $00, $00, $00, $00, $00, //$01
    $15, $18, $09, $16, $18, $09, $16, $18, $24, //$02
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$03
    $00, $03, $0E, $1E, $33, $00, $00, $00, $00, //$04
    $23, $00, $00, $00, $2F, $00, $2C, $00, $01, //$05
    $11, $32, $00, $00, $00, $03, $00, $0E, $1A, //$06
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$07
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$08
    $1C, $0C, $2F, $09, $1E, $34, $0E, $1E, $0C, //$09
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$0a
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$0b
    $35, $34, $0D, $24, $1E, $1A, $09, $0C, $0F, //$0c
    $3D, $00, $00, $1C, $03, $0E, $0A, $0F, $06, //$0d
    $3D, $00, $0E, $3F, $03, $01, $00, $00, $0E, //$0e
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$0f
    //1
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$00
    $35, $03, $07, $0C, $1E, $1A, $00, $00, $00, //$01
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$02
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$03
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$04
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$05
    $07, $0B, $0D, $0C, $03, $0E, $1E, $3A, $2B, //$06
    $3C, $03, $00, $09, $34, $0E, $1E, $0C, $1E, //$07
    $2E, $01, $31, $2E, $01, $31, $00, $00, $00, //$08
    $2E, $30, $03, $2E, $30, $03, $00, $00, $00, //$09
    $2E, $2D, $00, $2E, $2D, $00, $00, $00, $00, //$0a
    $3B, $04, $2F, $37, $12, $00, $00, $00, $00, //$0b
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$0c
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$0d
    $2E, $00, $00, $2E, $00, $00, $2E, $00, $00, //$0e
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$0f
    //2
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$00
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$01
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$02
    $04, $14, $00, $00, $32, $00, $00, $32, $0C, //$03
    $0A, $32, $00, $00, $32, $00, $00, $32, $00, //$04
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$05
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$06
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$07
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$08
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$09
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$0a
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$0b
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$0c
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$0d
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$0e
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$0f
    //3
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$00
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$01
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$02
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$03
    $01, $31, $00, $01, $31, $00, $01, $31, $36, //$04
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$05
    $30, $03, $00, $30, $03, $00, $30, $03, $2B, //$06
    $2D, $00, $00, $2D, $00, $00, $2D, $00, $00, //$07
    $0A, $30, $03, $00, $30, $03, $00, $30, $03, //$08
    $00, $01, $31, $00, $01, $31, $00, $01, $31, //$09
    $00, $2D, $00, $00, $2D, $00, $00, $2D, $00, //$0a
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$0b
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$0c
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$0d
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$0e
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$0f
    //4
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$00
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$01
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$02
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$03
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$04
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$05
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$06
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$07
    $00, $00, $1C, $03, $1E, $15, $02, $02, $0C, //$08
    $07, $1E, $10, $0F, $09, $32, $1E, $0F, $08, //$09
    $09, $1E, $1A, $30, $1D, $17, $03, $0F, $3D, //$0a
    $07, $0B, $1A, $1D, $28, $00, $0E, $28, $08, //$0b
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$0c
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$0d
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$0e
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$0f
    //5
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$00
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$01
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$02
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$03
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$04
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$05
    $32, $00, $00, $32, $00, $00, $00, $03, $00, //$06
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$07
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$08
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$09
    $14, $00, $00, $32, $00, $00, $32, $00, $00, //$0a
    $0E, $1E, $15, $00, $00, $02, $00, $00, $02, //$0b
    $00, $0E, $08, $0E, $1D, $23, $1E, $3A, $3A, //$0c
    $1D, $04, $15, $00, $00, $3A, $00, $00, $3A, //$0d
    $00, $00, $3A, $00, $0D, $0E, $03, $0F, $00, //$0e
    $3B, $3C, $2F, $37, $3C, $01, $00, $00, $00, //$0f
    //6
    $00, $00, $00, $00, $30, $00, $02, $24, $1E, //$00
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$01
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$02
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$03
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$04
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$05
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$06
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$07
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$08
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$09
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$0a
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$0b
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$0c
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$0d
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$0e
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$0f
    //7
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$00
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$01
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$02
    $0E, $1E, $25, $00, $2F, $00, $00, $09, $0C, //$03
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$04
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$05
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$06
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$07
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$08
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$09
    $00, $00, $12, $00, $00, $12, $04, $0C, $12, //$0a
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$0b
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$0c
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$0d
    0, 0, 0, 0, 0, 0, 0, 0, 0, //$0e
    0, 0, 0, 0, 0, 0, 0, 0, 0 //$0f

    );


implementation
//  http://emu145.googlecode.com/svn/trunk/pmkemu/
end.
