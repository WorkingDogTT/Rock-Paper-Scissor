-------------------------------------------------------------------------------------------------------
--这里是矩阵键盘的按列扫描，由时钟沿触发，每次触发就有某一列变为0，此时等待行信号即可整合得到当前按下的是某行某列了--
--为了配合中央处理需要加一级转换器，将按列取得的信号转为按行输出                                             --
-------------------------------------------------------------------------------------------------------

LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY BTN_SCAN_COL IS
  PORT(
  CLK_IN:IN STD_LOGIC;
  SCAN_COUNT:BUFFER INTEGER RANGE 0 TO 3;
  KBCOL_OUT:OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END ENTITY BTN_SCAN_COL;
ARCHITECTURE BEHAVE OF BTN_SCAN_COL IS
BEGIN
  PROCESS(CLK_IN)
  BEGIN
    IF CLK_IN'EVENT AND CLK_IN='0' THEN
	    IF SCAN_COUNT >= 3 THEN 
		    SCAN_COUNT <= 0;
		 ELSE 
		    SCAN_COUNT <= SCAN_COUNT + 1;
		 END IF;
	 END IF;
  END PROCESS;
  
  PROCESS(SCAN_COUNT)
  BEGIN
    CASE SCAN_COUNT IS
	   WHEN 0 => KBCOL_OUT <= "0111";
		WHEN 1 => KBCOL_OUT <= "1011";
		WHEN 2 => KBCOL_OUT <= "1101";
		WHEN 3 => KBCOL_OUT <= "1110";
	 END CASE;
  END PROCESS;
END BEHAVE;