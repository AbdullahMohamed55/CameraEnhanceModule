library ieee;
use ieee.std_logic_1164.all;

entity bmwn is
	port(
		clk, rst, start, movedone : in std_logic;
		focaddress : in std_logic_vector(11 downto 0);
		done, direction, move : out std_logic
);
end bmwn;

architecture a_bmwn of bmwn is

component BigModule is
	port(
		clk, rst, start, movedone : in std_logic;
		focaddress : in std_logic_vector(11 downto 0);
		nvmdata : in std_logic_vector(127 downto 0);
		nvmaddress : out std_logic_vector( 11 downto 0);
		done, direction, move : out std_logic
);

end component;

component NVM IS

	PORT(
		CLK : IN STD_LOGIC;
		RST  : IN STD_LOGIC;
		-- 1kB
		ADDRESS : IN STD_LOGIC_VECTOR(11 DOWNTO 0);
		DATAOUT : OUT STD_LOGIC_VECTOR(127 DOWNTO 0));

END component NVM;

signal nvmdataout : std_logic_vector(127 downto 0);
signal bmnvmaddress : std_logic_vector(11 downto 0);

begin

bmpm : BigModule port map (clk, rst, start, movedone, focaddress, nvmdataout, bmnvmaddress, done, direction, move);
nvmpm : NVM port map (clk, rst, bmnvmaddress, nvmdataout);

end a_bmwn;
