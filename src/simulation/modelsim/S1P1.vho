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

-- DATE "10/12/2016 21:22:59"

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

ENTITY 	DIVIDER IS
    PORT (
	F_1KHZ : BUFFER std_logic;
	F_512HZ : BUFFER std_logic;
	F_256HZ : BUFFER std_logic;
	F_128HZ : BUFFER std_logic;
	F_64HZ : BUFFER std_logic;
	F_32HZ : BUFFER std_logic;
	F_16HZ : BUFFER std_logic;
	F_8HZ : BUFFER std_logic;
	F_4HZ : BUFFER std_logic;
	F_2HZ : BUFFER std_logic;
	F_1HZ : BUFFER std_logic;
	CLK_IN : IN std_logic
	);
END DIVIDER;

-- Design Ports Information


ARCHITECTURE structure OF DIVIDER IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_F_1KHZ : std_logic;
SIGNAL ww_F_512HZ : std_logic;
SIGNAL ww_F_256HZ : std_logic;
SIGNAL ww_F_128HZ : std_logic;
SIGNAL ww_F_64HZ : std_logic;
SIGNAL ww_F_32HZ : std_logic;
SIGNAL ww_F_16HZ : std_logic;
SIGNAL ww_F_8HZ : std_logic;
SIGNAL ww_F_4HZ : std_logic;
SIGNAL ww_F_2HZ : std_logic;
SIGNAL ww_F_1HZ : std_logic;
SIGNAL ww_CLK_IN : std_logic;
SIGNAL \CLK_IN~combout\ : std_logic;
SIGNAL \F_512HZ~reg0_regout\ : std_logic;
SIGNAL \F_256HZ~reg0_regout\ : std_logic;
SIGNAL \F_128HZ~reg0_regout\ : std_logic;
SIGNAL \F_64HZ~reg0_regout\ : std_logic;
SIGNAL \F_32HZ~reg0_regout\ : std_logic;
SIGNAL \F_16HZ~reg0_regout\ : std_logic;
SIGNAL \F_8HZ~reg0_regout\ : std_logic;
SIGNAL \F_4HZ~reg0_regout\ : std_logic;
SIGNAL \F_2HZ~reg0_regout\ : std_logic;
SIGNAL \F_1HZ~reg0_regout\ : std_logic;
SIGNAL \ALT_INV_CLK_IN~combout\ : std_logic;
SIGNAL \ALT_INV_F_512HZ~reg0_regout\ : std_logic;
SIGNAL \ALT_INV_F_256HZ~reg0_regout\ : std_logic;
SIGNAL \ALT_INV_F_128HZ~reg0_regout\ : std_logic;
SIGNAL \ALT_INV_F_64HZ~reg0_regout\ : std_logic;
SIGNAL \ALT_INV_F_32HZ~reg0_regout\ : std_logic;
SIGNAL \ALT_INV_F_16HZ~reg0_regout\ : std_logic;
SIGNAL \ALT_INV_F_8HZ~reg0_regout\ : std_logic;
SIGNAL \ALT_INV_F_4HZ~reg0_regout\ : std_logic;
SIGNAL \ALT_INV_F_2HZ~reg0_regout\ : std_logic;

BEGIN

F_1KHZ <= ww_F_1KHZ;
F_512HZ <= ww_F_512HZ;
F_256HZ <= ww_F_256HZ;
F_128HZ <= ww_F_128HZ;
F_64HZ <= ww_F_64HZ;
F_32HZ <= ww_F_32HZ;
F_16HZ <= ww_F_16HZ;
F_8HZ <= ww_F_8HZ;
F_4HZ <= ww_F_4HZ;
F_2HZ <= ww_F_2HZ;
F_1HZ <= ww_F_1HZ;
ww_CLK_IN <= CLK_IN;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;
\ALT_INV_CLK_IN~combout\ <= NOT \CLK_IN~combout\;
\ALT_INV_F_512HZ~reg0_regout\ <= NOT \F_512HZ~reg0_regout\;
\ALT_INV_F_256HZ~reg0_regout\ <= NOT \F_256HZ~reg0_regout\;
\ALT_INV_F_128HZ~reg0_regout\ <= NOT \F_128HZ~reg0_regout\;
\ALT_INV_F_64HZ~reg0_regout\ <= NOT \F_64HZ~reg0_regout\;
\ALT_INV_F_32HZ~reg0_regout\ <= NOT \F_32HZ~reg0_regout\;
\ALT_INV_F_16HZ~reg0_regout\ <= NOT \F_16HZ~reg0_regout\;
\ALT_INV_F_8HZ~reg0_regout\ <= NOT \F_8HZ~reg0_regout\;
\ALT_INV_F_4HZ~reg0_regout\ <= NOT \F_4HZ~reg0_regout\;
\ALT_INV_F_2HZ~reg0_regout\ <= NOT \F_2HZ~reg0_regout\;

-- Location: PIN_12,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: Default
\CLK_IN~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "input")
-- pragma translate_on
PORT MAP (
	oe => GND,
	padio => ww_CLK_IN,
	combout => \CLK_IN~combout\);

-- Location: LC_X1_Y7_N4
\F_512HZ~reg0\ : maxii_lcell
-- Equation(s):
-- \F_512HZ~reg0_regout\ = DFFEAS((((!\F_512HZ~reg0_regout\))), !\CLK_IN~combout\, VCC, , , , , , )

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
	clk => \ALT_INV_CLK_IN~combout\,
	datac => \F_512HZ~reg0_regout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \F_512HZ~reg0_regout\);

-- Location: LC_X1_Y7_N2
\F_256HZ~reg0\ : maxii_lcell
-- Equation(s):
-- \F_256HZ~reg0_regout\ = DFFEAS((((!\F_256HZ~reg0_regout\))), !\F_512HZ~reg0_regout\, VCC, , , , , , )

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
	clk => \ALT_INV_F_512HZ~reg0_regout\,
	datad => \F_256HZ~reg0_regout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \F_256HZ~reg0_regout\);

-- Location: LC_X2_Y7_N9
\F_128HZ~reg0\ : maxii_lcell
-- Equation(s):
-- \F_128HZ~reg0_regout\ = DFFEAS((((!\F_128HZ~reg0_regout\))), !\F_256HZ~reg0_regout\, VCC, , , , , , )

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
	clk => \ALT_INV_F_256HZ~reg0_regout\,
	datad => \F_128HZ~reg0_regout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \F_128HZ~reg0_regout\);

-- Location: LC_X2_Y7_N8
\F_64HZ~reg0\ : maxii_lcell
-- Equation(s):
-- \F_64HZ~reg0_regout\ = DFFEAS((((!\F_64HZ~reg0_regout\))), !\F_128HZ~reg0_regout\, VCC, , , , , , )

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
	clk => \ALT_INV_F_128HZ~reg0_regout\,
	datad => \F_64HZ~reg0_regout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \F_64HZ~reg0_regout\);

-- Location: LC_X3_Y7_N8
\F_32HZ~reg0\ : maxii_lcell
-- Equation(s):
-- \F_32HZ~reg0_regout\ = DFFEAS((((!\F_32HZ~reg0_regout\))), !\F_64HZ~reg0_regout\, VCC, , , , , , )

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
	clk => \ALT_INV_F_64HZ~reg0_regout\,
	datad => \F_32HZ~reg0_regout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \F_32HZ~reg0_regout\);

-- Location: LC_X3_Y7_N9
\F_16HZ~reg0\ : maxii_lcell
-- Equation(s):
-- \F_16HZ~reg0_regout\ = DFFEAS((((!\F_16HZ~reg0_regout\))), !\F_32HZ~reg0_regout\, VCC, , , , , , )

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
	clk => \ALT_INV_F_32HZ~reg0_regout\,
	datad => \F_16HZ~reg0_regout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \F_16HZ~reg0_regout\);

-- Location: LC_X2_Y5_N5
\F_8HZ~reg0\ : maxii_lcell
-- Equation(s):
-- \F_8HZ~reg0_regout\ = DFFEAS((((!\F_8HZ~reg0_regout\))), !\F_16HZ~reg0_regout\, VCC, , , , , , )

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
	clk => \ALT_INV_F_16HZ~reg0_regout\,
	datac => \F_8HZ~reg0_regout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \F_8HZ~reg0_regout\);

-- Location: LC_X2_Y5_N9
\F_4HZ~reg0\ : maxii_lcell
-- Equation(s):
-- \F_4HZ~reg0_regout\ = DFFEAS((((!\F_4HZ~reg0_regout\))), !\F_8HZ~reg0_regout\, VCC, , , , , , )

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
	clk => \ALT_INV_F_8HZ~reg0_regout\,
	datad => \F_4HZ~reg0_regout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \F_4HZ~reg0_regout\);

-- Location: LC_X1_Y5_N8
\F_2HZ~reg0\ : maxii_lcell
-- Equation(s):
-- \F_2HZ~reg0_regout\ = DFFEAS((((!\F_2HZ~reg0_regout\))), !\F_4HZ~reg0_regout\, VCC, , , , , , )

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
	clk => \ALT_INV_F_4HZ~reg0_regout\,
	datad => \F_2HZ~reg0_regout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \F_2HZ~reg0_regout\);

-- Location: LC_X1_Y5_N9
\F_1HZ~reg0\ : maxii_lcell
-- Equation(s):
-- \F_1HZ~reg0_regout\ = DFFEAS((((!\F_1HZ~reg0_regout\))), !\F_2HZ~reg0_regout\, VCC, , , , , , )

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
	clk => \ALT_INV_F_2HZ~reg0_regout\,
	datad => \F_1HZ~reg0_regout\,
	aclr => GND,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	regout => \F_1HZ~reg0_regout\);

-- Location: PIN_16,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\F_1KHZ~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \CLK_IN~combout\,
	oe => VCC,
	padio => ww_F_1KHZ);

-- Location: PIN_14,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\F_512HZ~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \F_512HZ~reg0_regout\,
	oe => VCC,
	padio => ww_F_512HZ);

-- Location: PIN_20,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\F_256HZ~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \F_256HZ~reg0_regout\,
	oe => VCC,
	padio => ww_F_256HZ);

-- Location: PIN_13,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\F_128HZ~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \F_128HZ~reg0_regout\,
	oe => VCC,
	padio => ww_F_128HZ);

-- Location: PIN_15,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\F_64HZ~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \F_64HZ~reg0_regout\,
	oe => VCC,
	padio => ww_F_64HZ);

-- Location: PIN_18,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\F_32HZ~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \F_32HZ~reg0_regout\,
	oe => VCC,
	padio => ww_F_32HZ);

-- Location: PIN_24,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\F_16HZ~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \F_16HZ~reg0_regout\,
	oe => VCC,
	padio => ww_F_16HZ);

-- Location: PIN_38,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\F_8HZ~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \F_8HZ~reg0_regout\,
	oe => VCC,
	padio => ww_F_8HZ);

-- Location: PIN_30,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\F_4HZ~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \F_4HZ~reg0_regout\,
	oe => VCC,
	padio => ww_F_4HZ);

-- Location: PIN_29,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\F_2HZ~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \F_2HZ~reg0_regout\,
	oe => VCC,
	padio => ww_F_2HZ);

-- Location: PIN_28,	 I/O Standard: 3.3-V LVTTL,	 Current Strength: 16mA
\F_1HZ~I\ : maxii_io
-- pragma translate_off
GENERIC MAP (
	operation_mode => "output")
-- pragma translate_on
PORT MAP (
	datain => \F_1HZ~reg0_regout\,
	oe => VCC,
	padio => ww_F_1HZ);
END structure;


