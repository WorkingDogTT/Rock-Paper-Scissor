-- Copyright (C) 1991-2015 Altera Corporation. All rights reserved.
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, the Altera Quartus Prime License Agreement,
-- the Altera MegaCore Function License Agreement, or other 
-- applicable license agreement, including, without limitation, 
-- that your use is for the sole purpose of programming logic 
-- devices manufactured by Altera and sold by Altera or its 
-- authorized distributors.  Please refer to the applicable 
-- agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus Prime"
-- VERSION "Version 15.1.0 Build 185 10/21/2015 SJ Standard Edition"

-- DATE "10/12/2016 16:32:37"

-- 
-- Device: Altera EPM1270T144C5 Package TQFP144
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY IEEE;
LIBRARY MAXII;
USE IEEE.STD_LOGIC_1164.ALL;
USE MAXII.MAXII_COMPONENTS.ALL;

ENTITY 	DIVIDER_SERIAL IS
    PORT (
	CLK_IN : IN std_logic;
	CLK_512Hz : BUFFER std_logic;
	CLK_64Hz : BUFFER std_logic;
	CLK_8Hz : BUFFER std_logic;
	CLK_1Hz : BUFFER std_logic
	);
END DIVIDER_SERIAL;

-- Design Ports Information


ARCHITECTURE structure OF DIVIDER_SERIAL IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_CLK_IN : std_logic;
SIGNAL ww_CLK_512Hz : std_logic;
SIGNAL ww_CLK_64Hz : std_logic;
SIGNAL ww_CLK_8Hz : std_logic;
SIGNAL ww_CLK_1Hz : std_logic;
SIGNAL \CLK_IN~combout\ : std_logic;
SIGNAL \CLK_512Hz~reg0_regout\ : std_logic;
SIGNAL \CLK_64Hz~reg0_regout\ : std_logic;
SIGNAL \CLK_8Hz~reg0_regout\ : std_logic;
SIGNAL \CLK_1Hz~reg0_regout\ : std_logic;
SIGNAL COUNT_1 : std_logic_vector(1 DOWNTO 0);
SIGNAL COUNT_2 : std_logic_vector(1 DOWNTO 0);
SIGNAL COUNT_3 : std_logic_vector(1 DOWNTO 0);
SIGNAL \ALT_INV_CLK_IN~combout\ : std_logic;
SIGNAL \ALT_INV_CLK_8Hz~reg0_regout\ : std_logic;
SIGNAL \ALT_INV_CLK_64Hz~reg0_regout\ : std_logic;
SIGNAL \ALT_INV_CLK_512Hz~reg0_regout\ : std_logic;

BEGIN

ww_CLK_IN <= CLK_IN;
CLK_512Hz <= ww_CLK_512Hz;
CLK_64Hz <= ww_CLK_64Hz;
CLK_8Hz <= ww_CLK_8Hz;
CLK_1Hz <= ww_CLK_1Hz;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_CLK_IN~combout\ <= NOT \CLK_IN~combout\;
\ALT_INV_CLK_8Hz~reg0_regout\ <= NOT \CLK_8Hz~reg0_regout\;
\ALT_INV_CLK_64Hz~reg0_regout\ <= NOT \CLK_64Hz~reg0_regout\;
\ALT_INV_CLK_512Hz~reg0_regout\ <= NOT \CLK_512Hz~reg0_regout\;

-- Location: PIN_78,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\CLK_IN~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_CLK_IN,
	combout => \CLK_IN~combout\);

-- Location: LC_X16_Y3_N2
\CLK_512Hz~reg0\ : maxii_lcell
-- Equation(s):
-- \CLK_512Hz~reg0_regout\ = DFFEAS((((!\CLK_512Hz~reg0_regout\))), !\CLK_IN~combout\, VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_IN~combout\,
	datad => \CLK_512Hz~reg0_regout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CLK_512Hz~reg0_regout\);

-- Location: LC_X12_Y3_N7
\COUNT_1[0]\ : maxii_lcell
-- Equation(s):
-- COUNT_1(0) = DFFEAS((((!COUNT_1(0)))), !GLOBAL(\CLK_512Hz~reg0_regout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f0f",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_512Hz~reg0_regout\,
	datac => COUNT_1(0),
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => COUNT_1(0));

-- Location: LC_X12_Y3_N8
\COUNT_1[1]\ : maxii_lcell
-- Equation(s):
-- COUNT_1(1) = DFFEAS(((COUNT_1(0) $ (COUNT_1(1)))), !GLOBAL(\CLK_512Hz~reg0_regout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0ff0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_512Hz~reg0_regout\,
	datac => COUNT_1(0),
	datad => COUNT_1(1),
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => COUNT_1(1));

-- Location: LC_X12_Y3_N1
\CLK_64Hz~reg0\ : maxii_lcell
-- Equation(s):
-- \CLK_64Hz~reg0_regout\ = DFFEAS((\CLK_64Hz~reg0_regout\ $ (((COUNT_1(0) & COUNT_1(1))))), !GLOBAL(\CLK_512Hz~reg0_regout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3ccc",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_512Hz~reg0_regout\,
	datab => \CLK_64Hz~reg0_regout\,
	datac => COUNT_1(0),
	datad => COUNT_1(1),
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CLK_64Hz~reg0_regout\);

-- Location: LC_X12_Y3_N4
\COUNT_2[0]\ : maxii_lcell
-- Equation(s):
-- COUNT_2(0) = DFFEAS((((!COUNT_2(0)))), !GLOBAL(\CLK_64Hz~reg0_regout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0f0f",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_64Hz~reg0_regout\,
	datac => COUNT_2(0),
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => COUNT_2(0));

-- Location: LC_X12_Y3_N2
\COUNT_2[1]\ : maxii_lcell
-- Equation(s):
-- COUNT_2(1) = DFFEAS(((COUNT_2(0) $ (COUNT_2(1)))), !GLOBAL(\CLK_64Hz~reg0_regout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0ff0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_64Hz~reg0_regout\,
	datac => COUNT_2(0),
	datad => COUNT_2(1),
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => COUNT_2(1));

-- Location: LC_X12_Y3_N9
\CLK_8Hz~reg0\ : maxii_lcell
-- Equation(s):
-- \CLK_8Hz~reg0_regout\ = DFFEAS((\CLK_8Hz~reg0_regout\ $ (((COUNT_2(0) & COUNT_2(1))))), !GLOBAL(\CLK_64Hz~reg0_regout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3ccc",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_64Hz~reg0_regout\,
	datab => \CLK_8Hz~reg0_regout\,
	datac => COUNT_2(0),
	datad => COUNT_2(1),
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CLK_8Hz~reg0_regout\);

-- Location: LC_X13_Y10_N8
\COUNT_3[0]\ : maxii_lcell
-- Equation(s):
-- COUNT_3(0) = DFFEAS((((!COUNT_3(0)))), !GLOBAL(\CLK_8Hz~reg0_regout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "00ff",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_8Hz~reg0_regout\,
	datad => COUNT_3(0),
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => COUNT_3(0));

-- Location: LC_X13_Y10_N6
\COUNT_3[1]\ : maxii_lcell
-- Equation(s):
-- COUNT_3(1) = DFFEAS(((COUNT_3(1) $ (COUNT_3(0)))), !GLOBAL(\CLK_8Hz~reg0_regout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0ff0",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_8Hz~reg0_regout\,
	datac => COUNT_3(1),
	datad => COUNT_3(0),
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => COUNT_3(1));

-- Location: LC_X13_Y10_N9
\CLK_1Hz~reg0\ : maxii_lcell
-- Equation(s):
-- \CLK_1Hz~reg0_regout\ = DFFEAS((\CLK_1Hz~reg0_regout\ $ (((COUNT_3(1) & COUNT_3(0))))), !GLOBAL(\CLK_8Hz~reg0_regout\), VCC, , , , , , )

-- pragma translate_off
GENERIC MAP (
	lut_mask => "3ccc",
	operation_mode => "normal",
	output_mode => "reg_only",
	register_cascade_mode => "off",
	sum_lutc_input => "datac",
	synch_mode => "off")
-- pragma translate_on
PORT MAP (
	clk => \ALT_INV_CLK_8Hz~reg0_regout\,
	datab => \CLK_1Hz~reg0_regout\,
	datac => COUNT_3(1),
	datad => COUNT_3(0),
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \CLK_1Hz~reg0_regout\);

-- Location: PIN_80,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\CLK_512Hz~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \CLK_512Hz~reg0_regout\,
	oe => VCC,
	padio => ww_CLK_512Hz);

-- Location: PIN_63,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\CLK_64Hz~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \CLK_64Hz~reg0_regout\,
	oe => VCC,
	padio => ww_CLK_64Hz);

-- Location: PIN_62,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\CLK_8Hz~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \CLK_8Hz~reg0_regout\,
	oe => VCC,
	padio => ww_CLK_8Hz);

-- Location: PIN_113,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\CLK_1Hz~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \CLK_1Hz~reg0_regout\,
	oe => VCC,
	padio => ww_CLK_1Hz);
END structure;


