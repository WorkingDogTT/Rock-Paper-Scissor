LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY DIVIDER IS
  PORT(
  CLK_IN:IN STD_LOGIC;
  CLK_OUT:BUFFER STD_LOGIC;
  FRE_SET:IN INTEGER        --设置频率，必须赋给初值，单位是百Hz，否则进入默认分频状态100HZ
  );
END DIVIDER;

ARCHITECTURE DIVIDE OF DIVIDER IS
SIGNAL COUNT:INTEGER;
SIGNAL COUNT_MAX:INTEGER;
BEGIN
  DIV:PROCESS(CLK_IN)
  BEGIN
    IF CLK_IN'EVENT AND CLK_IN='0' THEN
	    IF COUNT>= COUNT_MAX THEN
		    COUNT<=0;
			 CLK_OUT<= NOT CLK_OUT;
		 ELSE
		    COUNT<=COUNT+1;
		 END IF;
	 END IF;
  END PROCESS DIV; 
  SET:PROCESS(FRE_SET)
  BEGIN
    IF FRE_SET = 0 THEN
	    COUNT_MAX<=720000000/100;     --注意这里是从100HZ开始向下分频
	 ELSE
       COUNT_MAX<=720000000/FRE_SET; --注意这里是从100HZ开始向下分频
	 END IF; 
  END PROCESS SET;
END DIVIDE;