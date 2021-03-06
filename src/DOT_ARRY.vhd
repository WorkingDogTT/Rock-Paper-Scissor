--------------------------------------------------
--                    说明                      --
--       这里是8X8点阵的宏模块                    --
--      所有外部电路控制点阵以该模块为准            --
--****警告：外部电路不应该调用该模块的内部器件   ****--
--**********************************************--
--------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY DOT_ARRY  IS
  PORT(
  CLK_IN :IN STD_LOGIC;
  ROW_OUT:OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
  RED_COL_OUT:OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
  GREEN_COL_OUT:OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
  U1_MODE_CONTROL:IN INTEGER RANGE 0 TO 7;
  U2_MODE_CONTROL:IN INTEGER RANGE 0 TO 7;
  RED_EN:IN STD_LOGIC;
  GREEN_EN:IN STD_LOGIC
  );
END ENTITY DOT_ARRY;
ARCHITECTURE BEHAVE OF DOT_ARRY IS
  COMPONENT SCANTRIGGER IS
    PORT(
      CLK_IN:IN STD_LOGIC;                       --已经完成分频的时钟的输入
	   ROW_OUT:BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0);
	   COUNT_OUT:BUFFER INTEGER RANGE 0 TO 7      --当前扫到哪一行的计数状态
    );
  END COMPONENT;
  COMPONENT REDMEMORY IS
    PORT(
      U1_MODE_CONTROL:IN INTEGER RANGE 0 TO 3;     --这里接收USER1的选择输入
      U2_MODE_CONTROL:IN INTEGER RANGE 0 TO 3;     --这里接收USER2的选择输入
      COUNT_IN:IN INTEGER RANGE 0 TO 7;            --这里接收8X8点阵的行扫数据
      MEMORY_OUT:BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0)  --输出当前的列向量
    );
  END COMPONENT;
  COMPONENT GREENMEMORY IS
    PORT(
      U1_MODE_CONTROL:IN INTEGER RANGE 0 TO 3;     --这里接收USER1的选择输入
      U2_MODE_CONTROL:IN INTEGER RANGE 0 TO 3;     --这里接收USER2的选择输入
      COUNT_IN:IN INTEGER RANGE 0 TO 7;            --这里接收8X8点阵的行扫数据
      MEMORY_OUT:BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0)  --输出当前的列向量
    );
  END COMPONENT;
  
SIGNAL COUNT_BUS:INTEGER RANGE 0 TO 7;
SIGNAL R_U1_MODE_CTR:INTEGER RANGE 0 TO 7;
SIGNAL R_U2_MODE_CTR:INTEGER RANGE 0 TO 7;
SIGNAL G_U1_MODE_CTR:INTEGER RANGE 0 TO 7;
SIGNAL G_U2_MODE_CTR:INTEGER RANGE 0 TO 7;

BEGIN
  U0:SCANTRIGGER
  PORT MAP(
    CLK_IN => CLK_IN,
    ROW_OUT => ROW_OUT,
    COUNT_OUT => 	 COUNT_BUS
  );
  U1:REDMEMORY
  PORT MAP(
    U1_MODE_CONTROL => R_U1_MODE_CTR,
	 U2_MODE_CONTROL => R_U2_MODE_CTR,
	 COUNT_IN => COUNT_BUS,
	 MEMORY_OUT => RED_COL_OUT
  );
  U2:GREENMEMORY
  PORT MAP (
    U1_MODE_CONTROL => G_U1_MODE_CTR,
	 U2_MODE_CONTROL => G_U2_MODE_CTR,
	 COUNT_IN => COUNT_BUS,
	 MEMORY_OUT => GREEN_COL_OUT
  );
  
  PROCESS(RED_EN,U1_MODE_CONTROL,U2_MODE_CONTROL)
  BEGIN
    IF RED_EN = '1' THEN 
	    R_U1_MODE_CTR <= U1_MODE_CONTROL;
		 R_U2_MODE_CTR <= U2_MODE_CONTROL;
	 ELSE
	    R_U1_MODE_CTR <= 3;  --无意义
		 R_U2_MODE_CTR <= 3;  --无意义
	 END IF;
  END PROCESS;
  
    PROCESS(GREEN_EN,U1_MODE_CONTROL,U2_MODE_CONTROL)
  BEGIN
    IF GREEN_EN = '1' THEN 
	    G_U1_MODE_CTR <= U1_MODE_CONTROL;
		 G_U2_MODE_CTR <= U2_MODE_CONTROL;
	 ELSE
	    G_U1_MODE_CTR <= 3;  --无意义
		 G_U2_MODE_CTR <= 3;  --无意义
	 END IF;
  END PROCESS;
END BEHAVE;
 