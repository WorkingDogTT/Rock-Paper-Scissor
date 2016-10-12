------------------------------------------------------------------
--                            说明
--这个是行扫计数模块，功能是对由分频过后的时钟进行计数，下降沿触发进行行扫
--
------------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY SCANTRIGGER IS
  PORT(
    CLK_IN:IN STD_LOGIC;                       --已经完成分频的时钟的输入
	 COUNT_OUT:BUFFER INTEGER RANGE 0 TO 7      --当前扫到哪一行的计数状态
  );
END ENTITY SCANTRIGGER;

ARCHITECTURE BEHAVE OF SCANTRIGGER IS
BEGIN
  PROCESS(CLK_IN)
  BEGIN
    IF CLK_IN'EVENT AND CLK_IN='0' THEN
	    IF COUNT_OUT = 7 THEN 
		    COUNT_OUT <= 0;
		 ELSE 
		    COUNT_OUT <= COUNT_OUT + 1;
		 END IF;
	 END IF;
  END PROCESS;
END BEHAVE;