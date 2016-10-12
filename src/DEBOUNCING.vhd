LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

ENTITY DEBOUNCING IS
  PORT(
  BTN_IN:IN STD_LOGIC;
  BTN_OUT:BUFFER STD_LOGIC;
  COUNTER_EN_OUT:BUFFER STD_LOGIC;
  COUNTER_STATE_IN:IN STD_LOGIC
  );
END ENTITY DEBOUNCING;
--这个器件要求当输入的按键发生变化时将按键变化后的值存到TEMP变量中并使计数器开始计时，当计数器计数结束时再比较TEMP与当前按键的值，如相同则改变按键的输出，如不同则重新检测并不改变输出
ARCHITECTURE BEHAVE OF DEBOUNCING IS
SIGNAL TEMP:STD_LOGIC;
SIGNAL FLAG1:STD_LOGIC;
BEGIN
  PROCESS(BTN_IN,COUNTER_STATE_IN)
  BEGIN
    CASE FLAG1  IS    --用于标识是否出现了按键变化使计数器开始计数的动作
	   WHEN '0'=>
		  IF BTN_IN/=BTN_OUT THEN
		     FLAG1<='1';
		     COUNTER_EN_OUT <= '1';--计数器被开启
		     TEMP<=BTN_IN;
		  ELSE
		  COUNTER_EN_OUT<='0';   --关闭计数器，并不需要任何动作
		  END IF;
	   WHEN '1'=>
		  IF COUNTER_STATE_IN = '1' THEN      --计数器计数结束后的动作才有意义
		     IF BTN_IN = TEMP THEN
			     BTN_OUT<=TEMP;
			  ELSE
		        FLAG1<='0';
			  END IF;
			  FLAG1<='0';	  
		  END IF;
	 END CASE;
  END PROCESS;
END BEHAVE;