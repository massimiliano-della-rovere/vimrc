" GENERAL {{{
" set cmdheight=4
set nocompatible " enable vim new functions, making it "NO COMPATIBLE" with vi
set history=1000 " history of :commands and search patters
if has('mouse')
	set mouse=a " use all mouse functions
endif
" }}}

" SYNTAX {{{
filetype on " enable the FILETYPE detection
filetype plugin on " enable the vim settings for thr current FILETYPE
filetype indent on " enable the INDENT setting for the current FILETYPE
if &t_Co > 1
	syntax on " enable SYNTAX highlightning
endif
packadd! matchit
" }}}

" HARDCOPY/PRINT {{{
" printers: http://localhost:631/printers/
set printoptions=paper:A4,header:0
" }}}

" 256-color MODE: NAMES {{{
hi  x016_Grey0              ctermfg=16   guifg=#000000  "rgb=0,0,0
hi  x017_NavyBlue           ctermfg=17   guifg=#00005f  "rgb=0,0,95
hi  x018_DarkBlue           ctermfg=18   guifg=#000087  "rgb=0,0,135
hi  x019_Blue3              ctermfg=19   guifg=#0000af  "rgb=0,0,175
hi  x020_Blue3              ctermfg=20   guifg=#0000d7  "rgb=0,0,215
hi  x021_Blue1              ctermfg=21   guifg=#0000ff  "rgb=0,0,255
hi  x022_DarkGreen          ctermfg=22   guifg=#005f00  "rgb=0,95,0
hi  x023_DeepSkyBlue4       ctermfg=23   guifg=#005f5f  "rgb=0,95,95
hi  x024_DeepSkyBlue4       ctermfg=24   guifg=#005f87  "rgb=0,95,135
hi  x025_DeepSkyBlue4       ctermfg=25   guifg=#005faf  "rgb=0,95,175
hi  x026_DodgerBlue3        ctermfg=26   guifg=#005fd7  "rgb=0,95,215
hi  x027_DodgerBlue2        ctermfg=27   guifg=#005fff  "rgb=0,95,255
hi  x028_Green4             ctermfg=28   guifg=#008700  "rgb=0,135,0
hi  x029_SpringGreen4       ctermfg=29   guifg=#00875f  "rgb=0,135,95
hi  x030_Turquoise4         ctermfg=30   guifg=#008787  "rgb=0,135,135
hi  x031_DeepSkyBlue3       ctermfg=31   guifg=#0087af  "rgb=0,135,175
hi  x032_DeepSkyBlue3       ctermfg=32   guifg=#0087d7  "rgb=0,135,215
hi  x033_DodgerBlue1        ctermfg=33   guifg=#0087ff  "rgb=0,135,255
hi  x034_Green3             ctermfg=34   guifg=#00af00  "rgb=0,175,0
hi  x035_SpringGreen3       ctermfg=35   guifg=#00af5f  "rgb=0,175,95
hi  x036_DarkCyan           ctermfg=36   guifg=#00af87  "rgb=0,175,135
hi  x037_LightSeaGreen      ctermfg=37   guifg=#00afaf  "rgb=0,175,175
hi  x038_DeepSkyBlue2       ctermfg=38   guifg=#00afd7  "rgb=0,175,215
hi  x039_DeepSkyBlue1       ctermfg=39   guifg=#00afff  "rgb=0,175,255
hi  x040_Green3             ctermfg=40   guifg=#00d700  "rgb=0,215,0
hi  x041_SpringGreen3       ctermfg=41   guifg=#00d75f  "rgb=0,215,95
hi  x042_SpringGreen2       ctermfg=42   guifg=#00d787  "rgb=0,215,135
hi  x043_Cyan3              ctermfg=43   guifg=#00d7af  "rgb=0,215,175
hi  x044_DarkTurquoise      ctermfg=44   guifg=#00d7d7  "rgb=0,215,215
hi  x045_Turquoise2         ctermfg=45   guifg=#00d7ff  "rgb=0,215,255
hi  x046_Green1             ctermfg=46   guifg=#00ff00  "rgb=0,255,0
hi  x047_SpringGreen2       ctermfg=47   guifg=#00ff5f  "rgb=0,255,95
hi  x048_SpringGreen1       ctermfg=48   guifg=#00ff87  "rgb=0,255,135
hi  x049_MediumSpringGreen  ctermfg=49   guifg=#00ffaf  "rgb=0,255,175
hi  x050_Cyan2              ctermfg=50   guifg=#00ffd7  "rgb=0,255,215
hi  x051_Cyan1              ctermfg=51   guifg=#00ffff  "rgb=0,255,255
hi  x052_DarkRed            ctermfg=52   guifg=#5f0000  "rgb=95,0,0
hi  x053_DeepPink4          ctermfg=53   guifg=#5f005f  "rgb=95,0,95
hi  x054_Purple4            ctermfg=54   guifg=#5f0087  "rgb=95,0,135
hi  x055_Purple4            ctermfg=55   guifg=#5f00af  "rgb=95,0,175
hi  x056_Purple3            ctermfg=56   guifg=#5f00d7  "rgb=95,0,215
hi  x057_BlueViolet         ctermfg=57   guifg=#5f00ff  "rgb=95,0,255
hi  x058_Orange4            ctermfg=58   guifg=#5f5f00  "rgb=95,95,0
hi  x059_Grey37             ctermfg=59   guifg=#5f5f5f  "rgb=95,95,95
hi  x060_MediumPurple4      ctermfg=60   guifg=#5f5f87  "rgb=95,95,135
hi  x061_SlateBlue3         ctermfg=61   guifg=#5f5faf  "rgb=95,95,175
hi  x062_SlateBlue3         ctermfg=62   guifg=#5f5fd7  "rgb=95,95,215
hi  x063_RoyalBlue1         ctermfg=63   guifg=#5f5fff  "rgb=95,95,255
hi  x064_Chartreuse4        ctermfg=64   guifg=#5f8700  "rgb=95,135,0
hi  x065_DarkSeaGreen4      ctermfg=65   guifg=#5f875f  "rgb=95,135,95
hi  x066_PaleTurquoise4     ctermfg=66   guifg=#5f8787  "rgb=95,135,135
hi  x067_SteelBlue          ctermfg=67   guifg=#5f87af  "rgb=95,135,175
hi  x068_SteelBlue3         ctermfg=68   guifg=#5f87d7  "rgb=95,135,215
hi  x069_CornflowerBlue     ctermfg=69   guifg=#5f87ff  "rgb=95,135,255
hi  x070_Chartreuse3        ctermfg=70   guifg=#5faf00  "rgb=95,175,0
hi  x071_DarkSeaGreen4      ctermfg=71   guifg=#5faf5f  "rgb=95,175,95
hi  x072_CadetBlue          ctermfg=72   guifg=#5faf87  "rgb=95,175,135
hi  x073_CadetBlue          ctermfg=73   guifg=#5fafaf  "rgb=95,175,175
hi  x074_SkyBlue3           ctermfg=74   guifg=#5fafd7  "rgb=95,175,215
hi  x075_SteelBlue1         ctermfg=75   guifg=#5fafff  "rgb=95,175,255
hi  x076_Chartreuse3        ctermfg=76   guifg=#5fd700  "rgb=95,215,0
hi  x077_PaleGreen3         ctermfg=77   guifg=#5fd75f  "rgb=95,215,95
hi  x078_SeaGreen3          ctermfg=78   guifg=#5fd787  "rgb=95,215,135
hi  x079_Aquamarine3        ctermfg=79   guifg=#5fd7af  "rgb=95,215,175
hi  x080_MediumTurquoise    ctermfg=80   guifg=#5fd7d7  "rgb=95,215,215
hi  x081_SteelBlue1         ctermfg=81   guifg=#5fd7ff  "rgb=95,215,255
hi  x082_Chartreuse2        ctermfg=82   guifg=#5fff00  "rgb=95,255,0
hi  x083_SeaGreen2          ctermfg=83   guifg=#5fff5f  "rgb=95,255,95
hi  x084_SeaGreen1          ctermfg=84   guifg=#5fff87  "rgb=95,255,135
hi  x085_SeaGreen1          ctermfg=85   guifg=#5fffaf  "rgb=95,255,175
hi  x086_Aquamarine1        ctermfg=86   guifg=#5fffd7  "rgb=95,255,215
hi  x087_DarkSlateGray2     ctermfg=87   guifg=#5fffff  "rgb=95,255,255
hi  x088_DarkRed            ctermfg=88   guifg=#870000  "rgb=135,0,0
hi  x089_DeepPink4          ctermfg=89   guifg=#87005f  "rgb=135,0,95
hi  x090_DarkMagenta        ctermfg=90   guifg=#870087  "rgb=135,0,135
hi  x091_DarkMagenta        ctermfg=91   guifg=#8700af  "rgb=135,0,175
hi  x092_DarkViolet         ctermfg=92   guifg=#8700d7  "rgb=135,0,215
hi  x093_Purple             ctermfg=93   guifg=#8700ff  "rgb=135,0,255
hi  x094_Orange4            ctermfg=94   guifg=#875f00  "rgb=135,95,0
hi  x095_LightPink4         ctermfg=95   guifg=#875f5f  "rgb=135,95,95
hi  x096_Plum4              ctermfg=96   guifg=#875f87  "rgb=135,95,135
hi  x097_MediumPurple3      ctermfg=97   guifg=#875faf  "rgb=135,95,175
hi  x098_MediumPurple3      ctermfg=98   guifg=#875fd7  "rgb=135,95,215
hi  x099_SlateBlue1         ctermfg=99   guifg=#875fff  "rgb=135,95,255
hi  x100_Yellow4            ctermfg=100  guifg=#878700  "rgb=135,135,0
hi  x101_Wheat4             ctermfg=101  guifg=#87875f  "rgb=135,135,95
hi  x102_Grey53             ctermfg=102  guifg=#878787  "rgb=135,135,135
hi  x103_LightSlateGrey     ctermfg=103  guifg=#8787af  "rgb=135,135,175
hi  x104_MediumPurple       ctermfg=104  guifg=#8787d7  "rgb=135,135,215
hi  x105_LightSlateBlue     ctermfg=105  guifg=#8787ff  "rgb=135,135,255
hi  x106_Yellow4            ctermfg=106  guifg=#87af00  "rgb=135,175,0
hi  x107_DarkOliveGreen3    ctermfg=107  guifg=#87af5f  "rgb=135,175,95
hi  x108_DarkSeaGreen       ctermfg=108  guifg=#87af87  "rgb=135,175,135
hi  x109_LightSkyBlue3      ctermfg=109  guifg=#87afaf  "rgb=135,175,175
hi  x110_LightSkyBlue3      ctermfg=110  guifg=#87afd7  "rgb=135,175,215
hi  x111_SkyBlue2           ctermfg=111  guifg=#87afff  "rgb=135,175,255
hi  x112_Chartreuse2        ctermfg=112  guifg=#87d700  "rgb=135,215,0
hi  x113_DarkOliveGreen3    ctermfg=113  guifg=#87d75f  "rgb=135,215,95
hi  x114_PaleGreen3         ctermfg=114  guifg=#87d787  "rgb=135,215,135
hi  x115_DarkSeaGreen3      ctermfg=115  guifg=#87d7af  "rgb=135,215,175
hi  x116_DarkSlateGray3     ctermfg=116  guifg=#87d7d7  "rgb=135,215,215
hi  x117_SkyBlue1           ctermfg=117  guifg=#87d7ff  "rgb=135,215,255
hi  x118_Chartreuse1        ctermfg=118  guifg=#87ff00  "rgb=135,255,0
hi  x119_LightGreen         ctermfg=119  guifg=#87ff5f  "rgb=135,255,95
hi  x120_LightGreen         ctermfg=120  guifg=#87ff87  "rgb=135,255,135
hi  x121_PaleGreen1         ctermfg=121  guifg=#87ffaf  "rgb=135,255,175
hi  x122_Aquamarine1        ctermfg=122  guifg=#87ffd7  "rgb=135,255,215
hi  x123_DarkSlateGray1     ctermfg=123  guifg=#87ffff  "rgb=135,255,255
hi  x124_Red3               ctermfg=124  guifg=#af0000  "rgb=175,0,0
hi  x125_DeepPink4          ctermfg=125  guifg=#af005f  "rgb=175,0,95
hi  x126_MediumVioletRed    ctermfg=126  guifg=#af0087  "rgb=175,0,135
hi  x127_Magenta3           ctermfg=127  guifg=#af00af  "rgb=175,0,175
hi  x128_DarkViolet         ctermfg=128  guifg=#af00d7  "rgb=175,0,215
hi  x129_Purple             ctermfg=129  guifg=#af00ff  "rgb=175,0,255
hi  x130_DarkOrange3        ctermfg=130  guifg=#af5f00  "rgb=175,95,0
hi  x131_IndianRed          ctermfg=131  guifg=#af5f5f  "rgb=175,95,95
hi  x132_HotPink3           ctermfg=132  guifg=#af5f87  "rgb=175,95,135
hi  x133_MediumOrchid3      ctermfg=133  guifg=#af5faf  "rgb=175,95,175
hi  x134_MediumOrchid       ctermfg=134  guifg=#af5fd7  "rgb=175,95,215
hi  x135_MediumPurple2      ctermfg=135  guifg=#af5fff  "rgb=175,95,255
hi  x136_DarkGoldenrod      ctermfg=136  guifg=#af8700  "rgb=175,135,0
hi  x137_LightSalmon3       ctermfg=137  guifg=#af875f  "rgb=175,135,95
hi  x138_RosyBrown          ctermfg=138  guifg=#af8787  "rgb=175,135,135
hi  x139_Grey63             ctermfg=139  guifg=#af87af  "rgb=175,135,175
hi  x140_MediumPurple2      ctermfg=140  guifg=#af87d7  "rgb=175,135,215
hi  x141_MediumPurple1      ctermfg=141  guifg=#af87ff  "rgb=175,135,255
hi  x142_Gold3              ctermfg=142  guifg=#afaf00  "rgb=175,175,0
hi  x143_DarkKhaki          ctermfg=143  guifg=#afaf5f  "rgb=175,175,95
hi  x144_NavajoWhite3       ctermfg=144  guifg=#afaf87  "rgb=175,175,135
hi  x145_Grey69             ctermfg=145  guifg=#afafaf  "rgb=175,175,175
hi  x146_LightSteelBlue3    ctermfg=146  guifg=#afafd7  "rgb=175,175,215
hi  x147_LightSteelBlue     ctermfg=147  guifg=#afafff  "rgb=175,175,255
hi  x148_Yellow3            ctermfg=148  guifg=#afd700  "rgb=175,215,0
hi  x149_DarkOliveGreen3    ctermfg=149  guifg=#afd75f  "rgb=175,215,95
hi  x150_DarkSeaGreen3      ctermfg=150  guifg=#afd787  "rgb=175,215,135
hi  x151_DarkSeaGreen2      ctermfg=151  guifg=#afd7af  "rgb=175,215,175
hi  x152_LightCyan3         ctermfg=152  guifg=#afd7d7  "rgb=175,215,215
hi  x153_LightSkyBlue1      ctermfg=153  guifg=#afd7ff  "rgb=175,215,255
hi  x154_GreenYellow        ctermfg=154  guifg=#afff00  "rgb=175,255,0
hi  x155_DarkOliveGreen2    ctermfg=155  guifg=#afff5f  "rgb=175,255,95
hi  x156_PaleGreen1         ctermfg=156  guifg=#afff87  "rgb=175,255,135
hi  x157_DarkSeaGreen2      ctermfg=157  guifg=#afffaf  "rgb=175,255,175
hi  x158_DarkSeaGreen1      ctermfg=158  guifg=#afffd7  "rgb=175,255,215
hi  x159_PaleTurquoise1     ctermfg=159  guifg=#afffff  "rgb=175,255,255
hi  x160_Red3               ctermfg=160  guifg=#d70000  "rgb=215,0,0
hi  x161_DeepPink3          ctermfg=161  guifg=#d7005f  "rgb=215,0,95
hi  x162_DeepPink3          ctermfg=162  guifg=#d70087  "rgb=215,0,135
hi  x163_Magenta3           ctermfg=163  guifg=#d700af  "rgb=215,0,175
hi  x164_Magenta3           ctermfg=164  guifg=#d700d7  "rgb=215,0,215
hi  x165_Magenta2           ctermfg=165  guifg=#d700ff  "rgb=215,0,255
hi  x166_DarkOrange3        ctermfg=166  guifg=#d75f00  "rgb=215,95,0
hi  x167_IndianRed          ctermfg=167  guifg=#d75f5f  "rgb=215,95,95
hi  x168_HotPink3           ctermfg=168  guifg=#d75f87  "rgb=215,95,135
hi  x169_HotPink2           ctermfg=169  guifg=#d75faf  "rgb=215,95,175
hi  x170_Orchid             ctermfg=170  guifg=#d75fd7  "rgb=215,95,215
hi  x171_MediumOrchid1      ctermfg=171  guifg=#d75fff  "rgb=215,95,255
hi  x172_Orange3            ctermfg=172  guifg=#d78700  "rgb=215,135,0
hi  x173_LightSalmon3       ctermfg=173  guifg=#d7875f  "rgb=215,135,95
hi  x174_LightPink3         ctermfg=174  guifg=#d78787  "rgb=215,135,135
hi  x175_Pink3              ctermfg=175  guifg=#d787af  "rgb=215,135,175
hi  x176_Plum3              ctermfg=176  guifg=#d787d7  "rgb=215,135,215
hi  x177_Violet             ctermfg=177  guifg=#d787ff  "rgb=215,135,255
hi  x178_Gold3              ctermfg=178  guifg=#d7af00  "rgb=215,175,0
hi  x179_LightGoldenrod3    ctermfg=179  guifg=#d7af5f  "rgb=215,175,95
hi  x180_Tan                ctermfg=180  guifg=#d7af87  "rgb=215,175,135
hi  x181_MistyRose3         ctermfg=181  guifg=#d7afaf  "rgb=215,175,175
hi  x182_Thistle3           ctermfg=182  guifg=#d7afd7  "rgb=215,175,215
hi  x183_Plum2              ctermfg=183  guifg=#d7afff  "rgb=215,175,255
hi  x184_Yellow3            ctermfg=184  guifg=#d7d700  "rgb=215,215,0
hi  x185_Khaki3             ctermfg=185  guifg=#d7d75f  "rgb=215,215,95
hi  x186_LightGoldenrod2    ctermfg=186  guifg=#d7d787  "rgb=215,215,135
hi  x187_LightYellow3       ctermfg=187  guifg=#d7d7af  "rgb=215,215,175
hi  x188_Grey84             ctermfg=188  guifg=#d7d7d7  "rgb=215,215,215
hi  x189_LightSteelBlue1    ctermfg=189  guifg=#d7d7ff  "rgb=215,215,255
hi  x190_Yellow2            ctermfg=190  guifg=#d7ff00  "rgb=215,255,0
hi  x191_DarkOliveGreen1    ctermfg=191  guifg=#d7ff5f  "rgb=215,255,95
hi  x192_DarkOliveGreen1    ctermfg=192  guifg=#d7ff87  "rgb=215,255,135
hi  x193_DarkSeaGreen1      ctermfg=193  guifg=#d7ffaf  "rgb=215,255,175
hi  x194_Honeydew2          ctermfg=194  guifg=#d7ffd7  "rgb=215,255,215
hi  x195_LightCyan1         ctermfg=195  guifg=#d7ffff  "rgb=215,255,255
hi  x196_Red1               ctermfg=196  guifg=#ff0000  "rgb=255,0,0
hi  x197_DeepPink2          ctermfg=197  guifg=#ff005f  "rgb=255,0,95
hi  x198_DeepPink1          ctermfg=198  guifg=#ff0087  "rgb=255,0,135
hi  x199_DeepPink1          ctermfg=199  guifg=#ff00af  "rgb=255,0,175
hi  x200_Magenta2           ctermfg=200  guifg=#ff00d7  "rgb=255,0,215
hi  x201_Magenta1           ctermfg=201  guifg=#ff00ff  "rgb=255,0,255
hi  x202_OrangeRed1         ctermfg=202  guifg=#ff5f00  "rgb=255,95,0
hi  x203_IndianRed1         ctermfg=203  guifg=#ff5f5f  "rgb=255,95,95
hi  x204_IndianRed1         ctermfg=204  guifg=#ff5f87  "rgb=255,95,135
hi  x205_HotPink            ctermfg=205  guifg=#ff5faf  "rgb=255,95,175
hi  x206_HotPink            ctermfg=206  guifg=#ff5fd7  "rgb=255,95,215
hi  x207_MediumOrchid1      ctermfg=207  guifg=#ff5fff  "rgb=255,95,255
hi  x208_DarkOrange         ctermfg=208  guifg=#ff8700  "rgb=255,135,0
hi  x209_Salmon1            ctermfg=209  guifg=#ff875f  "rgb=255,135,95
hi  x210_LightCoral         ctermfg=210  guifg=#ff8787  "rgb=255,135,135
hi  x211_PaleVioletRed1     ctermfg=211  guifg=#ff87af  "rgb=255,135,175
hi  x212_Orchid2            ctermfg=212  guifg=#ff87d7  "rgb=255,135,215
hi  x213_Orchid1            ctermfg=213  guifg=#ff87ff  "rgb=255,135,255
hi  x214_Orange1            ctermfg=214  guifg=#ffaf00  "rgb=255,175,0
hi  x215_SandyBrown         ctermfg=215  guifg=#ffaf5f  "rgb=255,175,95
hi  x216_LightSalmon1       ctermfg=216  guifg=#ffaf87  "rgb=255,175,135
hi  x217_LightPink1         ctermfg=217  guifg=#ffafaf  "rgb=255,175,175
hi  x218_Pink1              ctermfg=218  guifg=#ffafd7  "rgb=255,175,215
hi  x219_Plum1              ctermfg=219  guifg=#ffafff  "rgb=255,175,255
hi  x220_Gold1              ctermfg=220  guifg=#ffd700  "rgb=255,215,0
hi  x221_LightGoldenrod2    ctermfg=221  guifg=#ffd75f  "rgb=255,215,95
hi  x222_LightGoldenrod2    ctermfg=222  guifg=#ffd787  "rgb=255,215,135
hi  x223_NavajoWhite1       ctermfg=223  guifg=#ffd7af  "rgb=255,215,175
hi  x224_MistyRose1         ctermfg=224  guifg=#ffd7d7  "rgb=255,215,215
hi  x225_Thistle1           ctermfg=225  guifg=#ffd7ff  "rgb=255,215,255
hi  x226_Yellow1            ctermfg=226  guifg=#ffff00  "rgb=255,255,0
hi  x227_LightGoldenrod1    ctermfg=227  guifg=#ffff5f  "rgb=255,255,95
hi  x228_Khaki1             ctermfg=228  guifg=#ffff87  "rgb=255,255,135
hi  x229_Wheat1             ctermfg=229  guifg=#ffffaf  "rgb=255,255,175
hi  x230_Cornsilk1          ctermfg=230  guifg=#ffffd7  "rgb=255,255,215
hi  x231_Grey100            ctermfg=231  guifg=#ffffff  "rgb=255,255,255
hi  x232_Grey3              ctermfg=232  guifg=#080808  "rgb=8,8,8
hi  x233_Grey7              ctermfg=233  guifg=#121212  "rgb=18,18,18
hi  x234_Grey11             ctermfg=234  guifg=#1c1c1c  "rgb=28,28,28
hi  x235_Grey15             ctermfg=235  guifg=#262626  "rgb=38,38,38
hi  x236_Grey19             ctermfg=236  guifg=#303030  "rgb=48,48,48
hi  x237_Grey23             ctermfg=237  guifg=#3a3a3a  "rgb=58,58,58
hi  x238_Grey27             ctermfg=238  guifg=#444444  "rgb=68,68,68
hi  x239_Grey30             ctermfg=239  guifg=#4e4e4e  "rgb=78,78,78
hi  x240_Grey35             ctermfg=240  guifg=#585858  "rgb=88,88,88
hi  x241_Grey39             ctermfg=241  guifg=#626262  "rgb=98,98,98
hi  x242_Grey42             ctermfg=242  guifg=#6c6c6c  "rgb=108,108,108
hi  x243_Grey46             ctermfg=243  guifg=#767676  "rgb=118,118,118
hi  x244_Grey50             ctermfg=244  guifg=#808080  "rgb=128,128,128
hi  x245_Grey54             ctermfg=245  guifg=#8a8a8a  "rgb=138,138,138
hi  x246_Grey58             ctermfg=246  guifg=#949494  "rgb=148,148,148
hi  x247_Grey62             ctermfg=247  guifg=#9e9e9e  "rgb=158,158,158
hi  x248_Grey66             ctermfg=248  guifg=#a8a8a8  "rgb=168,168,168
hi  x249_Grey70             ctermfg=249  guifg=#b2b2b2  "rgb=178,178,178
hi  x250_Grey74             ctermfg=250  guifg=#bcbcbc  "rgb=188,188,188
hi  x251_Grey78             ctermfg=251  guifg=#c6c6c6  "rgb=198,198,198
hi  x252_Grey82             ctermfg=252  guifg=#d0d0d0  "rgb=208,208,208
hi  x253_Grey85             ctermfg=253  guifg=#dadada  "rgb=218,218,218
hi  x254_Grey89             ctermfg=254  guifg=#e4e4e4  "rgb=228,228,228
hi  x255_Grey93             ctermfg=255  guifg=#eeeeee  "rgb=238,238,238
" }}}

" COLORS {{{
" set termguicolors
set antialias " if this file will ever be used by gvim, ANTIALIAS the font
" colorscheme elflord
if &term == "screen"
  set t_Co=256
endif

augroup color_scheme
    autocmd!
    autocmd ColorScheme * set bg=dark " set a color scheme optimized for the specified BackGround color
    autocmd ColorScheme * set cursorcolumn " highlight current CURSOR COLUMN
    autocmd ColorScheme * set cursorline " highlight current CURSOR LINE
    autocmd ColorScheme * highlight CursorLine term=underline cterm=NONE " ctermbg=Black guibg=Black
    autocmd ColorScheme * highlight CursorLineNR term=underline cterm=NONE ctermbg=Black guibg=Black
    autocmd ColorScheme * highlight CursorColumn term=underline cterm=NONE " ctermbg=Black guibg=Black
    autocmd ColorScheme * highlight LineNr term=NONE cterm=NONE ctermbg=Black guibg=Black
    autocmd ColorScheme * highlight SignColumn term=underline cterm=NONE ctermbg=Black guibg=Black
    autocmd ColorScheme * highlight NonText term=italic cterm=italic ctermfg=DarkGray guifg=DarkGray
augroup END
colorscheme xoria256 " torte darcula
" set lazyredraw " redraw the screen after a macro/register/cmd ends
" }}}

" INFO LINE {{{
set laststatus=2 " how long the STATUS line must be displayed (2=LASTs forever)
set report=0 " always (min value=0) REPORT the quanity of lines affected by the last command
set ruler " show the info bar (a.k.a. RULER) in bottom row of the window
" set rulerformat= " FORMAT of the RULER bar
" set statusline=buf#%n\ %F%M%Y%R%H%W%=\ pos:%o\ ascii:%b\ hex:0x%B\ row:%l/%L\ col:%c%V\ percent:%p%% " show the specified info in the STATUS LINE
set showcmd " SHOW the CoMmanD we are typing on the bottom line
set showmode " SHOW the MODE we are on
" }}}

" BUFFERS {{{
set autochdir " the current DIR in the OS is AUTO CHanged to match the current window's buffer
set hidden " HIDDEN (:hide) buffers won't be unloaded
" set noswapfile " don't create a backup .swp file
" }}}

" ENCODING & FILESYSTEM {{{
set encoding=utf-8 " default ENCODING for reading a text file
set fileencoding=utf-8 " default ENCODING for writing a text FILE
set fileformat=unix " set the textFILE newline FORMAT to <NL> 
" }}}

" ERROR BELLS {{{
set errorbells " BELL as ERROR message
set visualbell " use a VISUAL BELL instead of beeping
" }}}

" WILDMENU {{{
set wildchar=<Tab> " what CHAR opens the WILD menu?
set wildmenu " when WILD char (<Tab>) is pressed a graphical menu opens to show items
set wildignore=*.docx,*.jpg,*.png,*.gif,*.pdf,*.pyc,*.exe,*.flv,*.img,*.xlsx " ignore files with these extensions
set wildmode=full " WILD menu MODE: always open
" }}}

" AUTOCOMPLETION {{{
" set omnifunc=syntaxcomplete#Complete " enable OMNIcompletion with complete syntax FUNCTION
set omnifunc=ale#completion#OmniFunc " use the A.L.E. plugin for ^X^O
" }}}

" ROW NUMBERING {{{
set number " show row NUMBERs on the left side of the screen
set numberwidth=4 " allocate 4-columns WIDTH for the row numbers
set relativenumber " show the row number of the cursor line and the RELATIVE distance of each other shown line
" }}}

" LINE WRAPPING {{{
set wrapscan " search wraps at top from bottom
set wrap " lines longer than screen width will be WRAPped, enabling some z· and g· commands
set wrapmargin=0 " how many columns dows the MARGIN of WRAPped lines span? 
"  b    <BS>	 Normal and Visual
"  s    <Space>	 Normal and Visual
"  h    "h"	 Normal and Visual (not recommended)
"  l    "l"	 Normal and Visual (not recommended)
"  <    <Left>	 Normal and Visual
"  >    <Right>	 Normal and Visual
"  ~    "~"	 Normal
"  [    <Left>	 Insert and Replace
"  ]    <Right>	 Insert and Replace
set whichwrap=b,s ",<,>,[,] " WHICH right/left keys may move to the next/prev WRAPped line?
" }}}

" FOLDING {{{
set foldmethod=marker " FOLDing METHOD (logic)
set foldlevel=0 " FOLDS with a higher LEVEL will be closed.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" EXTRA SPACES {{{
augroup BadWhitespace
	highlight BadWhitespace term=undercurl,reverse ctermfg=White ctermbg=Red guifg=White guibg=Red
	autocmd BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
augroup END
" }}}

" PROGRAMMING LANGUAGES: INDENTATION & TABS {{{
	set autoindent " the INDENT of a new line will be AUTOmatically copied from the current line's one
	set shiftround " SHIFT commands will ROUND indent to multiple of 'shiftwidth'
	set smartindent " try to SMARTly detect when and where to INDENT new text
	set smarttab " when on, a <Tab> in front of a line inserts blanks according to 'shiftwidth
                 " when off, a <Tab> always inserts blanks according to 'tabstop' or 'softtabstop'

augroup tab_python
	autocmd!
	autocmd BufNewFile,BufRead *.py set textwidth=80 " linewidth is 80 chars, we respect you PEP8
	autocmd BufNewFile,BufRead *.py set expandtab " EXPAND TABs into spaces
	autocmd BufNewFile,BufRead *.py set shiftwidth=4 " SHIFT commands WIDTH in columns
	autocmd BufNewFile,BufRead *.py set softtabstop=4 " how may spaces are insert when <Tab> is pressed
	autocmd BufNewFile,BufRead *.py set tabstop=4 " number of spaces that a <Tab> in the file counts for
	packadd! SimpylFold
	packadd! indent_python
	let python_highlight_all=1
	" python with virtualenv support
	python3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
augroup END

augroup tab_javascript
	autocmd!
	autocmd BufNewFile,BufRead *.html *.js *.css set expandtab " EXPAND TABs into spaces
	autocmd BufNewFile,BufRead *.html *.js *.css set shiftwidth=2 " SHIFT commands WIDTH in columns
	autocmd BufNewFile,BufRead *.html *.js *.css set softtabstop=2 " how may spaces are insert when <Tab> is pressed
	autocmd BufNewFile,BufRead *.html *.js *.css set tabstop=2 " number of spaces that a <Tab> in the file counts for
augroup END
" }}}

" SEARCH {{{
set hlsearch " HighLight matching patterns during SEARCH commands
set ignorecase " IGNORE the CASE of search patterns
set incsearch " search INCrementally while the user is typing
set list " LIST mode: show tabs and eol ($)
set listchars=eol:$,tab:‹·›,trail:·,extends:›,precedes:‹,nbsp:×
set showbreak=+++ 
set smartcase " SMART search: if the search pattern contains upperCASE letters, the search becomes case sensitive
nnoremap n nzz
nnoremap N Nzz
" }}}

" CTRL-A & CTRL-X {{{
set nrformats=alpha,bin,octal,hex " NumbeRFORMATS recogninzed by CTRL-X and CTRL-A
" }}}

" YANK & PUT {{{
set pastetoggle=<Leader>p
" set selectmode=cmd,key,mouse " how SELECT MODE can be activated
nnoremap Y y$
" }}}

" TOKEN MATCHING {{{
set matchtime=5 " Tenths of seconds to show matching peer
set matchpairs=(:),[:],{:},«:»,<:>,‹:› " Characters that form pairs
set showmatch " Briefly jump to the matching bracket
" }}}

" WINDOWS {{{
set splitright
set splitbelow
" }}}

" TABS {{{
nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>
" }}}

" INSERT MODE {{{
"   <BS>, <Del>, CTRL-W, CTRL-U
"   indent  allow backspacing over autoindent
"   eol  _  allow backspacing over line breaks (join lines)
"   start   allow backspacing over the start of insert; CTRL-W and CTRL-U
"           stop once at the start of insert.
set backspace=
" }}}

" .vimrc {{{
autocmd BufWritePost .vimrc source %
nnoremap <leader>ev :edit ~/.vim/vimrc<cr>
nnoremap <leader>sv :source ~/.vim/vimrc<cr>
" }}}

" HELP {{{
augroup filetype_help
    autocmd!
    autocmd BufWinEnter * if &l:buftype ==# 'help' | setlocal nolist | endif
augroup END
" }}}

" ABBR {{{
abbr @@ massimiliano.dellarovere@gmail.com
" }}}

" NetRW {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/ ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:netrw_keepdir = 0
let g:netrw_winsize = 25
let g:netrw_banner = 0
let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
let g:netrw_localcopydircmd = 'cp -r'
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1

highlight! link netrwMarkFile Search

" augroup ProjectDrawer
  " autocmd!
  " autocmd VimEnter * :Vexplore
" augroup END

nnoremap <leader>dd :Lexplore %:p:h<CR>
nnoremap <Leader>da :Lexplore<CR>

function! NetrwMapping()
  nmap <buffer> H u
  nmap <buffer> h -^
  nmap <buffer> l <CR>

  nmap <buffer> . gh
  nmap <buffer> P <C-w>z

  nmap <buffer> L <CR>:Lexplore<CR>
  nmap <buffer> <Leader>dd :Lexplore<CR>

  nmap <buffer> <TAB> mf
  nmap <buffer> <S-TAB> mF
  nmap <buffer> <Leader><TAB> mu

  nmap <buffer> ff %:w<CR>:buffer #<CR>
  nmap <buffer> fe R
  nmap <buffer> fc mc
  nmap <buffer> fC mtmc
  nmap <buffer> fx mm
  nmap <buffer> fX mtmm
  nmap <buffer> f; mx

  nmap <buffer> fl :echo join(netrw#Expose("netrwmarkfilelist"), "\n")<CR>

  nmap <buffer> fq :echo 'Target:' . netrw#Expose("netrwmftgt")<CR>

  nmap <buffer> fd mtfq

  nmap <buffer> bb mb
  nmap <buffer> bd mB
  nmap <buffer> bl gb

  function! NetrwRemoveRecursive()
    if &filetype ==# 'netrw'
      cnoremap <buffer> <CR> rm -r<CR>
      normal mu
      normal mf

      try
        normal mx
      catch
        echo "Canceled"
      endtry

      cunmap <buffer> <CR>
    endif
  endfunction

  nmap <buffer> FF :call NetrwRemoveRecursive()<CR>
endfunction

augroup netrw_mapping
  autocmd!
  autocmd filetype netrw call NetrwMapping()
augroup END
" }}}

" MAP {{{
    nnoremap <space> za
    nnoremap Y y$
" }}}

" COLORSCHEME: gruvbox8 - lifepillar/vim-gruvbox8 {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/lifepillar/vim-gruvbox8 ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" ggreer/the_silver_searcher {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/ggreer/the_silver_searcher ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" ekalinin/Dockerfile.vim {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/ekalinin/Dockerfile.vim ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" junegunn/fzf {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/junegunn/fzf ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" junegunn/fzf.vim {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/junegunn/fzf.vim ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" " [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
" let g:fzf_tags_command = 'ctags -R'
" see ~/.ctags

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'
" }}}

" BurntSushi/ripgrep {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/BurntSushi/ripgrep ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" mcsween/indent_python {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://www.vim.org/scripts/script.php?script_id=974 ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" tpope/vim-dadbod {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/tpope/vim-dadbod ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~
" }}}
"
"  tpope/vim-surround {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/tpope/vim-surround ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~
" }}}

" tpope/vim-vinegar {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/tpope/vim-vinegar ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" ycm-core/YouCompleteMe {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/ycm-core/YouCompleteMe#python-semantic-completion ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" create .ycm_extra_conf.py file at the root of your project with the following contents:

" def Settings(**kwargs):
"     return {
"         "interpreter_path": "/path/to/virtual/environment/python"
"     }
" }}}

" dense-analysis/ale {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/dense-analysis/ale ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:ale_sign_column_always = 1 " always show sign (error/warning) column
let g:airline#extensions#ale#enabled = 1 " show errors or warnings in my statusline
let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']

" navigate errors/warning
:nnoremap ]a :ALENextWrap<CR>
:nnoremap [a :ALEPreviousWrap<CR>
:nnoremap ]A :ALELast
:nnoremap [A :ALEFirst

" :help ale-lint-other-machines
" }}}

" preservim/nerdtree {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/preservim/nerdtree ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" autocmd VimEnter * NERDTree | wincmd p " Start NERDTree and put the cursor back in the other window

" Start NERDTree when Vim is started without file arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 | let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Open the existing NERDTree on each new tab
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" Exit Vim if NERDTree is the only window remaining in the only tab
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Close the tab if NERDTree is the only window remaining in it.
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Function to open the file or NERDTree or netrw
"   Returns: 1 if either file explorer was opened; otherwise, 0
function! s:OpenFileOrExplorer(...)
    if a:0 == 0 || a:1 == ''
        NERDTree
    elseif filereadable(a:1)
        execute 'edit '.a:1
        return 0
    elseif a:1 =~? '^\(scp\|ftp\)://' " Add other protocols as needed
        execute 'Vexplore '.a:1
    elseif isdirectory(a:1)
        execute 'NERDTree '.a:1
    endif
    return 1
endfunction

" Auto commands to handle OS commandline arguments
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc()==1 && !exists('s:std_in') | if <SID>OpenFileOrExplorer(argv()[0]) | wincmd p | enew | wincmd p | endif | endif

" Command to call the OpenFileOrExplorer function.
command! -n=? -complete=file -bar Edit :call <SID>OpenFileOrExplorer('<args>')

" Command-mode abbreviation to replace the :edit Vim command.
cnoreabbrev e Edit

" http://vimcasts.org/blog/2013/01/oil-and-vinegar-split-windows-and-project-drawer/
let NERDTreeHijackNetrw=1
" }}}

" Xyuyanp/nerdtree-git-plugin {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/Xuyuanp/nerdtree-git-plugin ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself
let g:NERDTreeGitStatusShowIgnored = 1 " a heavy feature may cost much more time
let g:NERDTreeGitStatusUntrackedFilesMode = 'all' " a heavy feature too
let g:NERDTreeGitStatusShowClean = 1 " show the 'clean' indicator
" }}}

" ryanoasis/vim-devicons {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/ryanoasis/vim-devicons ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" tiagofumo/vim-nerdtree-syntax-highlight {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/tiagofumo/vim-nerdtree-syntax-highlight ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" tmhedberg/SimplyFold {{{
" python specific-folding
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/tmhedberg/SimpylFold ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" valloric/MatchTagAlways {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/Valloric/MatchTagAlways ~
" ~ ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" mattn/emmet-vim {{{
" ######################################
" # https://github.com/mattn/emmet-vim #
" ######################################
let g:user_emmet_leader_key='<C-Z>'
" }}}

" kshenoy/vim-signature {{{
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" ~ https://github.com/kshenoy/vim-signature ~
" ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
" }}}

" PACKAGES {{{
" load all plugins now
" plugins need to be added to runtimepath before helptags can be generated
packloadall
" load all of the helptags now, after plugins have been loaded
" all messages and errors will be ignored
silent! helptags ++t all

let g:airline#extensions#ale#enabled = 1 " integrate a.l.e. errors in the airline statusline
" }}}

