LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;

-- IN_SIG INDEX:
--		000 -> keep low level(no beeping)
--		001 -> D5
--		010 -> 1
--		011 -> 2
--		100 -> 3
--		101 -> 5
--		110 -> 6
--		111 -> G1
ENTITY BEEPER IS 
	PORT(
		CLK_1MHz  : IN STD_LOGIC;
		IN_SIG    : IN STD_LOGIC_VECTOR  (2 DOWNTO 0);
		OUT_BEEP	: BUFFER STD_LOGIC
		);
END ENTITY BEEPER;

ARCHITECTURE BEEPER OF BEEPER IS
SIGNAL  ENABLE   : STD_LOGIC;
SIGNAL  COUNT    : INTEGER RANGE 0 TO 2047;
SIGNAL  COUNT_MAX: INTEGER RANGE 0 TO 2047;

BEGIN
-- SET HALF PERIOD
	PROCESS (IN_SIG)
	BEGIN
		CASE IN_SIG IS
			WHEN "000" => ENABLE    <= '0';
			WHEN "001" => COUNT_MAX <= 1275;
			WHEN "010" => COUNT_MAX <= 956;
			WHEN "011" => COUNT_MAX <= 851;
			WHEN "100" => COUNT_MAX <= 758;
			WHEN "101" => COUNT_MAX <= 637;
			WHEN "110" => COUNT_MAX <= 568;
			WHEN "111" => COUNT_MAX <= 477;
		END CASE;
		IF NOT (IN_SIG = "000") THEN
			ENABLE <= '1';
		END IF;
	END PROCESS;
	
-- TOGGLE OUTPUT
	PROCESS (CLK_1MHz)
		BEGIN
		IF ENABLE = '1' THEN
			IF CLK_1MHz'EVENT AND CLK_1MHz = '0' THEN
				IF COUNT = 0 THEN
					OUT_BEEP <= NOT OUT_BEEP;
					COUNT <= COUNT_MAX;
				ELSE
					COUNT <= COUNT-1;
				END IF;
			END IF;
		END IF;
	END PROCESS;
	   
END BEEPER;