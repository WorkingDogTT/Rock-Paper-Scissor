LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;

ENTITY REDMEMEORY IS
  PORT(
  U1_MODE_CONTROL:IN INTEGER RANGE 0 TO 3;     --这里接收USER1的选择输入
  U2_MODE_CONTROL:IN INTEGER RANGE 0 TO 3;     --这里接收USER2的选择输入
  COUNT_IN:IN INTEGER RANGE 0 TO 7;            --这里接收8X8点阵的行扫数据
  MEMORY_OUT:BUFFER STD_LOGIC_VECTOR(7 DOWNTO 0)  --输出当前的列向量
  );
END ENTITY REDMEMEORY;
ARCHITECTURE BEHAVE OF REDMEMEORY IS
--石头的显存定义
CONSTANT U1_R_ST_R0:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
CONSTANT U1_R_ST_R1:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
CONSTANT U1_R_ST_R2:STD_LOGIC_VECTOR(7 DOWNTO 0):="11100000";
CONSTANT U1_R_ST_R3:STD_LOGIC_VECTOR(7 DOWNTO 0):="11100000";
CONSTANT U1_R_ST_R4:STD_LOGIC_VECTOR(7 DOWNTO 0):="11100000";
CONSTANT U1_R_ST_R5:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
CONSTANT U1_R_ST_R6:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
CONSTANT U1_R_ST_R7:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
--剪刀的显存定义
CONSTANT U1_R_SC_R0:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
CONSTANT U1_R_SC_R1:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
CONSTANT U1_R_SC_R2:STD_LOGIC_VECTOR(7 DOWNTO 0):="00100000";
CONSTANT U1_R_SC_R3:STD_LOGIC_VECTOR(7 DOWNTO 0):="11000000";
CONSTANT U1_R_SC_R4:STD_LOGIC_VECTOR(7 DOWNTO 0):="11000000";
CONSTANT U1_R_SC_R5:STD_LOGIC_VECTOR(7 DOWNTO 0):="00100000";
CONSTANT U1_R_SC_R6:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
CONSTANT U1_R_SC_R7:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
--布的显存定义
CONSTANT U1_R_CL_R0:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
CONSTANT U1_R_CL_R1:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
CONSTANT U1_R_CL_R2:STD_LOGIC_VECTOR(7 DOWNTO 0):="01000000";
CONSTANT U1_R_CL_R3:STD_LOGIC_VECTOR(7 DOWNTO 0):="11100000";
CONSTANT U1_R_CL_R4:STD_LOGIC_VECTOR(7 DOWNTO 0):="11100000";
CONSTANT U1_R_CL_R5:STD_LOGIC_VECTOR(7 DOWNTO 0):="01000000";
CONSTANT U1_R_CL_R6:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
CONSTANT U1_R_CL_R7:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
--石头的显存定义
CONSTANT U2_R_ST_R0:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
CONSTANT U2_R_ST_R1:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
CONSTANT U2_R_ST_R2:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000111";
CONSTANT U2_R_ST_R3:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000111";
CONSTANT U2_R_ST_R4:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000111";
CONSTANT U2_R_ST_R5:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
CONSTANT U2_R_ST_R6:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
CONSTANT U2_R_ST_R7:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
--剪刀的显存定义
CONSTANT U2_R_SC_R0:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
CONSTANT U2_R_SC_R1:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
CONSTANT U2_R_SC_R2:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000100";
CONSTANT U2_R_SC_R3:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000011";
CONSTANT U2_R_SC_R4:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000011";
CONSTANT U2_R_SC_R5:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000100";
CONSTANT U2_R_SC_R6:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
CONSTANT U2_R_SC_R7:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
--布的显存定义
CONSTANT U2_R_CL_R0:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
CONSTANT U2_R_CL_R1:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
CONSTANT U2_R_CL_R2:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000010";
CONSTANT U2_R_CL_R3:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000111";
CONSTANT U2_R_CL_R4:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000111";
CONSTANT U2_R_CL_R5:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000010";
CONSTANT U2_R_CL_R6:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
CONSTANT U2_R_CL_R7:STD_LOGIC_VECTOR(7 DOWNTO 0):="00000000";
--临时的显存空间
SIGNAL TEMP:STD_LOGIC_VECTOR(7 DOWNTO 0);
BEGIN
  PROCESS(COUNT_IN)
  BEGIN
    CASE COUNT_IN IS
	   WHEN 0 => 
		   
	 END CASE;
  END PROCESS;
END BEHAVE; 