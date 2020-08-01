LIBRARY  IEEE; 
USE  IEEE.STD_LOGIC_1164.ALL; 
USE  IEEE.STD_LOGIC_ARITH.ALL; 
USE  IEEE.STD_LOGIC_UNSIGNED.ALL;
USE ieee.numeric_std.all;
use IEEE.MATH_REAL.ALL;
 
ENTITY color_rom_vhd  IS 
	PORT(
		clock : IN STD_LOGIC;
		PB2 : IN STD_LOGIC;
		PB1 : IN STD_LOGIC;
		LED1 : OUT STD_LOGIC_VECTOR (1 TO 7);
		LED2 : OUT STD_LOGIC_VECTOR (1 TO 7);
		LED3 : OUT STD_LOGIC_VECTOR (1 TO 7);
	    i_pixel_column  : IN STD_LOGIC_VECTOR( 9 DOWNTO 0 );
	    i_pixel_row     : IN STD_LOGIC_VECTOR( 9 DOWNTO 0 );
	    o_red           : OUT STD_LOGIC_VECTOR( 7 DOWNTO 0 );
	    o_green         : OUT STD_LOGIC_VECTOR( 7 DOWNTO 0 );
	    o_blue          : OUT STD_LOGIC_VECTOR( 7 DOWNTO 0 ));
END color_rom_vhd; 

ARCHITECTURE behavioral OF color_rom_vhd  IS 

CONSTANT NOL : STD_LOGIC_VECTOR(1 TO 7) := "0000001"; --1
CONSTANT SATU : STD_LOGIC_VECTOR(1 TO 7) := "1001111"; --49
CONSTANT DUA : STD_LOGIC_VECTOR(1 TO 7) := "0010010";
CONSTANT TIGA : STD_LOGIC_VECTOR(1 TO 7) := "0000110";
CONSTANT EMPAT : STD_LOGIC_VECTOR(1 TO 7) := "1001100";
CONSTANT LIMA : STD_LOGIC_VECTOR(1 TO 7) := "0100100";
CONSTANT ENAM : STD_LOGIC_VECTOR(1 TO 7) := "0100000";
CONSTANT TUJUH : STD_LOGIC_VECTOR(1 TO 7) := "0001111";
CONSTANT DELAPAN : STD_LOGIC_VECTOR(1 TO 7) := "0000000";
CONSTANT SEMBILAN : STD_LOGIC_VECTOR(1 TO 7) := "0000100";
CONSTANT GARIS : STD_LOGIC_VECTOR(1 TO 7) := "1111110";

BEGIN

PROCESS(clock, PB2, PB1, i_pixel_row,i_pixel_column)
	CONSTANT frekmax : integer := 2000000; --2 JUTA
	CONSTANT range_x : integer := 640;
	CONSTANT range_y : integer := 480;
	CONSTANT r : integer := 25;
	CONSTANT AWAL   : INTEGER := 0;
	CONSTANT UjungBawah   : INTEGER := 479;
	CONSTANT UjungKanan  : INTEGER := 639;
	
	VARIABLE countf : integer := 0; --menjadi penghitungan dalam mengatur kecepatan
	VARIABLE kondisi : integer := 1;
	VARIABLE detik : integer := 0;
	
	VARIABLE kotak_0_x : integer := 320; VARIABLE kotak_0_y : integer := 450;
	VARIABLE kotak_1_x : integer := 70; VARIABLE kotak_1_y : integer := -57;
	VARIABLE kotak_2_x : integer := 14; VARIABLE kotak_2_y : integer := -271;
	VARIABLE kotak_3_x : integer := 586; VARIABLE kotak_3_y : integer := -21;
	VARIABLE kotak_4_x : integer := 622; VARIABLE kotak_4_y : integer := -114;
	VARIABLE kotak_5_x : integer := 385; VARIABLE kotak_5_y : integer := -258;
	VARIABLE kotak_6_x : integer := 12; VARIABLE kotak_6_y : integer := -327;
	VARIABLE kotak_7_x : integer := 77; VARIABLE kotak_7_y : integer := -371;
	VARIABLE kotak_8_x : integer := 89; VARIABLE kotak_8_y : integer := -175;
	VARIABLE kotak_9_x : integer := 137; VARIABLE kotak_9_y : integer := -190;
	VARIABLE kotak_10_x : integer := 349; VARIABLE kotak_10_y : integer := -220;
	VARIABLE kotak_11_x : integer := 111; VARIABLE kotak_11_y : integer := -29;
	VARIABLE kotak_12_x : integer := 566; VARIABLE kotak_12_y : integer := -40;
	VARIABLE kotak_13_x : integer := 629; VARIABLE kotak_13_y : integer := 0;
	VARIABLE kotak_14_x : integer := 284; VARIABLE kotak_14_y : integer := -114;
	VARIABLE kotak_15_x : integer := 62; VARIABLE kotak_15_y : integer := -82;
	VARIABLE kotak_16_x : integer := 376; VARIABLE kotak_16_y : integer := -26;
	VARIABLE kotak_17_x : integer := 295; VARIABLE kotak_17_y : integer := -263;
	VARIABLE kotak_18_x : integer := 274; VARIABLE kotak_18_y : integer := -199;
	VARIABLE kotak_19_x : integer := 521; VARIABLE kotak_19_y : integer := -184;
	VARIABLE kotak_20_x : integer := 93; VARIABLE kotak_20_y : integer := -390;
	VARIABLE kotak_21_x : integer := 238; VARIABLE kotak_21_y : integer := -248;
	VARIABLE kotak_22_x : integer := 244; VARIABLE kotak_22_y : integer := -300;
	VARIABLE kotak_23_x : integer := 201; VARIABLE kotak_23_y : integer := -150;
	VARIABLE kotak_24_x : integer := 210; VARIABLE kotak_24_y : integer := -100;
	VARIABLE kotak_25_x : integer := 023; VARIABLE kotak_25_y : integer := -80;
	
BEGIN
	IF (clock'EVENT and clock='1') THEN
		IF (countf<frekmax) THEN --2 juta
			countf:= countf+1;
		ELSE
			countf := 0;
			detik := detik + 1;
			case kondisi IS
			WHEN 2 =>
				--background saat akhir
				IF ((i_pixel_column <= UjungKanan) AND (i_pixel_row < UjungBawah)) THEN
					o_red <= X"FF";
					o_green <= X"00";
					o_blue <= X"00";
				END IF;
			WHEN OTHERS => --kondisi bernilai 1
				-- 25 kotak akan terus bergeser ke bawah
				kotak_1_y := kotak_1_y + 2; kotak_2_y := kotak_2_y + 1;
				kotak_3_y := kotak_3_y + 1; kotak_4_y := kotak_4_y + 2;
				kotak_5_y := kotak_5_y + 3; kotak_6_y := kotak_6_y + 1;
				kotak_7_y := kotak_7_y + 1; kotak_8_y := kotak_8_y + 3;
				kotak_9_y := kotak_9_y + 1; kotak_10_y := kotak_10_y + 1;
				kotak_11_y := kotak_11_y + 3; kotak_12_y := kotak_12_y + 2;
				kotak_13_y := kotak_13_y + 1; kotak_14_y := kotak_14_y + 1;
				kotak_15_y := kotak_15_y + 1; kotak_16_y := kotak_16_y + 3;
				kotak_17_y := kotak_17_y + 2; kotak_18_y := kotak_18_y + 5;
				kotak_19_y := kotak_19_y + 1; kotak_20_y := kotak_20_y + 1;
				kotak_21_y := kotak_21_y + 2; kotak_22_y := kotak_22_y + 2;
				kotak_23_y := kotak_23_y + 1; kotak_24_y := kotak_24_y + 1;
				kotak_25_y := kotak_25_y + 1;

				--reset posisi kotak
				IF (kotak_1_y > 479) THEN kotak_1_x :=  7; kotak_1_y := -134; END IF;
				IF (kotak_2_y > 479) THEN kotak_2_x :=  379; kotak_2_y := -57;END IF;
				IF (kotak_3_y > 479) THEN kotak_3_x :=  81 ; kotak_3_y := -21;END IF;
				IF (kotak_4_y > 479) THEN kotak_4_x :=  181 ; kotak_4_y := -114;END IF;
				IF (kotak_5_y > 479) THEN kotak_5_x :=  419 ; kotak_5_y := -258;END IF;
				IF (kotak_6_y > 479) THEN kotak_6_x :=  261 ; kotak_6_y := -190;END IF;
				IF (kotak_7_y > 479) THEN kotak_7_x :=  66 ; kotak_7_y := -362;END IF;
				IF (kotak_8_y > 479) THEN kotak_8_x :=  187 ; kotak_8_y := -49;END IF;
				IF (kotak_9_y > 479) THEN kotak_9_x :=  532 ; kotak_9_y := -2;END IF;
				IF (kotak_10_y > 479) THEN kotak_10_x :=  373 ; kotak_10_y := -62;END IF;
				IF (kotak_11_y > 479) THEN kotak_11_x :=  575 ; kotak_11_y := -100;END IF;
				IF (kotak_12_y > 479) THEN kotak_12_x :=  255 ; kotak_12_y := -142;END IF;
				IF (kotak_13_y > 479) THEN kotak_13_x :=  280 ; kotak_13_y := -25;END IF;
				IF (kotak_14_y > 479) THEN kotak_14_x :=  561 ; kotak_14_y := -64;END IF;
				IF (kotak_15_y > 479) THEN kotak_15_x :=  455 ; kotak_15_y := -82;END IF;
				IF (kotak_16_y > 479) THEN kotak_16_x :=  584 ; kotak_16_y := -1;END IF;
				IF (kotak_17_y > 479) THEN kotak_17_x :=  307 ; kotak_17_y := -59;END IF;
				IF (kotak_18_y > 479) THEN kotak_18_x :=  262 ; kotak_18_y := -248;END IF;
				IF (kotak_19_y > 479) THEN kotak_19_x :=  416 ; kotak_19_y := -146;END IF;
				IF (kotak_20_y > 479) THEN kotak_20_x :=  586 ; kotak_20_y := -379;END IF;
				IF (kotak_21_y > 479) THEN kotak_21_x :=  114 ; kotak_21_y := -400;END IF;
				IF (kotak_22_y > 479) THEN kotak_22_x :=  21 ; kotak_22_y :=  -242;END IF;
				IF (kotak_23_y > 479) THEN kotak_23_x :=  371 ; kotak_23_y := -91;END IF;
				IF (kotak_24_y > 479) THEN kotak_24_x :=  57 ; kotak_24_y :=  -221;END IF;
				IF (kotak_25_y > 479) THEN kotak_25_x :=  134 ; kotak_25_y := -123;END IF;
				
				--apabila terjadi tabrakan
				IF ((ABS(kotak_1_x - kotak_0_x) <= 2*r) AND (kotak_0_y - kotak_1_y <= 2*r)) THEN kondisi := 2; END IF;
				IF ((ABS(kotak_2_x - kotak_0_x) <= 2*r) AND (kotak_0_y - kotak_2_y <= 2*r)) THEN kondisi := 2; END IF;
				IF ((ABS(kotak_3_x - kotak_0_x) <= 2*r) AND (kotak_0_y - kotak_3_y <= 2*r)) THEN kondisi := 2; END IF; 
				IF ((ABS(kotak_4_x - kotak_0_x) <= 2*r) AND (kotak_0_y - kotak_4_y <= 2*r)) THEN kondisi := 2; END IF; 
				IF ((ABS(kotak_5_x - kotak_0_x) <= 2*r) AND (kotak_0_y - kotak_5_y <= 2*r)) THEN kondisi := 2; END IF; 
				IF ((ABS(kotak_6_x - kotak_0_x) <= 2*r) AND (kotak_0_y - kotak_6_y <= 2*r)) THEN kondisi := 2; END IF; 
				IF ((ABS(kotak_7_x - kotak_0_x) <= 2*r) AND (kotak_0_y - kotak_7_y <= 2*r)) THEN kondisi := 2; END IF; 
				IF ((ABS(kotak_8_x - kotak_0_x) <= 2*r) AND (kotak_0_y - kotak_8_y <= 2*r)) THEN kondisi := 2; END IF; 
				IF ((ABS(kotak_9_x - kotak_0_x) <= 2*r) AND (kotak_0_y - kotak_9_y <= 2*r)) THEN kondisi := 2; END IF; 
				IF ((ABS(kotak_10_x - kotak_0_x) <= 2*r) AND (kotak_0_y - kotak_10_y <= 2*r)) THEN kondisi := 2; END IF;
				IF ((ABS(kotak_11_x - kotak_0_x) <= 2*r) AND (kotak_0_y - kotak_11_y <= 2*r)) THEN kondisi := 2; END IF;
				IF ((ABS(kotak_12_x - kotak_0_x) <= 2*r) AND (kotak_0_y - kotak_12_y <= 2*r)) THEN kondisi := 2; END IF;
				IF ((ABS(kotak_13_x - kotak_0_x) <= 2*r) AND (kotak_0_y - kotak_13_y <= 2*r)) THEN kondisi := 2; END IF;
				IF ((ABS(kotak_14_x - kotak_0_x) <= 2*r) AND (kotak_0_y - kotak_14_y <= 2*r)) THEN kondisi := 2; END IF;
				IF ((ABS(kotak_15_x - kotak_0_x) <= 2*r) AND (kotak_0_y - kotak_15_y <= 2*r)) THEN kondisi := 2; END IF;
				IF ((ABS(kotak_16_x - kotak_0_x) <= 2*r) AND (kotak_0_y - kotak_16_y <= 2*r)) THEN kondisi := 2; END IF;
				IF ((ABS(kotak_17_x - kotak_0_x) <= 2*r) AND (kotak_0_y - kotak_17_y <= 2*r)) THEN kondisi := 2; END IF;
				IF ((ABS(kotak_18_x - kotak_0_x) <= 2*r) AND (kotak_0_y - kotak_18_y <= 2*r)) THEN kondisi := 2; END IF;
				IF ((ABS(kotak_19_x - kotak_0_x) <= 2*r) AND (kotak_0_y - kotak_19_y <= 2*r)) THEN kondisi := 2; END IF;
				IF ((ABS(kotak_20_x - kotak_0_x) <= 2*r) AND (kotak_0_y - kotak_20_y <= 2*r)) THEN kondisi := 2; END IF;
				IF ((ABS(kotak_21_x - kotak_0_x) <= 2*r) AND (kotak_0_y - kotak_21_y <= 2*r)) THEN kondisi := 2; END IF;
				IF ((ABS(kotak_22_x - kotak_0_x) <= 2*r) AND (kotak_0_y - kotak_22_y <= 2*r)) THEN kondisi := 2; END IF;
				IF ((ABS(kotak_23_x - kotak_0_x) <= 2*r) AND (kotak_0_y - kotak_23_y <= 2*r)) THEN kondisi := 2; END IF;
				IF ((ABS(kotak_24_x - kotak_0_x) <= 2*r) AND (kotak_0_y - kotak_24_y <= 2*r)) THEN kondisi := 2; END IF;
				IF ((ABS(kotak_25_x - kotak_0_x) <= 2*r) AND (kotak_0_y - kotak_25_y <= 2*r)) THEN kondisi := 2; END IF;
				
				--pergerakan kotak_0
				IF (PB2 = '0') THEN
					kotak_0_x := kotak_0_x + 3;
				END IF;
				IF (PB1 = '0') THEN
					kotak_0_x := kotak_0_x -3;
				END IF;	
				
				--pewarnaan led 7segment
				IF ((detik / 100) mod 10 = 0) THEN LED1<= NOL; END IF;
				IF ((detik / 100) mod 10 = 1) THEN LED1<= SATU; END IF;
				IF ((detik / 100) mod 10 = 2) THEN LED1<= DUA; END IF;
				IF ((detik / 100) mod 10 = 3) THEN LED1<= TIGA; END IF;
				IF ((detik / 100) mod 10 = 4) THEN LED1<= EMPAT; END IF;
				IF ((detik / 100) mod 10 = 5) THEN LED1<= LIMA; END IF;
				IF ((detik / 100) mod 10 = 6) THEN LED1<= ENAM; END IF;
				IF ((detik / 100) mod 10 = 7) THEN LED1<= TUJUH; END IF;
				IF ((detik / 100) mod 10 = 8) THEN LED1<= DELAPAN; END IF;
				IF ((detik / 100) mod 10 = 9) THEN LED1<= SEMBILAN; END IF;
				
				IF (detik / 1000 = 0) THEN LED2<= NOL; END IF;
				IF (detik / 1000 = 1) THEN LED2<= SATU; END IF;
				IF (detik / 1000 = 2) THEN LED2<= DUA; END IF;
				IF (detik / 1000 = 3) THEN LED2<= TIGA; END IF;
				IF (detik / 1000 = 4) THEN LED2<= EMPAT; END IF;
				IF (detik / 1000 = 5) THEN LED2<= LIMA; END IF;
				IF (detik / 1000 = 6) THEN LED2<= ENAM; END IF;
				IF (detik / 1000 = 7) THEN LED2<= TUJUH; END IF;
				IF (detik / 1000 = 8) THEN LED2<= DELAPAN; END IF;
				IF (detik / 1000 = 9) THEN LED2<= SEMBILAN; END IF;
				
			END CASE;
		END IF;
	END IF;
	
	IF (kondisi = 2) THEN
		IF ((i_pixel_column <= UjungKanan) AND (i_pixel_row < UjungBawah)) THEN
			o_red <= X"FF";
			o_green <= X"00";
			o_blue <= X"00";
		END IF;
	ELSE
		IF ((i_pixel_column > kotak_0_x - r) AND (i_pixel_column < kotak_0_x + r) AND (i_pixel_row > kotak_0_y - r) AND (i_pixel_row < kotak_0_y + r)) THEN
			o_red <= X"FF";
			o_green <= X"00";
			o_blue <= X"00";
		ELSIF ((i_pixel_column >= kotak_1_x - r) AND (i_pixel_column <= kotak_1_x + r) AND (i_pixel_row >= kotak_1_y - r) AND (i_pixel_row <= kotak_1_y + r)) THEN
			o_red <= X"26";
			o_green <= X"34";
			o_blue <= X"AB";
		ELSIF ((i_pixel_column >= kotak_2_x - r) AND (i_pixel_column <= kotak_2_x + r) AND (i_pixel_row >= kotak_2_y - r) AND (i_pixel_row <= kotak_2_y + r)) THEN
			o_red <= X"89";
			o_green <= X"21";
			o_blue <= X"BA";
		ELSIF ((i_pixel_column >= kotak_3_x - r) AND (i_pixel_column <= kotak_3_x + r) AND (i_pixel_row >= kotak_3_y - r) AND (i_pixel_row <= kotak_3_y + r)) THEN
			o_red <= X"A2";
			o_green <= X"F4";
			o_blue <= X"C2";
		ELSIF ((i_pixel_column >= kotak_4_x - r) AND (i_pixel_column <= kotak_4_x + r) AND (i_pixel_row >= kotak_4_y - r) AND (i_pixel_row <= kotak_4_y + r)) THEN
			o_red <= X"A0";
			o_green <= X"32";
			o_blue <= X"85";
		ELSIF ((i_pixel_column >= kotak_5_x - r) AND (i_pixel_column <= kotak_5_x + r) AND (i_pixel_row >= kotak_5_y - r) AND (i_pixel_row <= kotak_5_y + r)) THEN
			o_red <= X"C2";
			o_green <= X"D5";
			o_blue <= X"D0";
		ELSIF ((i_pixel_column >= kotak_6_x - r) AND (i_pixel_column <= kotak_6_x + r) AND (i_pixel_row >= kotak_6_y - r) AND (i_pixel_row <= kotak_6_y + r)) THEN
			o_red <= X"A8";
			o_green <= X"81";
			o_blue <= X"23";
		ELSIF ((i_pixel_column >= kotak_7_x - r) AND (i_pixel_column <= kotak_7_x + r) AND (i_pixel_row >= kotak_7_y - r) AND (i_pixel_row <= kotak_7_y + r)) THEN
			o_red <= X"26";
			o_green <= X"08";
			o_blue <= X"10";
		ELSIF ((i_pixel_column >= kotak_8_x - r) AND (i_pixel_column <= kotak_8_x + r) AND (i_pixel_row >= kotak_8_y - r) AND (i_pixel_row <= kotak_8_y + r)) THEN
			o_red <= X"00";
			o_green <= X"42";
			o_blue <= X"93";
		ELSIF ((i_pixel_column >= kotak_9_x - r) AND (i_pixel_column <= kotak_9_x + r) AND (i_pixel_row >= kotak_9_y - r) AND (i_pixel_row <= kotak_9_y + r)) THEN
			o_red <= X"CC";
			o_green <= X"AA";
			o_blue <= X"BB";
		ELSIF ((i_pixel_column >= kotak_10_x - r) AND (i_pixel_column <= kotak_10_x + r) AND (i_pixel_row >= kotak_10_y - r) AND (i_pixel_row <= kotak_10_y + r)) THEN
			o_red <= X"82";
			o_green <= X"A4";
			o_blue <= X"C1";
		ELSIF ((i_pixel_column >= kotak_11_x - r) AND (i_pixel_column <= kotak_11_x + r) AND (i_pixel_row >= kotak_11_y - r) AND (i_pixel_row <= kotak_11_y + r)) THEN
			o_red <= X"25";
			o_green <= X"86";
			o_blue <= X"99";
		ELSIF ((i_pixel_column >= kotak_12_x - r) AND (i_pixel_column <= kotak_12_x + r) AND (i_pixel_row >= kotak_12_y - r) AND (i_pixel_row <= kotak_12_y + r)) THEN
			o_red <= X"00";
			o_green <= X"11";
			o_blue <= X"A9";
		ELSIF ((i_pixel_column >= kotak_13_x - r) AND (i_pixel_column <= kotak_13_x + r) AND (i_pixel_row >= kotak_13_y - r) AND (i_pixel_row <= kotak_13_y + r)) THEN
			o_red <= X"FD";
			o_green <= X"FA";
			o_blue <= X"09";
		ELSIF ((i_pixel_column >= kotak_14_x - r) AND (i_pixel_column <= kotak_14_x + r) AND (i_pixel_row >= kotak_14_y - r) AND (i_pixel_row <= kotak_14_y + r)) THEN
			o_red <= X"FF";
			o_green <= X"C2";
			o_blue <= X"C9";
		ELSIF ((i_pixel_column >= kotak_15_x - r) AND (i_pixel_column <= kotak_15_x + r) AND (i_pixel_row >= kotak_15_y - r) AND (i_pixel_row <= kotak_15_y + r)) THEN
			o_red <= X"C1";
			o_green <= X"A2";
			o_blue <= X"42";
		ELSIF ((i_pixel_column >= kotak_16_x - r) AND (i_pixel_column <= kotak_16_x + r) AND (i_pixel_row >= kotak_16_y - r) AND (i_pixel_row <= kotak_16_y + r)) THEN
			o_red <= X"24";
			o_green <= X"75";
			o_blue <= X"36";
		ELSIF ((i_pixel_column >= kotak_17_x - r) AND (i_pixel_column <= kotak_17_x + r) AND (i_pixel_row >= kotak_17_y - r) AND (i_pixel_row <= kotak_17_y + r)) THEN
			o_red <= X"23";
			o_green <= X"85";
			o_blue <= X"56";
		ELSIF ((i_pixel_column >= kotak_18_x - r) AND (i_pixel_column <= kotak_18_x + r) AND (i_pixel_row >= kotak_18_y - r) AND (i_pixel_row <= kotak_18_y + r)) THEN
			o_red <= X"09";
			o_green <= X"45";
			o_blue <= X"A1";
		ELSIF ((i_pixel_column >= kotak_19_x - r) AND (i_pixel_column <= kotak_19_x + r) AND (i_pixel_row >= kotak_19_y - r) AND (i_pixel_row <= kotak_19_y + r)) THEN
			o_red <= X"82";
			o_green <= X"26";
			o_blue <= X"75";
		ELSIF ((i_pixel_column >= kotak_20_x - r) AND (i_pixel_column <= kotak_20_x + r) AND (i_pixel_row >= kotak_20_y - r) AND (i_pixel_row <= kotak_20_y + r)) THEN
			o_red <= X"35";
			o_green <= X"96";
			o_blue <= X"24";
		ELSIF ((i_pixel_column >= kotak_21_x - r) AND (i_pixel_column <= kotak_21_x + r) AND (i_pixel_row >= kotak_21_y - r) AND (i_pixel_row <= kotak_21_y + r)) THEN
			o_red <= X"C2";
			o_green <= X"B2";
			o_blue <= X"E2";
		ELSIF ((i_pixel_column >= kotak_22_x - r) AND (i_pixel_column <= kotak_22_x + r) AND (i_pixel_row >= kotak_22_y - r) AND (i_pixel_row <= kotak_22_y + r)) THEN
			o_red <= X"E7";
			o_green <= X"D4";
			o_blue <= X"C1";
		ELSIF ((i_pixel_column >= kotak_23_x - r) AND (i_pixel_column <= kotak_23_x + r) AND (i_pixel_row >= kotak_23_y - r) AND (i_pixel_row <= kotak_23_y + r)) THEN
			o_red <= X"B9";
			o_green <= X"A2";
			o_blue <= X"9B";
		ELSIF ((i_pixel_column >= kotak_24_x - r) AND (i_pixel_column <= kotak_24_x + r) AND (i_pixel_row >= kotak_24_y - r) AND (i_pixel_row <= kotak_24_y + r)) THEN
			o_red <= X"0A";
			o_green <= X"2F";
			o_blue <= X"8D";
		ELSIF ((i_pixel_column >= kotak_25_x - r) AND (i_pixel_column <= kotak_25_x + r) AND (i_pixel_row >= kotak_25_y - r) AND (i_pixel_row <= kotak_25_y + r)) THEN
			o_red <= X"9A";
			o_green <= X"7E";
			o_blue <= X"8C";
		ELSE --buat background
			o_red <= X"FE";
			o_green <= X"FE";
			o_blue <= X"FE";
		END IF;	
	END IF;	

END PROCESS;


END behavioral; 