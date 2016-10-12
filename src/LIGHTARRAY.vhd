LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_UNSIGNED.ALL;
ENTITY LIGHTARRAY IS
  PORT(
    COUNT_IN:IN INTEGER RANGE 0 TO 7;
    MEMORY_IN:IN STD_LOGIC_VECTOR(7 DOWNTO 0);
	 COL_OUT:OUT STD_LOGIC_VECTOR(7 DOWNTO 0);        --规定低位时是最左边的首列，高位时是最右列
	 ROW_OUT:OUT STD_LOGIC_VECTOR(7 DOWNTO 0)         --规定低位时是最上面的首行，高位时是最低行
  );
END ENTITY LIGHTARRAY;

ARCHITECTURE BEHAVE OF LIGHTARRAY IS
BEGIN
  PROCESS(COUNT_IN)
  BEGIN
    CASE COUNT_IN IS
	   WHEN 0 => ROW_OUT <= "00000001" ; COL_OUT <= MEMORY_IN ;
		WHEN 1 => ROW_OUT <= "00000010" ; COL_OUT <= MEMORY_IN ;
		WHEN 2 => ROW_OUT <= "00000100" ; COL_OUT <= MEMORY_IN ;
		WHEN 3 => ROW_OUT <= "00001000" ; COL_OUT <= MEMORY_IN ;
		WHEN 4 => ROW_OUT <= "00010000" ; COL_OUT <= MEMORY_IN ;
		WHEN 5 => ROW_OUT <= "00100000" ; COL_OUT <= MEMORY_IN ;
		WHEN 6 => ROW_OUT <= "01000000" ; COL_OUT <= MEMORY_IN ;
		WHEN 7 => ROW_OUT <= "10000000" ; COL_OUT <= MEMORY_IN ;
	 END CASE;
  END PROCESS;
END BEHAVE;