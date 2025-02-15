LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.numeric_std.all;

ENTITY Cache IS

	PORT(
		CLK : IN STD_LOGIC; 
		RST  : IN STD_LOGIC;
		WE : IN STD_LOGIC;
		DATAIN : IN STD_LOGIC_VECTOR(7 downto 0);
		ADDRESSWRITE : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		ADDRESSREAD : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		DATAOUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));

END ENTITY Cache;


ARCHITECTURE a_Cache OF Cache IS
	
	TYPE RAM_TYPE IS ARRAY(0 TO 255) OF STD_LOGIC_VECTOR(7 DOWNTO 0);
	SIGNAL DATAMEMORY : RAM_TYPE;

	BEGIN
		DATAOUT <= DATAMEMORY (TO_INTEGER(UNSIGNED(ADDRESSREAD))); -- Async.
		PROCESS(CLK, RST) IS
			BEGIN
				
					IF RST = '1' THEN
						DATAMEMORY <= ((others => (others  => '0')));
					ELSIF WE = '1' THEN
						IF rising_edge(CLK) THEN  
						DATAMEMORY(to_integer(unsigned(ADDRESSWRITE))) <= DATAIN;
						END IF;
					END IF;
		END PROCESS;
		

END a_Cache;