LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
use IEEE.MATH_REAL.ALL;

ENTITY fsm IS
	PORT(
		clock : IN STD_LOGIC;
		PB2, PB1 : IN STD_LOGIC;
		kotak_0_x, kotak_0_y, kotak_1_x, kotak_1_y, kotak_2_x, kotak_2_y, kotak_3_x, kotak_3_y, kotak_4_x, kotak_4_y, kotak_5_x, kotak_5_y : BUFFER SIGNED(10 DOWNTO 0);
		kotak_6_x, kotak_6_y, kotak_7_x, kotak_7_y, kotak_8_x, kotak_8_y, kotak_9_x, kotak_9_y, kotak_10_x, kotak_10_y : BUFFER SIGNED(10 DOWNTO 0);
		kotak_11_x, kotak_11_y, kotak_12_x, kotak_12_y, kotak_13_x, kotak_13_y, kotak_14_x, kotak_14_y, kotak_15_x, kotak_15_y : BUFFER SIGNED(10 DOWNTO 0);
		kotak_16_x, kotak_16_y, kotak_17_x, kotak_17_y, kotak_18_x, kotak_18_y, kotak_19_x, kotak_19_y, kotak_20_x, kotak_20_y : BUFFER SIGNED(10 DOWNTO 0);
		kotak_21_x, kotak_21_y, kotak_22_x, kotak_22_y, kotak_23_x, kotak_23_y, kotak_24_x, kotak_24_y, kotak_25_x, kotak_25_y : BUFFER SIGNED(10 DOWNTO 0);
		state : BUFFER INTEGER; --nilainya 0, 1, 2
		detik : BUFFER INTEGER);
END fsm;

ARCHITECTURE behave OF fsm IS
	SIGNAL kondisi : integer := 0;

BEGIN
	--inisiasi
	state <= kondisi;
	PROCESS(clock, PB2, PB1)
	VARIABLE countf : integer := 0; --menjadi penghitungan dalam mengatur kecepatan
	CONSTANT frekmax : integer := 50000000;
	CONSTANT range_x : integer := 640;
	CONSTANT range_y : integer := 480;
	CONSTANT r : integer := 50;
	BEGIN
		state <= kondisi;
		IF (clock'EVENT and clock='1') THEN
			case kondisi IS
				WHEN 0 =>
					if (PB2 = '1' OR PB1='1') THEN
						kondisi <= 1;
						kotak_0_x <= to_signed(320, kotak_0_x'length);
						kotak_0_y <= to_signed(620, kotak_0_x'length);
						kotak_1_x <= to_signed(7 , kotak_1_x'length); kotak_1_y <= to_signed(0-134 , kotak_1_x'length);
						kotak_2_x <= to_signed(379 , kotak_2_x'length); kotak_2_y <= to_signed(0-57 , kotak_2_x'length);
						kotak_3_x <= to_signed(81 , kotak_3_x'length); kotak_3_y <= to_signed(0-271 , kotak_3_x'length);
						kotak_4_x <= to_signed(181 , kotak_4_x'length); kotak_4_y <= to_signed(0-21 , kotak_4_x'length);
						kotak_5_x <= to_signed(419 , kotak_5_x'length); kotak_5_y <= to_signed(0-114 , kotak_5_x'length);
						kotak_6_x <= to_signed(261 , kotak_6_x'length); kotak_6_y <= to_signed(0-258 , kotak_6_x'length);
						kotak_7_x <= to_signed(66 , kotak_7_x'length); kotak_7_y <= to_signed(0-327 , kotak_7_x'length);
						kotak_8_x <= to_signed(187 , kotak_8_x'length); kotak_8_y <= to_signed(0-371 , kotak_8_x'length);
						kotak_9_x <= to_signed(532 , kotak_9_x'length); kotak_9_y <= to_signed(0-175 , kotak_9_x'length);
						kotak_10_x <= to_signed(373 , kotak_10_x'length); kotak_10_y <= to_signed(0-190 , kotak_10_x'length);
						kotak_11_x <= to_signed(575 , kotak_11_x'length); kotak_11_y <= to_signed(0-367 , kotak_11_x'length);
						kotak_12_x <= to_signed(255 , kotak_12_x'length); kotak_12_y <= to_signed(0-206 , kotak_12_x'length);
						kotak_13_x <= to_signed(280 , kotak_13_x'length); kotak_13_y <= to_signed(0-318 , kotak_13_x'length);
						kotak_14_x <= to_signed(561 , kotak_14_x'length); kotak_14_y <= to_signed(0-289 , kotak_14_x'length);
						kotak_15_x <= to_signed(455 , kotak_15_x'length); kotak_15_y <= to_signed(0-221 , kotak_15_x'length);
						kotak_16_x <= to_signed(584 , kotak_16_x'length); kotak_16_y <= to_signed(0-012 , kotak_16_x'length);
						kotak_17_x <= to_signed(307 , kotak_17_x'length); kotak_17_y <= to_signed(0-089 , kotak_17_x'length);
						kotak_18_x <= to_signed(262 , kotak_18_x'length); kotak_18_y <= to_signed(0-49 , kotak_18_x'length);
						kotak_19_x <= to_signed(416 , kotak_19_x'length); kotak_19_y <= to_signed(0-280 , kotak_19_x'length);
						kotak_20_x <= to_signed(586 , kotak_20_x'length); kotak_20_y <= to_signed(0-215 , kotak_20_x'length);
						kotak_21_x <= to_signed(114 , kotak_21_x'length); kotak_21_y <= to_signed(0-275 , kotak_21_x'length);
						kotak_22_x <= to_signed(21 , kotak_22_x'length); kotak_22_y <= to_signed(0-252 , kotak_22_x'length);
						kotak_23_x <= to_signed(371 , kotak_23_x'length); kotak_23_y <= to_signed(0-190 , kotak_23_x'length);
						kotak_24_x <= to_signed(57 , kotak_24_x'length); kotak_24_y <= to_signed(0-210 , kotak_24_x'length);
						kotak_25_x <= to_signed(134 , kotak_25_x'length); kotak_25_y <= to_signed(0-142 , kotak_25_x'length);
					END IF;

				WHEN 1 =>
					IF (countf<2000000) THEN --2juta
						countf:= countf+1;
						IF (countf mod 1000000 = 0) THEN --1juta
							--jika push button di tekan, kotak_0 bergeser
							IF (PB2 = '1') AND (kotak_0_x<integer(range_x-25)) THEN
								kotak_0_x <= kotak_0_x + 1;
							END IF;
							IF (PB1 = '1') AND (kotak_0_x > 25) THEN
								kotak_0_x <= kotak_0_x -1;
							END IF;
						END IF;
					ELSE
						countf:= 0;
						-- 25 kotak akan terus bergeser ke bawah
						kotak_1_y <= kotak_1_y + 2; kotak_2_y <= kotak_2_y + 1;
						kotak_3_y <= kotak_3_y + 1; kotak_4_y <= kotak_4_y + 2;
						kotak_5_y <= kotak_5_y + 3; kotak_6_y <= kotak_6_y + 1;
						kotak_7_y <= kotak_7_y + 1; kotak_8_y <= kotak_8_y + 3;
						kotak_9_y <= kotak_9_y + 1; kotak_10_y <= kotak_10_y + 1;
						kotak_11_y <= kotak_11_y + 3; kotak_12_y <= kotak_12_y + 2;
						kotak_13_y <= kotak_13_y + 1; kotak_14_y <= kotak_14_y + 1;
						kotak_15_y <= kotak_15_y + 1; kotak_16_y <= kotak_16_y + 3;
						kotak_17_y <= kotak_17_y + 2; kotak_18_y <= kotak_18_y + 5;
						kotak_19_y <= kotak_19_y + 1; kotak_20_y <= kotak_20_y + 1;
						kotak_21_y <= kotak_21_y + 2; kotak_22_y <= kotak_22_y + 2;
						kotak_23_y <= kotak_23_y + 1; kotak_24_y <= kotak_24_y + 1;
					END IF;
					--reset posisi kotak
					IF (kotak_1_y > 479) THEN kotak_1_x <= to_signed(7 , kotak_1_x'length); kotak_1_y <= to_signed(0-134 , kotak_1_y'length); END IF;
					IF (kotak_2_y > 479) THEN kotak_2_x <= to_signed(379 , kotak_2_x'length); kotak_2_y <= to_signed(0-57 , kotak_2_y'length);END IF;
					IF (kotak_3_y > 479) THEN kotak_3_x <= to_signed(81 , kotak_3_x'length); kotak_3_y <= to_signed(0-371 , kotak_3_y'length);END IF;
					IF (kotak_4_y > 479) THEN kotak_4_x <= to_signed(181 , kotak_4_x'length); kotak_4_y <= to_signed(0-21 , kotak_4_y'length);END IF;
					IF (kotak_5_y > 479) THEN kotak_5_x <= to_signed(419 , kotak_5_x'length); kotak_5_y <= to_signed(0-114 , kotak_5_y'length);END IF;
					IF (kotak_6_y > 479) THEN kotak_6_x <= to_signed(261 , kotak_6_x'length); kotak_6_y <= to_signed(0-258 , kotak_6_y'length);END IF;
					IF (kotak_7_y > 479) THEN kotak_7_x <= to_signed(66 , kotak_7_x'length); kotak_7_y <= to_signed(0-427 , kotak_7_y'length);END IF;
					IF (kotak_8_y > 479) THEN kotak_8_x <= to_signed(187 , kotak_8_x'length); kotak_8_y <= to_signed(0-371 , kotak_8_y'length);END IF;
					IF (kotak_9_y > 479) THEN kotak_9_x <= to_signed(532 , kotak_9_x'length); kotak_9_y <= to_signed(0-175 , kotak_9_y'length);END IF;
					IF (kotak_10_y > 479) THEN kotak_10_x <= to_signed(373 , kotak_10_x'length); kotak_10_y <= to_signed(0-190 , kotak_10_y'length);END IF;
					IF (kotak_11_y > 479) THEN kotak_11_x <= to_signed(575 , kotak_11_x'length); kotak_11_y <= to_signed(0-367 , kotak_11_y'length);END IF;
					IF (kotak_12_y > 479) THEN kotak_12_x <= to_signed(255 , kotak_12_x'length); kotak_12_y <= to_signed(0-206 , kotak_12_y'length);END IF;
					IF (kotak_13_y > 479) THEN kotak_13_x <= to_signed(280 , kotak_13_x'length); kotak_13_y <= to_signed(0-18 , kotak_13_y'length);END IF;
					IF (kotak_14_y > 479) THEN kotak_14_x <= to_signed(561 , kotak_14_x'length); kotak_14_y <= to_signed(0-289 , kotak_14_y'length);END IF;
					IF (kotak_15_y > 479) THEN kotak_15_x <= to_signed(455 , kotak_15_x'length); kotak_15_y <= to_signed(0-421 , kotak_15_y'length);END IF;
					IF (kotak_16_y > 479) THEN kotak_16_x <= to_signed(584 , kotak_16_x'length); kotak_16_y <= to_signed(0-012 , kotak_16_y'length);END IF;
					IF (kotak_17_y > 479) THEN kotak_17_x <= to_signed(307 , kotak_17_x'length); kotak_17_y <= to_signed(0-089 , kotak_17_y'length);END IF;
					IF (kotak_18_y > 479) THEN kotak_18_x <= to_signed(262 , kotak_18_x'length); kotak_18_y <= to_signed(0-49 , kotak_18_y'length);END IF;
					IF (kotak_19_y > 479) THEN kotak_19_x <= to_signed(416 , kotak_19_x'length); kotak_19_y <= to_signed(0-280 , kotak_19_y'length);END IF;
					IF (kotak_20_y > 479) THEN kotak_20_x <= to_signed(586 , kotak_20_x'length); kotak_20_y <= to_signed(0-215 , kotak_20_y'length);END IF;
					IF (kotak_21_y > 479) THEN kotak_21_x <= to_signed(114 , kotak_21_x'length); kotak_21_y <= to_signed(0-375 , kotak_21_y'length);END IF;
					IF (kotak_22_y > 479) THEN kotak_22_x <= to_signed(21 , kotak_22_x'length); kotak_22_y <= to_signed(0-252 , kotak_22_y'length);END IF;
					IF (kotak_23_y > 479) THEN kotak_23_x <= to_signed(371 , kotak_23_x'length); kotak_23_y <= to_signed(0-190 , kotak_23_y'length);END IF;
					IF (kotak_24_y > 479) THEN kotak_24_x <= to_signed(57 , kotak_24_x'length); kotak_24_y <= to_signed(0-210 , kotak_24_y'length);END IF;
					IF (kotak_25_y > 479) THEN kotak_25_x <= to_signed(134 , kotak_25_x'length); kotak_25_y <= to_signed(0-142 , kotak_25_y'length);END IF;
					--apabila terjadi tabrakan
					IF ((kotak_1_x - kotak_0_x <= 2*r) OR (kotak_1_y - kotak_0_y <= 2*r)) THEN kondisi <= 2; END IF;
					IF ((kotak_2_x - kotak_0_x <= 2*r) OR (kotak_1_y - kotak_0_y <= 2*r)) THEN kondisi <= 2; END IF;
					IF ((kotak_3_x - kotak_0_x <= 2*r) OR (kotak_1_y - kotak_0_y <= 2*r)) THEN kondisi <= 2; END IF; 
					IF ((kotak_4_x - kotak_0_x <= 2*r) OR (kotak_1_y - kotak_0_y <= 2*r)) THEN kondisi <= 2; END IF; 
					IF ((kotak_5_x - kotak_0_x <= 2*r) OR (kotak_1_y - kotak_0_y <= 2*r)) THEN kondisi <= 2; END IF; 
					IF ((kotak_6_x - kotak_0_x <= 2*r) OR (kotak_1_y - kotak_0_y <= 2*r)) THEN kondisi <= 2; END IF; 
					IF ((kotak_7_x - kotak_0_x <= 2*r) OR (kotak_1_y - kotak_0_y <= 2*r)) THEN kondisi <= 2; END IF; 
					IF ((kotak_8_x - kotak_0_x <= 2*r) OR (kotak_1_y - kotak_0_y <= 2*r)) THEN kondisi <= 2; END IF; 
					IF ((kotak_9_x - kotak_0_x <= 2*r) OR (kotak_1_y - kotak_0_y <= 2*r)) THEN kondisi <= 2; END IF; 
					IF ((kotak_10_x - kotak_0_x <= 2*r) OR (kotak_1_y - kotak_0_y <= 2*r)) THEN kondisi <= 2; END IF;
					IF ((kotak_11_x - kotak_0_x <= 2*r) OR (kotak_1_y - kotak_0_y <= 2*r)) THEN kondisi <= 2; END IF;
					IF ((kotak_12_x - kotak_0_x <= 2*r) OR (kotak_1_y - kotak_0_y <= 2*r)) THEN kondisi <= 2; END IF;
					IF ((kotak_13_x - kotak_0_x <= 2*r) OR (kotak_1_y - kotak_0_y <= 2*r)) THEN kondisi <= 2; END IF;
					IF ((kotak_14_x - kotak_0_x <= 2*r) OR (kotak_1_y - kotak_0_y <= 2*r)) THEN kondisi <= 2; END IF;
					IF ((kotak_15_x - kotak_0_x <= 2*r) OR (kotak_1_y - kotak_0_y <= 2*r)) THEN kondisi <= 2; END IF;
					IF ((kotak_16_x - kotak_0_x <= 2*r) OR (kotak_1_y - kotak_0_y <= 2*r)) THEN kondisi <= 2; END IF;
					IF ((kotak_17_x - kotak_0_x <= 2*r) OR (kotak_1_y - kotak_0_y <= 2*r)) THEN kondisi <= 2; END IF;
					IF ((kotak_18_x - kotak_0_x <= 2*r) OR (kotak_1_y - kotak_0_y <= 2*r)) THEN kondisi <= 2; END IF;
					IF ((kotak_19_x - kotak_0_x <= 2*r) OR (kotak_1_y - kotak_0_y <= 2*r)) THEN kondisi <= 2; END IF;
					IF ((kotak_20_x - kotak_0_x <= 2*r) OR (kotak_1_y - kotak_0_y <= 2*r)) THEN kondisi <= 2; END IF;
					IF ((kotak_21_x - kotak_0_x <= 2*r) OR (kotak_1_y - kotak_0_y <= 2*r)) THEN kondisi <= 2; END IF;
					IF ((kotak_22_x - kotak_0_x <= 2*r) OR (kotak_1_y - kotak_0_y <= 2*r)) THEN kondisi <= 2; END IF;
					IF ((kotak_23_x - kotak_0_x <= 2*r) OR (kotak_1_y - kotak_0_y <= 2*r)) THEN kondisi <= 2; END IF;
					IF ((kotak_24_x - kotak_0_x <= 2*r) OR (kotak_1_y - kotak_0_y <= 2*r)) THEN kondisi <= 2; END IF;
					IF ((kotak_25_x - kotak_0_x <= 2*r) OR (kotak_1_y - kotak_0_y <= 2*r)) THEN kondisi <= 2; END IF;				
					
				WHEN OTHERS =>
						IF (countf<100000000) THEN
							countf:= countf+1;
						ELSE
							countf:= 0;
							kondisi <= 0;
						END IF;
			END CASE;
		END IF;
	END PROCESS;
	
	PROCESS (clock, state)
	VARIABLE countd: integer := 0; -- menghitung pertambahan detik
	CONSTANT frekmax : integer := 50000000;
	BEGIN
		if (clock = '1' and clock'EVENT) then
			if (countd < frekmax) THEN
				countd := countd+1;
			else
				countd :=0;
				IF (state = 1) THEN
					detik <= detik+1;
					--penulisan detik di led7seg
					
				END IF;
			END IF;
		END IF;
	END PROCESS;
	
END behave;