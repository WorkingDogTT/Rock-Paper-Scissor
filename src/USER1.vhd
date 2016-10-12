LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY USER1 IS
  PORT(
  USER1_EN:IN STD_LOGIC;
  USER1_SEL_IN:IN STD_LOGIC_VECTOR(3 DOWNTO 0);
  USER1_SEL_OUT:BUFFER STD_LOGIC_VECTOR(3 DOWNTO 0)
  );
END ENTITY USER1;

ARCHITECTURE FUN OF USER1 IS
SIGNAL CHOOSE:STD_LOGIC;
BEGIN
  PROCESS(USER1_EN,USER1_SEL_IN)
  BEGIN
    IF USER1_EN = '1' THEN
	    CASE USER1_SEL_IN IS
		   --WHEN "0000" => USER1_SLE_OUT <= "0000";  --初始化值单独出去
			WHEN "1000" => USER1_SEL_OUT <= "1000";
			WHEN "0100" => USER1_SEL_OUT <= "0100";
			WHEN "0010" => USER1_SEL_OUT <= "0010";
			WHEN "0001" => USER1_SEL_OUT <= "0001";
		 END CASE;
	ELSE
	  USER1_SEL_OUT <= "0000" ;
	END IF;
  END PROCESS;
END FUN;