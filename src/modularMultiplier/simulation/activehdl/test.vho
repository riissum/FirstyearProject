-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"

-- DATE "05/12/2017 15:07:55"

-- 
-- Device: Altera EP2C35F672C6 Package FBGA672
-- 

-- 
-- This VHDL file should be used for Active-HDL (VHDL) only
-- 

LIBRARY CYCLONEII;
LIBRARY IEEE;
USE CYCLONEII.CYCLONEII_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY 	test IS
    PORT (
	CLK : IN std_logic;
	A : IN std_logic_vector(3 DOWNTO 0);
	B : IN std_logic_vector(3 DOWNTO 0);
	M : IN std_logic_vector(3 DOWNTO 0);
	RES : OUT std_logic_vector(3 DOWNTO 0);
	bMoni : OUT std_logic
	);
END test;

-- Design Ports Information
-- RES[0]	=>  Location: PIN_AE23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- RES[1]	=>  Location: PIN_AF23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- RES[2]	=>  Location: PIN_AB21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- RES[3]	=>  Location: PIN_AC22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- bMoni	=>  Location: PIN_Y12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
-- CLK	=>  Location: PIN_G26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[2]	=>  Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[1]	=>  Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[0]	=>  Location: PIN_N1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- B[3]	=>  Location: PIN_T7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[1]	=>  Location: PIN_U4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[0]	=>  Location: PIN_U3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- M[0]	=>  Location: PIN_AC13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- M[1]	=>  Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[3]	=>  Location: PIN_V2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- A[2]	=>  Location: PIN_V1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- M[2]	=>  Location: PIN_B13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
-- M[3]	=>  Location: PIN_A13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default


ARCHITECTURE structure OF test IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLK : std_logic;
SIGNAL ww_A : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_B : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_M : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_RES : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_bMoni : std_logic;
SIGNAL \BFF0|i[3]~35_combout\ : std_logic;
SIGNAL \BFF0|i[5]~39_combout\ : std_logic;
SIGNAL \BFF0|i[6]~41_combout\ : std_logic;
SIGNAL \BFF0|i[8]~45_combout\ : std_logic;
SIGNAL \BFF0|i[10]~49_combout\ : std_logic;
SIGNAL \BFF0|i[19]~67_combout\ : std_logic;
SIGNAL \BFF0|i[24]~77_combout\ : std_logic;
SIGNAL \BFF0|i[26]~81_combout\ : std_logic;
SIGNAL \BFF0|i[28]~85_combout\ : std_logic;
SIGNAL \BFF0|bOut~0_combout\ : std_logic;
SIGNAL \BFF0|bOut~1_combout\ : std_logic;
SIGNAL \BFF0|bOut~2_combout\ : std_logic;
SIGNAL \BFF0|bOut~3_combout\ : std_logic;
SIGNAL \BFF0|bOut~4_combout\ : std_logic;
SIGNAL \BFF0|bOut~7_combout\ : std_logic;
SIGNAL \ndCell|flipC1T|q~regout\ : std_logic;
SIGNAL \stCell|flipS|q~regout\ : std_logic;
SIGNAL \ndCell|flipC2|q~regout\ : std_logic;
SIGNAL \ndCell|add3|cOut~0_combout\ : std_logic;
SIGNAL \ndCell|add1|cOut~0_combout\ : std_logic;
SIGNAL \ndCell|add4|s~0_combout\ : std_logic;
SIGNAL \stCell|flipB|q~regout\ : std_logic;
SIGNAL \stCell|flipC1T|q~regout\ : std_logic;
SIGNAL \stCell|add1|s~combout\ : std_logic;
SIGNAL \stCell|flipC1B|q~regout\ : std_logic;
SIGNAL \stCell|add3|s~combout\ : std_logic;
SIGNAL \stCell|add2|s~combout\ : std_logic;
SIGNAL \ndCell|add4|cOut~0_combout\ : std_logic;
SIGNAL \stCell|flipC2|q~regout\ : std_logic;
SIGNAL \stCell|add3|cOut~0_combout\ : std_logic;
SIGNAL \stCell|add1|cOut~0_combout\ : std_logic;
SIGNAL \stCell|add4|s~0_combout\ : std_logic;
SIGNAL \stCell|add2|cOut~0_combout\ : std_logic;
SIGNAL \stCell|add4|cOut~0_combout\ : std_logic;
SIGNAL \stCell|flipB|q~feeder_combout\ : std_logic;
SIGNAL \CLK~combout\ : std_logic;
SIGNAL \ndCell|add3|s~0_combout\ : std_logic;
SIGNAL \BFF0|i[0]~93_combout\ : std_logic;
SIGNAL \BFF0|i[1]~32\ : std_logic;
SIGNAL \BFF0|i[2]~33_combout\ : std_logic;
SIGNAL \BFF0|i[2]~34\ : std_logic;
SIGNAL \BFF0|i[3]~36\ : std_logic;
SIGNAL \BFF0|i[4]~37_combout\ : std_logic;
SIGNAL \BFF0|i[4]~38\ : std_logic;
SIGNAL \BFF0|i[5]~40\ : std_logic;
SIGNAL \BFF0|i[6]~42\ : std_logic;
SIGNAL \BFF0|i[7]~43_combout\ : std_logic;
SIGNAL \BFF0|i[7]~44\ : std_logic;
SIGNAL \BFF0|i[8]~46\ : std_logic;
SIGNAL \BFF0|i[9]~47_combout\ : std_logic;
SIGNAL \BFF0|i[9]~48\ : std_logic;
SIGNAL \BFF0|i[10]~50\ : std_logic;
SIGNAL \BFF0|i[11]~51_combout\ : std_logic;
SIGNAL \BFF0|i[11]~52\ : std_logic;
SIGNAL \BFF0|i[12]~53_combout\ : std_logic;
SIGNAL \BFF0|i[12]~54\ : std_logic;
SIGNAL \BFF0|i[13]~55_combout\ : std_logic;
SIGNAL \BFF0|i[13]~56\ : std_logic;
SIGNAL \BFF0|i[14]~57_combout\ : std_logic;
SIGNAL \BFF0|i[14]~58\ : std_logic;
SIGNAL \BFF0|i[15]~59_combout\ : std_logic;
SIGNAL \BFF0|i[15]~60\ : std_logic;
SIGNAL \BFF0|i[16]~61_combout\ : std_logic;
SIGNAL \BFF0|i[16]~62\ : std_logic;
SIGNAL \BFF0|i[17]~63_combout\ : std_logic;
SIGNAL \BFF0|i[17]~64\ : std_logic;
SIGNAL \BFF0|i[18]~65_combout\ : std_logic;
SIGNAL \BFF0|i[18]~66\ : std_logic;
SIGNAL \BFF0|i[19]~68\ : std_logic;
SIGNAL \BFF0|i[20]~69_combout\ : std_logic;
SIGNAL \BFF0|i[20]~70\ : std_logic;
SIGNAL \BFF0|i[21]~72\ : std_logic;
SIGNAL \BFF0|i[22]~74\ : std_logic;
SIGNAL \BFF0|i[23]~75_combout\ : std_logic;
SIGNAL \BFF0|i[23]~76\ : std_logic;
SIGNAL \BFF0|i[24]~78\ : std_logic;
SIGNAL \BFF0|i[25]~79_combout\ : std_logic;
SIGNAL \BFF0|i[25]~80\ : std_logic;
SIGNAL \BFF0|i[26]~82\ : std_logic;
SIGNAL \BFF0|i[27]~83_combout\ : std_logic;
SIGNAL \BFF0|i[27]~84\ : std_logic;
SIGNAL \BFF0|i[28]~86\ : std_logic;
SIGNAL \BFF0|i[29]~87_combout\ : std_logic;
SIGNAL \BFF0|i[29]~88\ : std_logic;
SIGNAL \BFF0|i[30]~89_combout\ : std_logic;
SIGNAL \BFF0|i[30]~90\ : std_logic;
SIGNAL \BFF0|i[31]~91_combout\ : std_logic;
SIGNAL \BFF0|i[1]~31_combout\ : std_logic;
SIGNAL \BFF0|Mux0~0_combout\ : std_logic;
SIGNAL \BFF0|Mux0~1_combout\ : std_logic;
SIGNAL \BFF0|i[21]~71_combout\ : std_logic;
SIGNAL \BFF0|bOut~5_combout\ : std_logic;
SIGNAL \BFF0|i[22]~73_combout\ : std_logic;
SIGNAL \BFF0|bOut~6_combout\ : std_logic;
SIGNAL \BFF0|bOut~8_combout\ : std_logic;
SIGNAL \BFF0|bOut~9_combout\ : std_logic;
SIGNAL \BFF0|bOut~regout\ : std_logic;
SIGNAL \ndCell|flipB|q~feeder_combout\ : std_logic;
SIGNAL \ndCell|flipB|q~regout\ : std_logic;
SIGNAL \ndCell|add1|s~combout\ : std_logic;
SIGNAL \ndCell|add2|cOut~0_combout\ : std_logic;
SIGNAL \ndCell|flipC1B|q~regout\ : std_logic;
SIGNAL \ndCell|add2|s~0_combout\ : std_logic;
SIGNAL \ndCell|flipS|q~regout\ : std_logic;
SIGNAL \RES0|flip0|q~regout\ : std_logic;
SIGNAL \stCell|flipQ|q~feeder_combout\ : std_logic;
SIGNAL \stCell|flipQ|q~regout\ : std_logic;
SIGNAL \RES0|floop:1:FFi|q~feeder_combout\ : std_logic;
SIGNAL \RES0|floop:1:FFi|q~regout\ : std_logic;
SIGNAL \RES0|floop:0:FFi|q~regout\ : std_logic;
SIGNAL \BFF0|i\ : std_logic_vector(31 DOWNTO 0);
SIGNAL \M~combout\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \B~combout\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \A~combout\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \stCell|n\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \ndCell|n\ : std_logic_vector(3 DOWNTO 0);

BEGIN

ww_CLK <= CLK;
ww_A <= A;
ww_B <= B;
ww_M <= M;
RES <= ww_RES;
bMoni <= ww_bMoni;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

-- Location: LCFF_X64_Y27_N7
\BFF0|i[3]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|i[3]~35_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|i\(3));

-- Location: LCFF_X64_Y27_N11
\BFF0|i[5]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|i[5]~39_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|i\(5));

-- Location: LCFF_X64_Y27_N13
\BFF0|i[6]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|i[6]~41_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|i\(6));

-- Location: LCFF_X64_Y27_N17
\BFF0|i[8]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|i[8]~45_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|i\(8));

-- Location: LCFF_X64_Y27_N21
\BFF0|i[10]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|i[10]~49_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|i\(10));

-- Location: LCFF_X64_Y26_N7
\BFF0|i[19]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|i[19]~67_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|i\(19));

-- Location: LCFF_X64_Y26_N17
\BFF0|i[24]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|i[24]~77_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|i\(24));

-- Location: LCFF_X64_Y26_N21
\BFF0|i[26]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|i[26]~81_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|i\(26));

-- Location: LCFF_X64_Y26_N25
\BFF0|i[28]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|i[28]~85_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|i\(28));

-- Location: LCCOMB_X64_Y27_N6
\BFF0|i[3]~35\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|i[3]~35_combout\ = (\BFF0|i\(3) & (\BFF0|i[2]~34\ $ (GND))) # (!\BFF0|i\(3) & (!\BFF0|i[2]~34\ & VCC))
-- \BFF0|i[3]~36\ = CARRY((\BFF0|i\(3) & !\BFF0|i[2]~34\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \BFF0|i\(3),
	datad => VCC,
	cin => \BFF0|i[2]~34\,
	combout => \BFF0|i[3]~35_combout\,
	cout => \BFF0|i[3]~36\);

-- Location: LCCOMB_X64_Y27_N10
\BFF0|i[5]~39\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|i[5]~39_combout\ = (\BFF0|i\(5) & (\BFF0|i[4]~38\ $ (GND))) # (!\BFF0|i\(5) & (!\BFF0|i[4]~38\ & VCC))
-- \BFF0|i[5]~40\ = CARRY((\BFF0|i\(5) & !\BFF0|i[4]~38\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \BFF0|i\(5),
	datad => VCC,
	cin => \BFF0|i[4]~38\,
	combout => \BFF0|i[5]~39_combout\,
	cout => \BFF0|i[5]~40\);

-- Location: LCCOMB_X64_Y27_N12
\BFF0|i[6]~41\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|i[6]~41_combout\ = (\BFF0|i\(6) & (!\BFF0|i[5]~40\)) # (!\BFF0|i\(6) & ((\BFF0|i[5]~40\) # (GND)))
-- \BFF0|i[6]~42\ = CARRY((!\BFF0|i[5]~40\) # (!\BFF0|i\(6)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \BFF0|i\(6),
	datad => VCC,
	cin => \BFF0|i[5]~40\,
	combout => \BFF0|i[6]~41_combout\,
	cout => \BFF0|i[6]~42\);

-- Location: LCCOMB_X64_Y27_N16
\BFF0|i[8]~45\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|i[8]~45_combout\ = (\BFF0|i\(8) & (!\BFF0|i[7]~44\)) # (!\BFF0|i\(8) & ((\BFF0|i[7]~44\) # (GND)))
-- \BFF0|i[8]~46\ = CARRY((!\BFF0|i[7]~44\) # (!\BFF0|i\(8)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \BFF0|i\(8),
	datad => VCC,
	cin => \BFF0|i[7]~44\,
	combout => \BFF0|i[8]~45_combout\,
	cout => \BFF0|i[8]~46\);

-- Location: LCCOMB_X64_Y27_N20
\BFF0|i[10]~49\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|i[10]~49_combout\ = (\BFF0|i\(10) & (!\BFF0|i[9]~48\)) # (!\BFF0|i\(10) & ((\BFF0|i[9]~48\) # (GND)))
-- \BFF0|i[10]~50\ = CARRY((!\BFF0|i[9]~48\) # (!\BFF0|i\(10)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \BFF0|i\(10),
	datad => VCC,
	cin => \BFF0|i[9]~48\,
	combout => \BFF0|i[10]~49_combout\,
	cout => \BFF0|i[10]~50\);

-- Location: LCCOMB_X64_Y26_N6
\BFF0|i[19]~67\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|i[19]~67_combout\ = (\BFF0|i\(19) & (\BFF0|i[18]~66\ $ (GND))) # (!\BFF0|i\(19) & (!\BFF0|i[18]~66\ & VCC))
-- \BFF0|i[19]~68\ = CARRY((\BFF0|i\(19) & !\BFF0|i[18]~66\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \BFF0|i\(19),
	datad => VCC,
	cin => \BFF0|i[18]~66\,
	combout => \BFF0|i[19]~67_combout\,
	cout => \BFF0|i[19]~68\);

-- Location: LCCOMB_X64_Y26_N16
\BFF0|i[24]~77\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|i[24]~77_combout\ = (\BFF0|i\(24) & (!\BFF0|i[23]~76\)) # (!\BFF0|i\(24) & ((\BFF0|i[23]~76\) # (GND)))
-- \BFF0|i[24]~78\ = CARRY((!\BFF0|i[23]~76\) # (!\BFF0|i\(24)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \BFF0|i\(24),
	datad => VCC,
	cin => \BFF0|i[23]~76\,
	combout => \BFF0|i[24]~77_combout\,
	cout => \BFF0|i[24]~78\);

-- Location: LCCOMB_X64_Y26_N20
\BFF0|i[26]~81\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|i[26]~81_combout\ = (\BFF0|i\(26) & (!\BFF0|i[25]~80\)) # (!\BFF0|i\(26) & ((\BFF0|i[25]~80\) # (GND)))
-- \BFF0|i[26]~82\ = CARRY((!\BFF0|i[25]~80\) # (!\BFF0|i\(26)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \BFF0|i\(26),
	datad => VCC,
	cin => \BFF0|i[25]~80\,
	combout => \BFF0|i[26]~81_combout\,
	cout => \BFF0|i[26]~82\);

-- Location: LCCOMB_X64_Y26_N24
\BFF0|i[28]~85\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|i[28]~85_combout\ = (\BFF0|i\(28) & (!\BFF0|i[27]~84\)) # (!\BFF0|i\(28) & ((\BFF0|i[27]~84\) # (GND)))
-- \BFF0|i[28]~86\ = CARRY((!\BFF0|i[27]~84\) # (!\BFF0|i\(28)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \BFF0|i\(28),
	datad => VCC,
	cin => \BFF0|i[27]~84\,
	combout => \BFF0|i[28]~85_combout\,
	cout => \BFF0|i[28]~86\);

-- Location: LCCOMB_X63_Y27_N10
\BFF0|bOut~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|bOut~0_combout\ = (!\BFF0|i\(2) & (!\BFF0|i\(4) & (!\BFF0|i\(5) & !\BFF0|i\(3))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BFF0|i\(2),
	datab => \BFF0|i\(4),
	datac => \BFF0|i\(5),
	datad => \BFF0|i\(3),
	combout => \BFF0|bOut~0_combout\);

-- Location: LCCOMB_X63_Y27_N28
\BFF0|bOut~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|bOut~1_combout\ = (!\BFF0|i\(6) & (!\BFF0|i\(7) & (!\BFF0|i\(8) & !\BFF0|i\(9))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BFF0|i\(6),
	datab => \BFF0|i\(7),
	datac => \BFF0|i\(8),
	datad => \BFF0|i\(9),
	combout => \BFF0|bOut~1_combout\);

-- Location: LCCOMB_X63_Y27_N26
\BFF0|bOut~2\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|bOut~2_combout\ = (!\BFF0|i\(11) & (!\BFF0|i\(10) & (!\BFF0|i\(13) & !\BFF0|i\(12))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BFF0|i\(11),
	datab => \BFF0|i\(10),
	datac => \BFF0|i\(13),
	datad => \BFF0|i\(12),
	combout => \BFF0|bOut~2_combout\);

-- Location: LCCOMB_X63_Y27_N24
\BFF0|bOut~3\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|bOut~3_combout\ = (!\BFF0|i\(17) & (!\BFF0|i\(16) & (!\BFF0|i\(14) & !\BFF0|i\(15))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BFF0|i\(17),
	datab => \BFF0|i\(16),
	datac => \BFF0|i\(14),
	datad => \BFF0|i\(15),
	combout => \BFF0|bOut~3_combout\);

-- Location: LCCOMB_X63_Y27_N6
\BFF0|bOut~4\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|bOut~4_combout\ = (\BFF0|bOut~0_combout\ & (\BFF0|bOut~1_combout\ & (\BFF0|bOut~3_combout\ & \BFF0|bOut~2_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BFF0|bOut~0_combout\,
	datab => \BFF0|bOut~1_combout\,
	datac => \BFF0|bOut~3_combout\,
	datad => \BFF0|bOut~2_combout\,
	combout => \BFF0|bOut~4_combout\);

-- Location: LCCOMB_X63_Y26_N20
\BFF0|bOut~7\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|bOut~7_combout\ = (!\BFF0|i\(29) & (!\BFF0|i\(28) & (!\BFF0|i\(27) & !\BFF0|i\(26))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BFF0|i\(29),
	datab => \BFF0|i\(28),
	datac => \BFF0|i\(27),
	datad => \BFF0|i\(26),
	combout => \BFF0|bOut~7_combout\);

-- Location: LCFF_X64_Y28_N21
\ndCell|flipC1T|q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \ndCell|add4|s~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ndCell|flipC1T|q~regout\);

-- Location: LCFF_X64_Y24_N19
\stCell|flipS|q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \stCell|add2|s~combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \stCell|flipS|q~regout\);

-- Location: LCFF_X64_Y28_N15
\ndCell|flipC2|q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \ndCell|add4|cOut~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ndCell|flipC2|q~regout\);

-- Location: LCCOMB_X64_Y28_N24
\ndCell|n[2]\ : cycloneii_lcell_comb
-- Equation(s):
-- \ndCell|n\(2) = (\M~combout\(1) & \RES0|flip0|q~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \M~combout\(1),
	datad => \RES0|flip0|q~regout\,
	combout => \ndCell|n\(2));

-- Location: LCCOMB_X64_Y28_N18
\ndCell|add3|cOut~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ndCell|add3|cOut~0_combout\ = (\ndCell|n\(2) & ((\ndCell|flipC1B|q~regout\) # ((\M~combout\(0) & \ndCell|flipS|q~regout\)))) # (!\ndCell|n\(2) & (\ndCell|flipC1B|q~regout\ & (\M~combout\(0) & \ndCell|flipS|q~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ndCell|n\(2),
	datab => \ndCell|flipC1B|q~regout\,
	datac => \M~combout\(0),
	datad => \ndCell|flipS|q~regout\,
	combout => \ndCell|add3|cOut~0_combout\);

-- Location: LCCOMB_X64_Y28_N12
\ndCell|add1|cOut~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ndCell|add1|cOut~0_combout\ = (\ndCell|flipC1T|q~regout\ & ((\ndCell|n\(1)) # ((\ndCell|flipB|q~regout\ & \A~combout\(1))))) # (!\ndCell|flipC1T|q~regout\ & (\ndCell|flipB|q~regout\ & (\A~combout\(1) & \ndCell|n\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110101010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ndCell|flipC1T|q~regout\,
	datab => \ndCell|flipB|q~regout\,
	datac => \A~combout\(1),
	datad => \ndCell|n\(1),
	combout => \ndCell|add1|cOut~0_combout\);

-- Location: LCCOMB_X64_Y28_N20
\ndCell|add4|s~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ndCell|add4|s~0_combout\ = \ndCell|add3|cOut~0_combout\ $ (\ndCell|flipC2|q~regout\ $ (\ndCell|add1|cOut~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ndCell|add3|cOut~0_combout\,
	datac => \ndCell|flipC2|q~regout\,
	datad => \ndCell|add1|cOut~0_combout\,
	combout => \ndCell|add4|s~0_combout\);

-- Location: LCFF_X64_Y24_N17
\stCell|flipB|q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \stCell|flipB|q~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \stCell|flipB|q~regout\);

-- Location: LCFF_X64_Y24_N23
\stCell|flipC1T|q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \stCell|add4|s~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \stCell|flipC1T|q~regout\);

-- Location: LCCOMB_X63_Y27_N16
\stCell|n[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- \stCell|n\(1) = (\A~combout\(2) & \ndCell|flipB|q~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \A~combout\(2),
	datad => \ndCell|flipB|q~regout\,
	combout => \stCell|n\(1));

-- Location: LCCOMB_X64_Y24_N12
\stCell|add1|s\ : cycloneii_lcell_comb
-- Equation(s):
-- \stCell|add1|s~combout\ = \stCell|flipC1T|q~regout\ $ (\stCell|n\(1) $ (((\A~combout\(3) & \stCell|flipB|q~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001001101101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~combout\(3),
	datab => \stCell|flipC1T|q~regout\,
	datac => \stCell|flipB|q~regout\,
	datad => \stCell|n\(1),
	combout => \stCell|add1|s~combout\);

-- Location: LCFF_X64_Y24_N31
\stCell|flipC1B|q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \stCell|add2|cOut~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \stCell|flipC1B|q~regout\);

-- Location: LCCOMB_X64_Y24_N24
\stCell|n[2]\ : cycloneii_lcell_comb
-- Equation(s):
-- \stCell|n\(2) = (\M~combout\(3) & \stCell|flipQ|q~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \M~combout\(3),
	datad => \stCell|flipQ|q~regout\,
	combout => \stCell|n\(2));

-- Location: LCCOMB_X64_Y24_N4
\stCell|add3|s\ : cycloneii_lcell_comb
-- Equation(s):
-- \stCell|add3|s~combout\ = \stCell|n\(2) $ (\stCell|flipC1B|q~regout\ $ (((\M~combout\(2) & \RES0|flip0|q~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001011001100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stCell|n\(2),
	datab => \stCell|flipC1B|q~regout\,
	datac => \M~combout\(2),
	datad => \RES0|flip0|q~regout\,
	combout => \stCell|add3|s~combout\);

-- Location: LCCOMB_X64_Y24_N18
\stCell|add2|s\ : cycloneii_lcell_comb
-- Equation(s):
-- \stCell|add2|s~combout\ = \stCell|add3|s~combout\ $ (\stCell|add1|s~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \stCell|add3|s~combout\,
	datad => \stCell|add1|s~combout\,
	combout => \stCell|add2|s~combout\);

-- Location: LCCOMB_X64_Y28_N14
\ndCell|add4|cOut~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ndCell|add4|cOut~0_combout\ = (\ndCell|add3|cOut~0_combout\ & ((\ndCell|flipC2|q~regout\) # (\ndCell|add1|cOut~0_combout\))) # (!\ndCell|add3|cOut~0_combout\ & (\ndCell|flipC2|q~regout\ & \ndCell|add1|cOut~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \ndCell|add3|cOut~0_combout\,
	datac => \ndCell|flipC2|q~regout\,
	datad => \ndCell|add1|cOut~0_combout\,
	combout => \ndCell|add4|cOut~0_combout\);

-- Location: LCFF_X64_Y24_N27
\stCell|flipC2|q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \stCell|add4|cOut~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \stCell|flipC2|q~regout\);

-- Location: LCCOMB_X64_Y24_N28
\stCell|add3|cOut~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \stCell|add3|cOut~0_combout\ = (\stCell|n\(2) & ((\stCell|flipC1B|q~regout\) # ((\M~combout\(2) & \RES0|flip0|q~regout\)))) # (!\stCell|n\(2) & (\stCell|flipC1B|q~regout\ & (\M~combout\(2) & \RES0|flip0|q~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110100010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stCell|n\(2),
	datab => \stCell|flipC1B|q~regout\,
	datac => \M~combout\(2),
	datad => \RES0|flip0|q~regout\,
	combout => \stCell|add3|cOut~0_combout\);

-- Location: LCCOMB_X64_Y24_N6
\stCell|add1|cOut~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \stCell|add1|cOut~0_combout\ = (\stCell|flipC1T|q~regout\ & ((\stCell|n\(1)) # ((\A~combout\(3) & \stCell|flipB|q~regout\)))) # (!\stCell|flipC1T|q~regout\ & (\A~combout\(3) & (\stCell|flipB|q~regout\ & \stCell|n\(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \A~combout\(3),
	datab => \stCell|flipC1T|q~regout\,
	datac => \stCell|flipB|q~regout\,
	datad => \stCell|n\(1),
	combout => \stCell|add1|cOut~0_combout\);

-- Location: LCCOMB_X64_Y24_N22
\stCell|add4|s~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \stCell|add4|s~0_combout\ = \stCell|add1|cOut~0_combout\ $ (\stCell|flipC2|q~regout\ $ (\stCell|add3|cOut~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001100101100110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stCell|add1|cOut~0_combout\,
	datab => \stCell|flipC2|q~regout\,
	datad => \stCell|add3|cOut~0_combout\,
	combout => \stCell|add4|s~0_combout\);

-- Location: LCCOMB_X64_Y24_N30
\stCell|add2|cOut~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \stCell|add2|cOut~0_combout\ = (\stCell|add3|s~combout\ & \stCell|add1|s~combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \stCell|add3|s~combout\,
	datad => \stCell|add1|s~combout\,
	combout => \stCell|add2|cOut~0_combout\);

-- Location: LCCOMB_X64_Y24_N26
\stCell|add4|cOut~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \stCell|add4|cOut~0_combout\ = (\stCell|add3|cOut~0_combout\ & ((\stCell|flipC2|q~regout\) # (\stCell|add1|cOut~0_combout\))) # (!\stCell|add3|cOut~0_combout\ & (\stCell|flipC2|q~regout\ & \stCell|add1|cOut~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \stCell|add3|cOut~0_combout\,
	datac => \stCell|flipC2|q~regout\,
	datad => \stCell|add1|cOut~0_combout\,
	combout => \stCell|add4|cOut~0_combout\);

-- Location: PIN_P2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_B(2),
	combout => \B~combout\(2));

-- Location: PIN_N1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_B(0),
	combout => \B~combout\(0));

-- Location: PIN_AC13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\M[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_M(0),
	combout => \M~combout\(0));

-- Location: PIN_V2,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(3),
	combout => \A~combout\(3));

-- Location: PIN_V1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(2),
	combout => \A~combout\(2));

-- Location: PIN_B13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\M[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_M(2),
	combout => \M~combout\(2));

-- Location: PIN_A13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\M[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_M(3),
	combout => \M~combout\(3));

-- Location: LCCOMB_X64_Y24_N16
\stCell|flipB|q~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \stCell|flipB|q~feeder_combout\ = \ndCell|flipB|q~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \ndCell|flipB|q~regout\,
	combout => \stCell|flipB|q~feeder_combout\);

-- Location: PIN_G26,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\CLK~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_CLK,
	combout => \CLK~combout\);

-- Location: PIN_C13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\M[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_M(1),
	combout => \M~combout\(1));

-- Location: LCCOMB_X64_Y28_N8
\ndCell|add3|s~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ndCell|add3|s~0_combout\ = (\M~combout\(0) & (\ndCell|flipS|q~regout\ $ (((\M~combout\(1) & \RES0|flip0|q~regout\))))) # (!\M~combout\(0) & (\M~combout\(1) & (\RES0|flip0|q~regout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110101011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \M~combout\(0),
	datab => \M~combout\(1),
	datac => \RES0|flip0|q~regout\,
	datad => \ndCell|flipS|q~regout\,
	combout => \ndCell|add3|s~0_combout\);

-- Location: LCCOMB_X64_Y27_N0
\BFF0|i[0]~93\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|i[0]~93_combout\ = !\BFF0|i\(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \BFF0|i\(0),
	combout => \BFF0|i[0]~93_combout\);

-- Location: LCFF_X64_Y27_N1
\BFF0|i[0]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|i[0]~93_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|i\(0));

-- Location: LCCOMB_X64_Y27_N2
\BFF0|i[1]~31\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|i[1]~31_combout\ = (\BFF0|i\(1) & (\BFF0|i\(0) $ (VCC))) # (!\BFF0|i\(1) & (\BFF0|i\(0) & VCC))
-- \BFF0|i[1]~32\ = CARRY((\BFF0|i\(1) & \BFF0|i\(0)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110011010001000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BFF0|i\(1),
	datab => \BFF0|i\(0),
	datad => VCC,
	combout => \BFF0|i[1]~31_combout\,
	cout => \BFF0|i[1]~32\);

-- Location: LCCOMB_X64_Y27_N4
\BFF0|i[2]~33\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|i[2]~33_combout\ = (\BFF0|i\(2) & (!\BFF0|i[1]~32\)) # (!\BFF0|i\(2) & ((\BFF0|i[1]~32\) # (GND)))
-- \BFF0|i[2]~34\ = CARRY((!\BFF0|i[1]~32\) # (!\BFF0|i\(2)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \BFF0|i\(2),
	datad => VCC,
	cin => \BFF0|i[1]~32\,
	combout => \BFF0|i[2]~33_combout\,
	cout => \BFF0|i[2]~34\);

-- Location: LCFF_X64_Y27_N5
\BFF0|i[2]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|i[2]~33_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|i\(2));

-- Location: LCCOMB_X64_Y27_N8
\BFF0|i[4]~37\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|i[4]~37_combout\ = (\BFF0|i\(4) & (!\BFF0|i[3]~36\)) # (!\BFF0|i\(4) & ((\BFF0|i[3]~36\) # (GND)))
-- \BFF0|i[4]~38\ = CARRY((!\BFF0|i[3]~36\) # (!\BFF0|i\(4)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \BFF0|i\(4),
	datad => VCC,
	cin => \BFF0|i[3]~36\,
	combout => \BFF0|i[4]~37_combout\,
	cout => \BFF0|i[4]~38\);

-- Location: LCFF_X64_Y27_N9
\BFF0|i[4]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|i[4]~37_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|i\(4));

-- Location: LCCOMB_X64_Y27_N14
\BFF0|i[7]~43\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|i[7]~43_combout\ = (\BFF0|i\(7) & (\BFF0|i[6]~42\ $ (GND))) # (!\BFF0|i\(7) & (!\BFF0|i[6]~42\ & VCC))
-- \BFF0|i[7]~44\ = CARRY((\BFF0|i\(7) & !\BFF0|i[6]~42\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \BFF0|i\(7),
	datad => VCC,
	cin => \BFF0|i[6]~42\,
	combout => \BFF0|i[7]~43_combout\,
	cout => \BFF0|i[7]~44\);

-- Location: LCFF_X64_Y27_N15
\BFF0|i[7]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|i[7]~43_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|i\(7));

-- Location: LCCOMB_X64_Y27_N18
\BFF0|i[9]~47\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|i[9]~47_combout\ = (\BFF0|i\(9) & (\BFF0|i[8]~46\ $ (GND))) # (!\BFF0|i\(9) & (!\BFF0|i[8]~46\ & VCC))
-- \BFF0|i[9]~48\ = CARRY((\BFF0|i\(9) & !\BFF0|i[8]~46\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \BFF0|i\(9),
	datad => VCC,
	cin => \BFF0|i[8]~46\,
	combout => \BFF0|i[9]~47_combout\,
	cout => \BFF0|i[9]~48\);

-- Location: LCFF_X64_Y27_N19
\BFF0|i[9]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|i[9]~47_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|i\(9));

-- Location: LCCOMB_X64_Y27_N22
\BFF0|i[11]~51\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|i[11]~51_combout\ = (\BFF0|i\(11) & (\BFF0|i[10]~50\ $ (GND))) # (!\BFF0|i\(11) & (!\BFF0|i[10]~50\ & VCC))
-- \BFF0|i[11]~52\ = CARRY((\BFF0|i\(11) & !\BFF0|i[10]~50\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \BFF0|i\(11),
	datad => VCC,
	cin => \BFF0|i[10]~50\,
	combout => \BFF0|i[11]~51_combout\,
	cout => \BFF0|i[11]~52\);

-- Location: LCFF_X64_Y27_N23
\BFF0|i[11]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|i[11]~51_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|i\(11));

-- Location: LCCOMB_X64_Y27_N24
\BFF0|i[12]~53\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|i[12]~53_combout\ = (\BFF0|i\(12) & (!\BFF0|i[11]~52\)) # (!\BFF0|i\(12) & ((\BFF0|i[11]~52\) # (GND)))
-- \BFF0|i[12]~54\ = CARRY((!\BFF0|i[11]~52\) # (!\BFF0|i\(12)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \BFF0|i\(12),
	datad => VCC,
	cin => \BFF0|i[11]~52\,
	combout => \BFF0|i[12]~53_combout\,
	cout => \BFF0|i[12]~54\);

-- Location: LCFF_X64_Y27_N25
\BFF0|i[12]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|i[12]~53_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|i\(12));

-- Location: LCCOMB_X64_Y27_N26
\BFF0|i[13]~55\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|i[13]~55_combout\ = (\BFF0|i\(13) & (\BFF0|i[12]~54\ $ (GND))) # (!\BFF0|i\(13) & (!\BFF0|i[12]~54\ & VCC))
-- \BFF0|i[13]~56\ = CARRY((\BFF0|i\(13) & !\BFF0|i[12]~54\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \BFF0|i\(13),
	datad => VCC,
	cin => \BFF0|i[12]~54\,
	combout => \BFF0|i[13]~55_combout\,
	cout => \BFF0|i[13]~56\);

-- Location: LCFF_X64_Y27_N27
\BFF0|i[13]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|i[13]~55_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|i\(13));

-- Location: LCCOMB_X64_Y27_N28
\BFF0|i[14]~57\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|i[14]~57_combout\ = (\BFF0|i\(14) & (!\BFF0|i[13]~56\)) # (!\BFF0|i\(14) & ((\BFF0|i[13]~56\) # (GND)))
-- \BFF0|i[14]~58\ = CARRY((!\BFF0|i[13]~56\) # (!\BFF0|i\(14)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \BFF0|i\(14),
	datad => VCC,
	cin => \BFF0|i[13]~56\,
	combout => \BFF0|i[14]~57_combout\,
	cout => \BFF0|i[14]~58\);

-- Location: LCFF_X64_Y27_N29
\BFF0|i[14]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|i[14]~57_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|i\(14));

-- Location: LCCOMB_X64_Y27_N30
\BFF0|i[15]~59\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|i[15]~59_combout\ = (\BFF0|i\(15) & (\BFF0|i[14]~58\ $ (GND))) # (!\BFF0|i\(15) & (!\BFF0|i[14]~58\ & VCC))
-- \BFF0|i[15]~60\ = CARRY((\BFF0|i\(15) & !\BFF0|i[14]~58\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \BFF0|i\(15),
	datad => VCC,
	cin => \BFF0|i[14]~58\,
	combout => \BFF0|i[15]~59_combout\,
	cout => \BFF0|i[15]~60\);

-- Location: LCFF_X64_Y27_N31
\BFF0|i[15]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|i[15]~59_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|i\(15));

-- Location: LCCOMB_X64_Y26_N0
\BFF0|i[16]~61\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|i[16]~61_combout\ = (\BFF0|i\(16) & (!\BFF0|i[15]~60\)) # (!\BFF0|i\(16) & ((\BFF0|i[15]~60\) # (GND)))
-- \BFF0|i[16]~62\ = CARRY((!\BFF0|i[15]~60\) # (!\BFF0|i\(16)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \BFF0|i\(16),
	datad => VCC,
	cin => \BFF0|i[15]~60\,
	combout => \BFF0|i[16]~61_combout\,
	cout => \BFF0|i[16]~62\);

-- Location: LCFF_X64_Y26_N1
\BFF0|i[16]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|i[16]~61_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|i\(16));

-- Location: LCCOMB_X64_Y26_N2
\BFF0|i[17]~63\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|i[17]~63_combout\ = (\BFF0|i\(17) & (\BFF0|i[16]~62\ $ (GND))) # (!\BFF0|i\(17) & (!\BFF0|i[16]~62\ & VCC))
-- \BFF0|i[17]~64\ = CARRY((\BFF0|i\(17) & !\BFF0|i[16]~62\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \BFF0|i\(17),
	datad => VCC,
	cin => \BFF0|i[16]~62\,
	combout => \BFF0|i[17]~63_combout\,
	cout => \BFF0|i[17]~64\);

-- Location: LCFF_X64_Y26_N3
\BFF0|i[17]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|i[17]~63_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|i\(17));

-- Location: LCCOMB_X64_Y26_N4
\BFF0|i[18]~65\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|i[18]~65_combout\ = (\BFF0|i\(18) & (!\BFF0|i[17]~64\)) # (!\BFF0|i\(18) & ((\BFF0|i[17]~64\) # (GND)))
-- \BFF0|i[18]~66\ = CARRY((!\BFF0|i[17]~64\) # (!\BFF0|i\(18)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \BFF0|i\(18),
	datad => VCC,
	cin => \BFF0|i[17]~64\,
	combout => \BFF0|i[18]~65_combout\,
	cout => \BFF0|i[18]~66\);

-- Location: LCFF_X64_Y26_N5
\BFF0|i[18]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|i[18]~65_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|i\(18));

-- Location: LCCOMB_X64_Y26_N8
\BFF0|i[20]~69\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|i[20]~69_combout\ = (\BFF0|i\(20) & (!\BFF0|i[19]~68\)) # (!\BFF0|i\(20) & ((\BFF0|i[19]~68\) # (GND)))
-- \BFF0|i[20]~70\ = CARRY((!\BFF0|i[19]~68\) # (!\BFF0|i\(20)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \BFF0|i\(20),
	datad => VCC,
	cin => \BFF0|i[19]~68\,
	combout => \BFF0|i[20]~69_combout\,
	cout => \BFF0|i[20]~70\);

-- Location: LCFF_X64_Y26_N9
\BFF0|i[20]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|i[20]~69_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|i\(20));

-- Location: LCCOMB_X64_Y26_N10
\BFF0|i[21]~71\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|i[21]~71_combout\ = (\BFF0|i\(21) & (\BFF0|i[20]~70\ $ (GND))) # (!\BFF0|i\(21) & (!\BFF0|i[20]~70\ & VCC))
-- \BFF0|i[21]~72\ = CARRY((\BFF0|i\(21) & !\BFF0|i[20]~70\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010100001010",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \BFF0|i\(21),
	datad => VCC,
	cin => \BFF0|i[20]~70\,
	combout => \BFF0|i[21]~71_combout\,
	cout => \BFF0|i[21]~72\);

-- Location: LCCOMB_X64_Y26_N12
\BFF0|i[22]~73\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|i[22]~73_combout\ = (\BFF0|i\(22) & (!\BFF0|i[21]~72\)) # (!\BFF0|i\(22) & ((\BFF0|i[21]~72\) # (GND)))
-- \BFF0|i[22]~74\ = CARRY((!\BFF0|i[21]~72\) # (!\BFF0|i\(22)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101101001011111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	dataa => \BFF0|i\(22),
	datad => VCC,
	cin => \BFF0|i[21]~72\,
	combout => \BFF0|i[22]~73_combout\,
	cout => \BFF0|i[22]~74\);

-- Location: LCCOMB_X64_Y26_N14
\BFF0|i[23]~75\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|i[23]~75_combout\ = (\BFF0|i\(23) & (\BFF0|i[22]~74\ $ (GND))) # (!\BFF0|i\(23) & (!\BFF0|i[22]~74\ & VCC))
-- \BFF0|i[23]~76\ = CARRY((\BFF0|i\(23) & !\BFF0|i[22]~74\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \BFF0|i\(23),
	datad => VCC,
	cin => \BFF0|i[22]~74\,
	combout => \BFF0|i[23]~75_combout\,
	cout => \BFF0|i[23]~76\);

-- Location: LCFF_X64_Y26_N15
\BFF0|i[23]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|i[23]~75_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|i\(23));

-- Location: LCCOMB_X64_Y26_N18
\BFF0|i[25]~79\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|i[25]~79_combout\ = (\BFF0|i\(25) & (\BFF0|i[24]~78\ $ (GND))) # (!\BFF0|i\(25) & (!\BFF0|i[24]~78\ & VCC))
-- \BFF0|i[25]~80\ = CARRY((\BFF0|i\(25) & !\BFF0|i[24]~78\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \BFF0|i\(25),
	datad => VCC,
	cin => \BFF0|i[24]~78\,
	combout => \BFF0|i[25]~79_combout\,
	cout => \BFF0|i[25]~80\);

-- Location: LCFF_X64_Y26_N19
\BFF0|i[25]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|i[25]~79_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|i\(25));

-- Location: LCCOMB_X64_Y26_N22
\BFF0|i[27]~83\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|i[27]~83_combout\ = (\BFF0|i\(27) & (\BFF0|i[26]~82\ $ (GND))) # (!\BFF0|i\(27) & (!\BFF0|i[26]~82\ & VCC))
-- \BFF0|i[27]~84\ = CARRY((\BFF0|i\(27) & !\BFF0|i[26]~82\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \BFF0|i\(27),
	datad => VCC,
	cin => \BFF0|i[26]~82\,
	combout => \BFF0|i[27]~83_combout\,
	cout => \BFF0|i[27]~84\);

-- Location: LCFF_X64_Y26_N23
\BFF0|i[27]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|i[27]~83_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|i\(27));

-- Location: LCCOMB_X64_Y26_N26
\BFF0|i[29]~87\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|i[29]~87_combout\ = (\BFF0|i\(29) & (\BFF0|i[28]~86\ $ (GND))) # (!\BFF0|i\(29) & (!\BFF0|i[28]~86\ & VCC))
-- \BFF0|i[29]~88\ = CARRY((\BFF0|i\(29) & !\BFF0|i[28]~86\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001100",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \BFF0|i\(29),
	datad => VCC,
	cin => \BFF0|i[28]~86\,
	combout => \BFF0|i[29]~87_combout\,
	cout => \BFF0|i[29]~88\);

-- Location: LCFF_X64_Y26_N27
\BFF0|i[29]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|i[29]~87_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|i\(29));

-- Location: LCCOMB_X64_Y26_N28
\BFF0|i[30]~89\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|i[30]~89_combout\ = (\BFF0|i\(30) & (!\BFF0|i[29]~88\)) # (!\BFF0|i\(30) & ((\BFF0|i[29]~88\) # (GND)))
-- \BFF0|i[30]~90\ = CARRY((!\BFF0|i[29]~88\) # (!\BFF0|i\(30)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011110000111111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datab => \BFF0|i\(30),
	datad => VCC,
	cin => \BFF0|i[29]~88\,
	combout => \BFF0|i[30]~89_combout\,
	cout => \BFF0|i[30]~90\);

-- Location: LCFF_X64_Y26_N29
\BFF0|i[30]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|i[30]~89_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|i\(30));

-- Location: LCCOMB_X64_Y26_N30
\BFF0|i[31]~91\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|i[31]~91_combout\ = \BFF0|i[30]~90\ $ (!\BFF0|i\(31))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000001111",
	sum_lutc_input => "cin")
-- pragma translate_on
PORT MAP (
	datad => \BFF0|i\(31),
	cin => \BFF0|i[30]~90\,
	combout => \BFF0|i[31]~91_combout\);

-- Location: LCFF_X64_Y26_N31
\BFF0|i[31]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|i[31]~91_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|i\(31));

-- Location: PIN_T7,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_B(3),
	combout => \B~combout\(3));

-- Location: LCFF_X64_Y27_N3
\BFF0|i[1]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|i[1]~31_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|i\(1));

-- Location: PIN_P1,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\B[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_B(1),
	combout => \B~combout\(1));

-- Location: LCCOMB_X63_Y27_N18
\BFF0|Mux0~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|Mux0~0_combout\ = (\BFF0|i\(1) & (((\BFF0|i\(0))))) # (!\BFF0|i\(1) & ((\BFF0|i\(0) & ((\B~combout\(1)))) # (!\BFF0|i\(0) & (\B~combout\(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001011000010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B~combout\(0),
	datab => \BFF0|i\(1),
	datac => \BFF0|i\(0),
	datad => \B~combout\(1),
	combout => \BFF0|Mux0~0_combout\);

-- Location: LCCOMB_X63_Y27_N8
\BFF0|Mux0~1\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|Mux0~1_combout\ = (\BFF0|i\(1) & ((\BFF0|Mux0~0_combout\ & ((\B~combout\(3)))) # (!\BFF0|Mux0~0_combout\ & (\B~combout\(2))))) # (!\BFF0|i\(1) & (((\BFF0|Mux0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \B~combout\(2),
	datab => \B~combout\(3),
	datac => \BFF0|i\(1),
	datad => \BFF0|Mux0~0_combout\,
	combout => \BFF0|Mux0~1_combout\);

-- Location: LCFF_X64_Y26_N11
\BFF0|i[21]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|i[21]~71_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|i\(21));

-- Location: LCCOMB_X63_Y26_N24
\BFF0|bOut~5\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|bOut~5_combout\ = (!\BFF0|i\(19) & (!\BFF0|i\(21) & (!\BFF0|i\(20) & !\BFF0|i\(18))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BFF0|i\(19),
	datab => \BFF0|i\(21),
	datac => \BFF0|i\(20),
	datad => \BFF0|i\(18),
	combout => \BFF0|bOut~5_combout\);

-- Location: LCFF_X64_Y26_N13
\BFF0|i[22]\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|i[22]~73_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|i\(22));

-- Location: LCCOMB_X63_Y26_N26
\BFF0|bOut~6\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|bOut~6_combout\ = (!\BFF0|i\(24) & (!\BFF0|i\(23) & (!\BFF0|i\(22) & !\BFF0|i\(25))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BFF0|i\(24),
	datab => \BFF0|i\(23),
	datac => \BFF0|i\(22),
	datad => \BFF0|i\(25),
	combout => \BFF0|bOut~6_combout\);

-- Location: LCCOMB_X63_Y26_N2
\BFF0|bOut~8\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|bOut~8_combout\ = (\BFF0|bOut~7_combout\ & (!\BFF0|i\(30) & (\BFF0|bOut~5_combout\ & \BFF0|bOut~6_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0010000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BFF0|bOut~7_combout\,
	datab => \BFF0|i\(30),
	datac => \BFF0|bOut~5_combout\,
	datad => \BFF0|bOut~6_combout\,
	combout => \BFF0|bOut~8_combout\);

-- Location: LCCOMB_X63_Y27_N12
\BFF0|bOut~9\ : cycloneii_lcell_comb
-- Equation(s):
-- \BFF0|bOut~9_combout\ = (\BFF0|Mux0~1_combout\ & ((\BFF0|i\(31)) # ((\BFF0|bOut~4_combout\ & \BFF0|bOut~8_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000011000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \BFF0|bOut~4_combout\,
	datab => \BFF0|i\(31),
	datac => \BFF0|Mux0~1_combout\,
	datad => \BFF0|bOut~8_combout\,
	combout => \BFF0|bOut~9_combout\);

-- Location: LCFF_X63_Y27_N13
\BFF0|bOut\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \BFF0|bOut~9_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \BFF0|bOut~regout\);

-- Location: LCCOMB_X63_Y27_N0
\ndCell|flipB|q~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \ndCell|flipB|q~feeder_combout\ = \BFF0|bOut~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \BFF0|bOut~regout\,
	combout => \ndCell|flipB|q~feeder_combout\);

-- Location: LCFF_X63_Y27_N1
\ndCell|flipB|q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \ndCell|flipB|q~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ndCell|flipB|q~regout\);

-- Location: PIN_U4,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(1),
	combout => \A~combout\(1));

-- Location: PIN_U3,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\A[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "input",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => GND,
	padio => ww_A(0),
	combout => \A~combout\(0));

-- Location: LCCOMB_X63_Y27_N2
\ndCell|n[1]\ : cycloneii_lcell_comb
-- Equation(s):
-- \ndCell|n\(1) = (\A~combout\(0) & \BFF0|bOut~regout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \A~combout\(0),
	datad => \BFF0|bOut~regout\,
	combout => \ndCell|n\(1));

-- Location: LCCOMB_X64_Y28_N10
\ndCell|add1|s\ : cycloneii_lcell_comb
-- Equation(s):
-- \ndCell|add1|s~combout\ = \ndCell|flipC1T|q~regout\ $ (\ndCell|n\(1) $ (((\ndCell|flipB|q~regout\ & \A~combout\(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1001010101101010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \ndCell|flipC1T|q~regout\,
	datab => \ndCell|flipB|q~regout\,
	datac => \A~combout\(1),
	datad => \ndCell|n\(1),
	combout => \ndCell|add1|s~combout\);

-- Location: LCCOMB_X64_Y28_N28
\ndCell|add2|cOut~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ndCell|add2|cOut~0_combout\ = (\stCell|flipS|q~regout\ & ((\ndCell|add1|s~combout\) # (\ndCell|add3|s~0_combout\ $ (\ndCell|flipC1B|q~regout\)))) # (!\stCell|flipS|q~regout\ & (\ndCell|add1|s~combout\ & (\ndCell|add3|s~0_combout\ $ 
-- (\ndCell|flipC1B|q~regout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1011111000101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stCell|flipS|q~regout\,
	datab => \ndCell|add3|s~0_combout\,
	datac => \ndCell|flipC1B|q~regout\,
	datad => \ndCell|add1|s~combout\,
	combout => \ndCell|add2|cOut~0_combout\);

-- Location: LCFF_X64_Y28_N29
\ndCell|flipC1B|q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \ndCell|add2|cOut~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ndCell|flipC1B|q~regout\);

-- Location: LCCOMB_X64_Y28_N22
\ndCell|add2|s~0\ : cycloneii_lcell_comb
-- Equation(s):
-- \ndCell|add2|s~0_combout\ = \stCell|flipS|q~regout\ $ (\ndCell|flipC1B|q~regout\ $ (\ndCell|add3|s~0_combout\ $ (\ndCell|add1|s~combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0110100110010110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \stCell|flipS|q~regout\,
	datab => \ndCell|flipC1B|q~regout\,
	datac => \ndCell|add3|s~0_combout\,
	datad => \ndCell|add1|s~combout\,
	combout => \ndCell|add2|s~0_combout\);

-- Location: LCFF_X64_Y28_N23
\ndCell|flipS|q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \ndCell|add2|s~0_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \ndCell|flipS|q~regout\);

-- Location: LCFF_X64_Y28_N9
\RES0|flip0|q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	sdata => \ndCell|flipS|q~regout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \RES0|flip0|q~regout\);

-- Location: LCCOMB_X64_Y24_N0
\stCell|flipQ|q~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \stCell|flipQ|q~feeder_combout\ = \RES0|flip0|q~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \RES0|flip0|q~regout\,
	combout => \stCell|flipQ|q~feeder_combout\);

-- Location: LCFF_X64_Y24_N1
\stCell|flipQ|q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \stCell|flipQ|q~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \stCell|flipQ|q~regout\);

-- Location: LCCOMB_X64_Y24_N14
\RES0|floop:1:FFi|q~feeder\ : cycloneii_lcell_comb
-- Equation(s):
-- \RES0|floop:1:FFi|q~feeder_combout\ = \stCell|flipQ|q~regout\

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => \stCell|flipQ|q~regout\,
	combout => \RES0|floop:1:FFi|q~feeder_combout\);

-- Location: LCFF_X64_Y24_N15
\RES0|floop:1:FFi|q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	datain => \RES0|floop:1:FFi|q~feeder_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \RES0|floop:1:FFi|q~regout\);

-- Location: LCFF_X64_Y24_N25
\RES0|floop:0:FFi|q\ : cycloneii_lcell_ff
PORT MAP (
	clk => \CLK~combout\,
	sdata => \RES0|floop:1:FFi|q~regout\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \RES0|floop:0:FFi|q~regout\);

-- Location: PIN_AE23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\RES[0]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \RES0|floop:0:FFi|q~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_RES(0));

-- Location: PIN_AF23,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\RES[1]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \RES0|floop:1:FFi|q~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_RES(1));

-- Location: PIN_AB21,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\RES[2]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \stCell|flipQ|q~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_RES(2));

-- Location: PIN_AC22,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\RES[3]~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \RES0|flip0|q~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_RES(3));

-- Location: PIN_Y12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 24mA
\bMoni~I\ : cycloneii_io
-- pragma translate_off
GENERIC MAP (
	input_async_reset => "none",
	input_power_up => "low",
	input_register_mode => "none",
	input_sync_reset => "none",
	oe_async_reset => "none",
	oe_power_up => "low",
	oe_register_mode => "none",
	oe_sync_reset => "none",
	operation_mode => "output",
	output_async_reset => "none",
	output_power_up => "low",
	output_register_mode => "none",
	output_sync_reset => "none")
-- pragma translate_on
PORT MAP (
	datain => \BFF0|bOut~regout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	devoe => ww_devoe,
	oe => VCC,
	padio => ww_bMoni);
END structure;


