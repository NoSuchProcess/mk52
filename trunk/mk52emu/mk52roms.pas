unit mk52roms;

interface

var
  mc_1302: array[0..67] of cardinal = (
    $0000000, $0800001, $0A00820, $0040020,
    $0A03120, $0203081, $0A00181, $0803800,
    $0818001, $0800400, $0A00089, $0A03C20,
    $0800820, $0080020, $0800120, $1400020,
    $0800081, $0210801, $0040000, $0058001,
    $0808001, $0A03081, $0A01081, $0A01181,
    $0040090, $0800401, $0A00081, $0040001,
    $0800801, $1000000, $0800100, $1200801,
    $0013C01, $0800008, $0A00088, $0010200,
    $0800040, $0800280, $1801200, $1000208,
    $0080001, $0A00082, $0A01008, $1000001,
    $0A00808, $0900001, $8010004, $0080820,
    $0800002, $0140002, $0008000, $0A00090,
    $0A00220, $0801001, $1203200, $4800001,
    $0011801, $1008001, $0A04020, $4800801,
    $0840801, $0840020, $0013081, $0010801,
    $0818180, $0800180, $0A00081, $0800001
    );

  cmd_1302: array[0..255] of cardinal = (
    $00204E4E, $00117360, $00114840, $01040240,
    $00164040, $001B3240, $00064640, $015B4013,
    $00D93130, $00001040, $01A52014, $00000000,
    $00000000, $00000000, $00000000, $00C12040,
    $00D0536D, $00517740, $00B43130, $00B22223,
    $00C15340, $00FD2040, $002D1D1D, $0008403B,
    $00092140, $00094061, $000A2140, $00082140,
    $000D7076, $010D400D, $000A403B, $00056D40,
    $00100259, $010B1340, $00242044, $010B7840,
    $00064002, $01FF2008, $0008565A, $0126403F,
    $016C400D, $00C12077, $00517740, $00517740,
    $00083240, $010C400D, $01FF200A, $010B3568,
    $00117B5A, $0021206D, $01222034, $01015C5B,
    $01D03454, $00005E5D, $010E400D, $010E0044,
    $00F44E40, $009A206D, $00F44E5A, $00000000,
    $00000000, $00000000, $00000000, $00C11D1D,
    $00063333, $010B403B, $01344043, $00096A6A,
    $000A4443, $00792120, $01D32047, $00081E1E,
    $01AF1140, $00AB1D1D, $0039324C, $000B324C,
    $0008326D, $000D404C, $00854D40, $00134040,
    $0009404C, $006D7770, $006D7240, $01001640,
    $00A54C7E, $00F44E40, $01536900, $000A580E,
    $003C5262, $0005716D, $013C4013, $00104070,
    $00056F6D, $00A62070, $00106F40, $01056F40,
    $001F3E3D, $0028595A, $001E2223, $00064B40,
    $00524A40, $00692120, $001B4940, $00093240,
    $011F0140, $00154840, $00062423, $00062423,
    $01057340, $015E400D, $00095828, $00092223,
    $00992F40, $00982F40, $00622040, $005D5820,
    $00740F40, $00B81C20, $00D05373, $005B205C,
    $006D2062, $0133200A, $010B7D62, $00A52120,
    $01054072, $01494013, $01040540, $00217362,
    $013D6A40, $00067840, $01AB6C6D, $01332014,
    $000E7C6C, $00050B3F, $00C15340, $00950853,
    $00E0417A, $00E04240, $00532120, $00365562,
    $008F1E20, $013D1740, $004C2120, $0170406A,
    $00C05340, $00061D1D, $00814545, $00063333,
    $00061E1E, $00091E1E, $00900720, $01514078,
    $00081D1D, $01622206, $001E4545, $00114060,
    $000B2E40, $000F2D40, $010E1F40, $000D7677,
    $00D33C40, $01D32032, $00116E60, $011D3440,
    $00FF7440, $00073240, $001B430A, $01D32047,
    $00113434, $001E6E40, $00D33C40, $00937540,
    $00D01E20, $00043277, $00CA4020, $00107F54,
    $00212068, $000B7840, $017C400C, $00056F6D,
    $01470C40, $01716B62, $006B2120, $00332120,
    $006D204C, $00E67362, $010D0940, $00062423,
    $001A3A3A, $018F406F, $0151334C, $010D1716,
    $01D35340, $00D24061, $00CA6554, $00104064,
    $00512223, $00782120, $00263130, $001E3434,
    $00193838, $00183939, $000D6654, $010D7A40,
    $010E1740, $00057340, $00B86140, $00045263,
    $00122773, $008F5373, $002E5150, $0151404C,
    $001E3737, $00894E40, $001E3636, $006D563D,
    $00E07A41, $00E12973, $00082640, $00062540,
    $00D87967, $0005565A, $0005286C, $00762041,
    $00952040, $008F1D1D, $01D35340, $008F2040,
    $00CC4F4F, $00114060, $00054040, $001E3434,
    $01047340, $011E3434, $00C62C2B, $00C53130,
    $003E1D1D, $01041740, $001E3535, $00D35353,
    $00DE4077, $00E24057, $00064E68, $01E53812,
    $00D84067, $00064069, $000A402A, $00EF202A,
    $01015C5B, $00090F40, $00005E5D, $010B3613,
    $00144740, $01176806, $000A5A5A, $01D3200D
    );

  sp_1302: array[0..1151] of byte = (
    $00, $00, $00, $10, $03, $1D, $00, $07, $1E,
    $10, $03, $1C, $0B, $07, $0C, $1E, $00, $00,
    $15, $18, $09, $16, $18, $09, $16, $18, $24,
    $00, $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $03, $0E, $1E, $33, $00, $00, $00, $00,
    $23, $00, $00, $00, $2F, $00, $2C, $00, $01,
    $11, $32, $00, $00, $00, $03, $00, $0E, $1A,
    $0F, $0E, $0D, $19, $03, $2F, $0E, $0D, $08,
    $1C, $0C, $0D, $01, $00, $00, $03, $24, $0F,
    $1C, $0C, $2F, $09, $1E, $34, $0E, $1E, $0C,
    $06, $0A, $0D, $00, $00, $00, $00, $09, $0F,
    $38, $00, $00, $00, $00, $00, $0A, $26, $06,
    $35, $34, $0D, $24, $1E, $1A, $09, $0C, $0F,
    $3D, $00, $00, $1C, $03, $0E, $0A, $0F, $06,
    $3D, $00, $0E, $3F, $03, $01, $00, $00, $0E,
    $3F, $33, $0D, $01, $08, $00, $01, $08, $04,
    $06, $03, $0E, $2B, $3A, $09, $12, $1E, $33,
    $35, $03, $07, $0C, $1E, $1A, $00, $00, $00,
    $35, $0C, $2F, $0E, $03, $01, $00, $00, $15,
    $24, $1E, $1A, $23, $1D, $00, $00, $00, $00,
    $09, $0C, $2F, $09, $03, $00, $24, $0C, $0F,
    $3D, $09, $1E, $3F, $03, $07, $0B, $22, $03,
    $07, $0B, $0D, $0C, $03, $0E, $1E, $3A, $2B,
    $3C, $03, $00, $09, $34, $0E, $1E, $0C, $1E,
    $2E, $01, $31, $2E, $01, $31, $00, $00, $00,
    $2E, $30, $03, $2E, $30, $03, $00, $00, $00,
    $2E, $2D, $00, $2E, $2D, $00, $00, $00, $00,
    $3B, $04, $2F, $37, $12, $00, $00, $00, $00,
    $14, $00, $00, $08, $00, $00, $00, $00, $00,
    $01, $13, $00, $01, $13, $00, $01, $13, $04,
    $2E, $00, $00, $2E, $00, $00, $2E, $00, $00,
    $3D, $07, $10, $3F, $03, $00, $2C, $07, $1E,
    $00, $00, $00, $00, $00, $00, $00, $00, $04,
    $00, $0F, $10, $03, $00, $1C, $03, $0F, $1D,
    $03, $32, $00, $2B, $14, $00, $00, $08, $00,
    $04, $14, $00, $00, $32, $00, $00, $32, $0C,
    $0A, $32, $00, $00, $32, $00, $00, $32, $00,
    $21, $15, $18, $21, $16, $18, $00, $17, $18,
    $19, $1A, $18, $19, $16, $18, $09, $16, $18,
    $2B, $15, $00, $00, $17, $00, $00, $17, $00,
    $12, $1B, $0E, $0F, $1B, $0E, $23, $2B, $0A,
    $2C, $18, $00, $2A, $18, $07, $0B, $03, $04,
    $32, $14, $00, $32, $32, $11, $00, $08, $00,
    $09, $0C, $15, $03, $00, $00, $06, $3C, $00,
    $00, $2C, $00, $00, $2A, $00, $09, $16, $00,
    $00, $00, $11, $00, $09, $16, $18, $09, $1E,
    $00, $00, $07, $0A, $29, $3E, $33, $29, $00,
    $0F, $0B, $0F, $10, $03, $08, $24, $03, $23,
    $32, $01, $1D, $32, $08, $00, $32, $08, $32,
    $32, $08, $23, $32, $08, $0F, $23, $23, $04,
    $09, $1E, $0F, $00, $00, $14, $00, $00, $08,
    $37, $00, $00, $37, $00, $00, $37, $00, $00,
    $01, $31, $00, $01, $31, $00, $01, $31, $36,
    $1A, $30, $0D, $00, $30, $0D, $00, $30, $0D,
    $30, $03, $00, $30, $03, $00, $30, $03, $2B,
    $2D, $00, $00, $2D, $00, $00, $2D, $00, $00,
    $0A, $30, $03, $00, $30, $03, $00, $30, $03,
    $00, $01, $31, $00, $01, $31, $00, $01, $31,
    $00, $2D, $00, $00, $2D, $00, $00, $2D, $00,
    $2C, $00, $00, $2A, $00, $00, $09, $18, $00,
    $07, $1E, $0F, $01, $00, $08, $1C, $0A, $08,
    $14, $00, $00, $32, $00, $00, $32, $2B, $00,
    $32, $00, $00, $32, $27, $36, $08, $09, $0C,
    $1E, $02, $1D, $0F, $0C, $0F, $26, $07, $22,
    $00, $00, $00, $00, $00, $00, $00, $00, $00,
    $1D, $23, $23, $09, $23, $0C, $03, $23, $23,
    $02, $35, $03, $0F, $00, $00, $00, $04, $0C,
    $01, $12, $00, $08, $00, $32, $0A, $00, $00,
    $06, $18, $00, $17, $18, $00, $17, $18, $00,
    $00, $01, $13, $00, $01, $13, $04, $01, $13,
    $00, $00, $00, $09, $15, $18, $00, $35, $03,
    $0E, $03, $09, $0C, $1B, $1E, $0F, $1B, $08,
    $00, $00, $1C, $03, $1E, $15, $02, $0C, $00,
    $07, $1E, $10, $0F, $09, $32, $1E, $0F, $08,
    $09, $1E, $1A, $18, $1D, $17, $03, $0F, $3D,
    $07, $0B, $1A, $1D, $28, $00, $0E, $28, $08,
    $00, $00, $00, $00, $00, $06, $03, $00, $09,
    $00, $04, $2B, $23, $04, $08, $08, $00, $08,
    $0E, $03, $00, $2B, $2F, $0D, $12, $03, $04,
    $01, $08, $00, $01, $08, $00, $01, $08, $04,
    $0F, $1D, $2F, $0E, $03, $23, $07, $1E, $0D,
    $0F, $12, $00, $23, $24, $1E, $23, $0F, $04,
    $26, $12, $15, $03, $12, $04, $24, $2F, $0F,
    $12, $04, $01, $0F, $07, $1E, $0F, $00, $01,
    $0E, $0F, $20, $05, $00, $07, $12, $0E, $08,
    $1E, $00, $10, $03, $0F, $04, $00, $00, $00,
    $32, $00, $00, $32, $00, $00, $00, $03, $00,
    $00, $00, $01, $00, $00, $05, $00, $17, $0D,
    $00, $00, $00, $0A, $1A, $18, $00, $17, $03,
    $32, $09, $0F, $32, $07, $0C, $0C, $1A, $0F,
    $14, $00, $00, $32, $00, $00, $32, $00, $00,
    $0E, $1E, $15, $00, $00, $02, $00, $00, $02,
    $00, $0E, $08, $0E, $1D, $23, $1E, $3A, $3A,
    $1D, $04, $15, $00, $00, $3A, $00, $00, $3A,
    $00, $00, $3A, $00, $0D, $0E, $03, $0F, $00,
    $3B, $3C, $2F, $37, $3C, $01, $00, $00, $00,
    $00, $00, $00, $00, $30, $00, $02, $24, $1E,
    $00, $00, $00, $00, $07, $0B, $22, $03, $04,
    $00, $00, $39, $04, $25, $08, $03, $07, $0F, //. 108  //6c
    $12, $2C, $00, $2B, $2A, $26, $0D, $07, $0F,
    $04, $0B, $08, $01, $10, $0D, $09, $00, $00,
    $00, $01, $08, $04, $01, $08, $23, $01, $08,
    $00, $00, $1B, $00, $00, $1B, $1F, $0E, $1B,
    $00, $00, $00, $00, $00, $2C, $00, $1B, $00,
    $00, $00, $01, $0F, $0D, $01, $09, $1E, $2B,
    $00, $23, $1A, $07, $1E, $0C, $0F, $00, $00,
    $1E, $12, $00, $00, $12, $00, $00, $12, $1A,
    $1E, $00, $10, $0F, $24, $1E, $34, $1D, $00,
    $02, $00, $00, $00, $00, $00, $09, $2F, $01,
    $00, $00, $00, $00, $00, $00, $12, $09, $15,
    $00, $00, $00, $00, $00, $28, $00, $00, $28,
    $00, $00, $2B, $00, $00, $00, $09, $0C, $23,
    $24, $0C, $1E, $0F, $00, $07, $03, $0F, $00,
    $00, $00, $01, $0F, $07, $0B, $0F, $25, $0F, //.123  //7b
    $0F, $04, $00, $00, $00, $12, $09, $0C, $12,
    $00, $00, $00, $12, $00, $00, $00, $09, $0C,
    $03, $00, $00, $00, $04, $32, $24, $0F, $23,
    $0E, $0D, $00, $00, $00, $00, $09, $1E, $1A,
    $07, $0B, $0F, $07, $0C, $1E, $1A, $0F, $00,
    $0E, $0D, $00, $00, $00, $00, $00, $04, $08,
    $12, $00, $01, $0B, $00, $00, $00, $00, $09,
    $00, $00, $00, $00, $00, $00, $00, $06, $0B,
    $00, $00, $12, $00, $00, $12, $04, $0C, $12,
    $32, $00, $00, $32, $00, $00, $08, $36, $00,
    $02, $0D, $00, $01, $0F, $0D, $00, $0E, $1E,
    $1E, $00, $10, $0F, $07, $0B, $34, $0F, $1D,
    $1D, $04, $08, $36, $00, $08, $12, $00, $00,
    $03, $1E, $0F, $26, $0A, $02, $26, $3E, $08
    );


/////////////   1303  ////////////////////////

  mc_1303: array[0..67] of cardinal = (
    $0000000, $0800001, $0040020, $1440090,
    $0A00081, $1000000, $1400020, $0800008,
    $0A03180, $1002200, $0800400, $1418001,
    $0080020, $0841020, $0203100, $0203088,
    $0A00820, $0800120, $08001C0, $0810081,
    $0A00089, $0800401, $0A010A0, $0A01081,
    $0818001, $1A00220, $0201100, $0203420,
    $0008000, $0801020, $0201420, $0801190,
    $0040000, $0080820, $0800002, $0140002,
    $0800100, $0A03C20, $0A00808, $0A01008,
    $0200540, $0601209, $0083100, $0A03081,
    $8800004, $0058001, $1001280, $1008001,
    $1200209, $4018001, $0040002, $1000001,
    $0010200, $0800840, $0A01181, $4018801,
    $0A10181, $0800801, $0040001, $0011190,
    $0858001, $0040020, $3200209, $08000C0,
    $4000020, $0600081, $1000000, $1000180);

  cmd_1303: array[0..255] of cardinal = (
    $00386050, $005B3F3E, $000F5970, $00152470,
    $000C3D50, $0011312F, $005B4544, $00165050,
    $000C3404, $005B3F3E, $00D40450, $00162424,
    $000C4962, $01FB5250, $000D4924, $01BB2222,
    $00155050, $010F5247, $00182525, $00080505,
    $000E041E, $00123433, $007F6425, $007F0D25,
    $01650950, $01176553, $007E2432, $00087150,
    $007E2455, $00135076, $00085977, $005B4544,
    $000C2E26, $00310D2E, $00100E35, $00316B47,
    $01381250, $0011302E, $01385F50, $00050250,
    $011C0101, $00195050, $00382C2C, $016F2222,
    $013A2222, $002F6B56, $00093D6C, $00F04D50,
    $000C1750, $00074A50, $01B45047, $003C2020,
    $01AA2B6A, $00123432, $001D4933, $0113500C,
    $00052556, $00087C50, $01130000, $00142B2B,
    $004A1D50, $006E5756, $00496050, $00E57D58,
    $011E5D22, $01F35F50, $00EA0505, $001C7A50,
    $01080B50, $0054244B, $000C4050, $002A2121,
    $00135C5C, $000A4650, $00152504, $009D2B60,
    $00064350, $00192020, $00292C2C, $01235C50,
    $006D3C3C, $0031017D, $00092D2D, $004E2D2D,
    $01596A7E, $00E3396E, $006E3654, $016E6E47,
    $00534950, $00EE2062, $0016226E, $00660525,
    $00135C5C, $000A4241, $00383B3B, $000C7277,
    $00360404, $00042020, $00100A2E, $00155050,
    $00532404, $0004642B, $01843C47, $01A35047,
    $01847250, $015C112F, $00080434, $00152F23,
    $00080505, $00906047, $0113150C, $006D2224,
    $00747250, $000C632B, $00AD672B, $000A612E,
    $01B97463, $00417374, $00BD0658, $00EA2450,
    $00087166, $01BD3950, $001A2E50, $00BD6047,
    $00175079, $005E6035, $000A3847, $01067F47,
    $008C5251, $0013612E, $0087602E, $005B3F3E,
    $00DC2121, $00177374, $00182525, $00286050,
    $00064F4E, $000C5251, $006E2926, $008F602F,
    $008C502A, $00172928, $00814F4E, $003F534B,
    $000F075B, $00082525, $01E85047, $00790505,
    $00152F23, $0017506A, $00095047, $00082525,
    $00E63A62, $00DA0B47, $01174150, $00182525,
    $00090450, $01175B50, $00094850, $001B2F50,
    $00806047, $000A3720, $0010382F, $002C0505,
    $009B5021, $00160505, $01ED3A50, $00040505,
    $00082525, $01080F50, $01B35047, $000D3D4C,
    $00180404, $01C03A50, $00E20421, $00287B50,
    $00097F26, $0013612E, $01B6112F, $00322425,
    $01B81847, $00BA714B, $00182450, $00080505,
    $00182525, $004F1D24, $00736F5C, $00A67569,
    $00AD2726, $01BE5022, $000A5E04, $00173A62,
    $00CB752E, $00B11E25, $00CB0953, $00085068,
    $002B2020, $01984150, $00C77C04, $00DA0950,
    $00160404, $00F56040, $00DE0450, $01CB1160,
    $00CF4950, $000A4747, $001F210B, $00145050,
    $01171050, $00052075, $001D3D37, $00365555,
    $00130101, $01D57424, $00D66047, $01C47850,
    $004D2C2C, $01174150, $00174847, $00C90350,
    $000A2760, $0019502E, $00D72C2C, $01174850,
    $006C224B, $000A495B, $00100E35, $00312104,
    $01C00850, $00115A2F, $00EA0505, $00080574,
    $00152F23, $005C6050, $01C94122, $01A42222,
    $00DF2847, $00C9202E, $00A76047, $0117502F,
    $002E2020, $01205048, $00F8606D, $002D604C,
    $00443A62, $000D3D2E, $015C3950, $01625022,
    $006E136E, $0031602E, $01085D1A, $010F6F50,
    $0017506A, $00FB5020, $000A3C47, $00174D50
    );

  sp_1303: array[0..1151] of byte = (
    $2C, $23, $00, $2C, $23, $00, $2C, $23, $30,
    $31, $32, $00, $31, $32, $12, $31, $32, $30,
    $00, $00, $00, $11, $23, $00, $1F, $06, $00,
    $31, $00, $1C, $31, $00, $00, $31, $08, $1D,
    $2C, $02, $0E, $2C, $02, $01, $2C, $02, $08,
    $08, $3A, $00, $00, $3A, $01, $05, $3A, $11,
    $18, $0A, $2B, $00, $01, $33, $02, $24, $25,
    $37, $3A, $18, $31, $3A, $1F, $31, $3A, $3D,
    $37, $02, $06, $31, $02, $12, $31, $10, $19,
    $39, $02, $26, $33, $09, $08, $19, $19, $08,
    $01, $14, $0C, $00, $00, $00, $1B, $06, $01,
    $26, $00, $21, $12, $14, $24, $06, $12, $00,
    $39, $00, $21, $08, $22, $00, $10, $14, $00,
    $20, $00, $00, $39, $02, $00, $06, $25, $25,
    $19, $02, $16, $09, $11, $19, $16, $11, $13,
    $18, $08, $10, $18, $00, $01, $1F, $06, $12,
    $1A, $12, $2E, $19, $02, $00, $33, $38, $00,
    $0D, $06, $3B, $13, $0A, $02, $00, $27, $00,
    $00, $00, $33, $13, $3C, $00, $11, $14, $04,
    $11, $1D, $34, $13, $01, $00, $14, $27, $00,
    $2C, $10, $21, $2C, $02, $33, $00, $00, $00,
    $37, $12, $2A, $31, $02, $00, $12, $06, $09,
    $37, $12, $2A, $31, $14, $0C, $00, $00, $00,
    $39, $0D, $12, $10, $0F, $00, $00, $27, $03,
    $37, $12, $0C, $31, $05, $00, $31, $00, $00,
    $37, $20, $0A, $31, $00, $00, $00, $00, $00,
    $11, $13, $0E, $01, $0D, $11, $05, $25, $24,
    $0A, $24, $0C, $08, $0D, $21, $00, $00, $00,
    $37, $06, $3A, $31, $05, $02, $0A, $1D, $16,
    $38, $14, $0C, $00, $08, $06, $20, $1B, $34,
    $0E, $02, $06, $00, $02, $1F, $19, $20, $08,
    $37, $10, $21, $31, $12, $0C, $00, $00, $00,
    $01, $2D, $30, $01, $2D, $00, $01, $2D, $30,
    $33, $34, $06, $01, $18, $00, $01, $18, $08,
    $31, $20, $34, $31, $20, $05, $31, $20, $08,
    $1F, $3A, $20, $14, $3A, $20, $0C, $00, $20,
    $0A, $20, $06, $30, $1F, $0C, $00, $20, $00,
    $35, $20, $05, $34, $14, $09, $30, $20, $11,
    $08, $18, $18, $08, $18, $18, $08, $33, $20,
    $04, $16, $06, $36, $06, $0C, $01, $03, $00,
    $2F, $08, $18, $1C, $00, $18, $00, $20, $18,
    $00, $18, $14, $35, $1D, $06, $14, $00, $3B,
    $06, $20, $05, $34, $14, $09, $19, $00, $21,
    $05, $3A, $3A, $06, $3A, $3A, $05, $3A, $3A,
    $01, $23, $00, $01, $23, $00, $01, $23, $08,
    $01, $32, $02, $01, $32, $02, $01, $32, $02,
    $15, $04, $03, $15, $17, $03, $15, $17, $03,
    $07, $2B, $03, $07, $17, $03, $07, $17, $03,
    $04, $1E, $06, $1E, $3F, $0E, $09, $11, $13,
    $0F, $29, $05, $09, $28, $09, $09, $09, $01,
    $08, $0B, $0B, $1B, $0B, $0B, $1E, $0B, $00,
    $08, $0B, $0B, $0E, $0B, $0B, $1A, $0B, $00,
    $11, $1D, $06, $08, $10, $04, $02, $06, $2F,
    $1F, $1C, $2F, $00, $1C, $1C, $09, $18, $11,
    $0B, $0C, $0C, $0B, $02, $30, $00, $00, $00,
    $25, $1C, $04, $01, $1C, $1D, $1D, $06, $08,
    $01, $30, $21, $3F, $2E, $11, $19, $25, $01,
    $16, $00, $00, $03, $0C, $0A, $19, $0A, $19,
    $0E, $16, $1B, $11, $1D, $10, $3C, $3A, $05,
    $20, $08, $10, $06, $22, $19, $02, $22, $18,
    $06, $0C, $01, $10, $00, $00, $00, $11, $13,
    $0A, $2B, $03, $0A, $17, $03, $0A, $17, $03,
    $12, $14, $06, $12, $02, $00, $0A, $02, $00,
    $0A, $24, $0C, $00, $0A, $21, $06, $20, $18,
    $0A, $21, $21, $35, $02, $08, $10, $02, $05,
    $00, $12, $0F, $11, $24, $21, $35, $02, $05,
    $06, $25, $0C, $06, $02, $12, $14, $02, $18,
    $12, $20, $14, $00, $00, $21, $18, $12, $0B,
    $0A, $24, $06, $00, $20, $08, $25, $02, $00,
    $24, $02, $35, $18, $12, $14, $34, $00, $18,
    $12, $14, $0C, $00, $0A, $21, $35, $02, $00,
    $00, $26, $03, $06, $27, $03, $06, $27, $03,
    $26, $03, $00, $27, $03, $00, $27, $03, $00,
    $11, $04, $03, $00, $36, $03, $00, $36, $03,
    $06, $04, $03, $07, $17, $03, $07, $17, $03,
    $0A, $20, $24, $25, $03, $06, $08, $02, $0B,
    $12, $04, $16, $0A, $17, $03, $0A, $17, $03,
    $07, $2B, $00, $07, $17, $00, $07, $17, $25,
    $00, $07, $2B, $03, $07, $17, $03, $07, $17,
    $03, $36, $03, $11, $24, $1D, $24, $03, $06,
    $00, $00, $00, $00, $00, $00, $00, $00, $00,
    $00, $15, $04, $03, $15, $17, $03, $15, $17,
    $03, $12, $1D, $1D, $14, $06, $12, $06, $00,
    $1C, $1C, $00, $1C, $2F, $00, $06, $20, $20,
    $00, $0B, $02, $00, $0B, $02, $00, $36, $00,
    $01, $18, $18, $01, $18, $18, $01, $18, $18,
    $00, $00, $00, $33, $00, $08, $18, $04, $28,
    $1F, $0C, $08, $25, $06, $0E, $06, $00, $18,
    $06, $0E, $00, $16, $16, $00, $1D, $20, $20,
    $18, $07, $06, $35, $10, $34, $05, $09, $24,
    $05, $09, $09, $09, $09, $01, $0D, $10, $09,
    $08, $25, $33, $2E, $06, $1B, $06, $00, $13,
    $1C, $00, $00, $1C, $00, $00, $1C, $00, $38,
    $1D, $3D, $05, $1D, $3D, $05, $1D, $3D, $05,
    $1D, $20, $1D, $00, $18, $00, $33, $34, $06,
    $39, $3C, $21, $01, $3C, $01, $06, $1F, $19,
    $00, $00, $00, $00, $00, $00, $00, $00, $08,
    $0A, $17, $03, $11, $13, $14, $00, $05, $35,
    $00, $05, $34, $00, $00, $34, $00, $00, $34,
    $38, $04, $02, $33, $00, $11, $04, $00, $00,
    $0C, $00, $26, $33, $09, $09, $20, $08, $18,
    $0F, $36, $00, $00, $00, $00, $00, $27, $05,
    $30, $09, $20, $20, $06, $20, $21, $00, $00,
    $0A, $3A, $10, $2B, $18, $38, $38, $0E, $02,
    $16, $0C, $35, $05, $00, $00, $19, $30, $00,
    $08, $1C, $18, $00, $1C, $00, $00, $05, $3A,
    $00, $00, $00, $00, $00, $00, $00, $38, $20,
    $1F, $0C, $08, $25, $06, $08, $00, $00, $34,
    $06, $1C, $05, $25, $1C, $25, $1F, $18, $34,
    $33, $20, $26, $0B, $02, $00, $34, $09, $09,
    $00, $06, $36, $00, $00, $11, $24, $0B, $34,
    $20, $20, $00, $00, $39, $02, $08, $1D, $00,
    $00, $08, $00, $3E, $00, $00, $37, $08, $1D,
    $00, $00, $20, $00, $35, $20, $05, $34, $34,
    $12, $14, $24, $34, $2E, $30, $1F, $06, $08,
    $01, $05, $30, $04, $30, $2E, $06, $0E, $00,
    $36, $00, $00, $00, $00, $00, $34, $34, $00,
    $0A, $06, $1B, $1F, $00, $00, $25, $00, $3B,
    $25, $10, $06, $00, $00, $0A, $10, $07, $03,
    $0A, $10, $01, $00, $00, $00, $16, $19, $35,
    $06, $12, $10, $19, $10, $00, $00, $00, $3A,
    $11, $06, $09, $35, $16, $10, $3E, $13, $0D,
    $24, $3D, $10, $0E, $12, $33, $03, $06, $30,
    $00, $26, $00, $00, $27, $00, $00, $3B, $08,
    $06, $0C, $0C, $20, $0A, $06, $11, $14, $00,
    $18, $24, $06, $0A, $10, $18, $11, $24, $18,
    $10, $25, $05, $06, $3C, $05, $06, $00, $00,
    $06, $0C, $0C, $00, $00, $12, $24, $1D, $1D
    );


implementation
//  http://emu145.googlecode.com/svn/trunk/pmkemu/

{
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


    }

end.

