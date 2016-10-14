----------------------------------------------------------------
--说明：这里是按键矩阵的主控制台，所有外部按键引用都应该通过这里而不是--
--内部元件。-----------------------------------------------------
----------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY BTN_ARRAY IS
  PORT(
  COUNTER_CLK_IN:IN STD_LOGIC;
  SCANNER_CLK_IN:IN STD_LOGIC;
  KBROW0:IN STD_LOGIC;
  KBROW1:IN STD_LOGIC;
  KBROW2:IN STD_LOGIC;
  KBROW3:IN STD_LOGIC;
  BTN_ROW0_OUT:OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  BTN_ROW1_OUT:OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  BTN_ROW2_OUT:OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  BTN_ROW3_OUT:OUT STD_LOGIC_VECTOR(3 DOWNTO 0);
  KBROW_OUT:BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0);
  KBCOL_OUT:OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END ENTITY BTN_ARRAY;

ARCHITECTURE BEHAVE OF BTN_ARRAY IS
  COMPONENT BTN_SCAN_COL IS
    PORT(
      CLK_IN:IN STD_LOGIC;
      SCAN_COUNT:BUFFER INTEGER RANGE 0 TO 3;
      KBCOL_OUT:OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
     );
   END COMPONENT;
	
	COMPONENT BTN_DETECT IS
	  PORT(
	    KBROW0:IN STD_LOGIC;
	    KBROW1:IN STD_LOGIC;
	    KBROW2:IN STD_LOGIC;
	    KBROW3:IN STD_LOGIC;
	    KBROW_OUT:BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0)
	  );
	END COMPONENT;
	
	COMPONENT BTN_DEBOUNCING IS
	  PORT(
       BTN_IN:IN STD_LOGIC;
       BTN_OUT:BUFFER STD_LOGIC;
       COUNTER_EN_OUT:BUFFER STD_LOGIC;
       COUNTER_STATE_IN:IN STD_LOGIC
     );
	END COMPONENT;
	
	COMPONENT BTN_COUNTER IS
     PORT(
       CLK_IN:IN STD_LOGIC;
       EN_IN:IN STD_LOGIC;
       STATE_OUT:BUFFER STD_LOGIC
     );
   END COMPONENT;
	


SIGNAL COUNT:INTEGER RANGE 0 TO 3;
SIGNAL KBROW0_PROCESSED:STD_LOGIC;
SIGNAL KBROW1_PROCESSED:STD_LOGIC;
SIGNAL KBROW2_PROCESSED:STD_LOGIC;
SIGNAL KBROW3_PROCESSED:STD_LOGIC;
SIGNAL R0_COUNTER_EN:STD_LOGIC;
SIGNAL R1_COUNTER_EN:STD_LOGIC;
SIGNAL R2_COUNTER_EN:STD_LOGIC;
SIGNAL R3_COUNTER_EN:STD_LOGIC;
SIGNAL R0_COUNTER_STATE:STD_LOGIC;
SIGNAL R1_COUNTER_STATE:STD_LOGIC;
SIGNAL R2_COUNTER_STATE:STD_LOGIC;
SIGNAL R3_COUNTER_STATE:STD_LOGIC;
SIGNAL BTN_DETECT_ROW_RESULT:STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL SCANNER_COUNT:INTEGER RANGE 0 TO 3;
BEGIN
  ROW0_DEBOUNCING:BTN_DEBOUNCING
    PORT MAP(
	   BTN_IN => KBROW0,
		BTN_OUT => KBROW0_PROCESSED,
		COUNTER_EN_OUT => R0_COUNTER_EN,
		COUNTER_STATE_IN => R0_COUNTER_STATE
  );
  ROW1_DEBOUNCING:BTN_DEBOUNCING
    PORT MAP(
	   BTN_IN => KBROW1,
		BTN_OUT => KBROW1_PROCESSED,
		COUNTER_EN_OUT => R1_COUNTER_EN,
		COUNTER_STATE_IN => R1_COUNTER_STATE
  );
  ROW2_DEBOUNCING:BTN_DEBOUNCING
    PORT MAP(
	   BTN_IN => KBROW2,
		BTN_OUT => KBROW2_PROCESSED,
		COUNTER_EN_OUT => R2_COUNTER_EN,
		COUNTER_STATE_IN => R2_COUNTER_STATE
  );
  ROW3_DEBOUNCING:BTN_DEBOUNCING
    PORT MAP(
	   BTN_IN => KBROW3,
		BTN_OUT => KBROW3_PROCESSED,
		COUNTER_EN_OUT => R3_COUNTER_EN,
		COUNTER_STATE_IN => R3_COUNTER_STATE
  );
  ROW0_COUNTER:BTN_COUNTER
    PORT MAP(
	   CLK_IN => COUNTER_CLK_IN,
		EN_IN => R0_COUNTER_EN,
		STATE_OUT => R0_COUNTER_STATE
  );
  ROW1_COUNTER:BTN_COUNTER
    PORT MAP(
	   CLK_IN => COUNTER_CLK_IN,
		EN_IN => R1_COUNTER_EN,
		STATE_OUT => R1_COUNTER_STATE
  );
  ROW2_COUNTER:BTN_COUNTER
    PORT MAP(
	   CLK_IN => COUNTER_CLK_IN,
		EN_IN => R2_COUNTER_EN,
		STATE_OUT => R2_COUNTER_STATE
  );
  ROW3_COUNTER:BTN_COUNTER
    PORT MAP(
	   CLK_IN => COUNTER_CLK_IN,
		EN_IN => R3_COUNTER_EN,
		STATE_OUT => R3_COUNTER_STATE
  );
  DETECTOR:BTN_DETECT
    PORT MAP(
	   KBROW0 => KBROW0_PROCESSED,
		KBROW1 => KBROW1_PROCESSED,
		KBROW2 => KBROW2_PROCESSED,
		KBROW3 => KBROW3_PROCESSED,
		KBROW_OUT => BTN_DETECT_ROW_RESULT
	 );
   SCANNER:BTN_SCAN_COL
     PORT MAP(
	    CLK_IN => SCANNER_CLK_IN,
		 SCAN_COUNT => SCANNER_COUNT,
		 KBCOL_OUT => KBCOL_OUT
	  );	
	PROCESS(SCANNER_COUNT,BTN_DETECT_ROW_RESULT(0))
   BEGIN
     CASE SCANNER_COUNT IS
	    WHEN 0 => BTN_ROW0_OUT(0) <= BTN_DETECT_ROW_RESULT(0); 
		 WHEN 1 => BTN_ROW1_OUT(0) <= BTN_DETECT_ROW_RESULT(0) ; 
		 WHEN 2 => BTN_ROW2_OUT(0) <= BTN_DETECT_ROW_RESULT(0); 
		 WHEN 3 => BTN_ROW3_OUT(0) <= BTN_DETECT_ROW_RESULT(0); 
		 WHEN OTHERS =>
	  END CASE;
   END PROCESS;
	
	PROCESS(SCANNER_COUNT,BTN_DETECT_ROW_RESULT(1))
   BEGIN
     CASE SCANNER_COUNT IS
	    WHEN 0 => BTN_ROW0_OUT(1) <= BTN_DETECT_ROW_RESULT(1); 
		 WHEN 1 => BTN_ROW1_OUT(1) <= BTN_DETECT_ROW_RESULT(1); 
		 WHEN 2 => BTN_ROW2_OUT(1) <= BTN_DETECT_ROW_RESULT(1); 
		 WHEN 3 => BTN_ROW3_OUT(1) <= BTN_DETECT_ROW_RESULT(1); 
		 WHEN OTHERS =>
	  END CASE;
   END PROCESS;
	
	PROCESS(SCANNER_COUNT,BTN_DETECT_ROW_RESULT(2))
   BEGIN
     CASE SCANNER_COUNT IS
	    WHEN 0 => BTN_ROW0_OUT(2) <= BTN_DETECT_ROW_RESULT(2); 
		 WHEN 1 => BTN_ROW1_OUT(2) <= BTN_DETECT_ROW_RESULT(2); 
		 WHEN 2 => BTN_ROW2_OUT(2) <= BTN_DETECT_ROW_RESULT(2); 
		 WHEN 3 => BTN_ROW3_OUT(2) <= BTN_DETECT_ROW_RESULT(2); 
		 WHEN OTHERS =>
	  END CASE;
   END PROCESS;
	
	PROCESS(SCANNER_COUNT,BTN_DETECT_ROW_RESULT(3))
   BEGIN
     CASE SCANNER_COUNT IS
	    WHEN 0 => BTN_ROW0_OUT(3) <= BTN_DETECT_ROW_RESULT(3); 
		 WHEN 1 => BTN_ROW1_OUT(3) <= BTN_DETECT_ROW_RESULT(3); 
		 WHEN 2 => BTN_ROW2_OUT(3) <= BTN_DETECT_ROW_RESULT(3); 
		 WHEN 3 => BTN_ROW3_OUT(3) <= BTN_DETECT_ROW_RESULT(3); 
		 WHEN OTHERS =>
	  END CASE;
   END PROCESS;

END BEHAVE;