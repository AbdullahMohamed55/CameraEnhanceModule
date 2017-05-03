library ieee;
use ieee.std_logic_1164.all;

entity BigModule is
	port(
		clk, rst, start, movedone : in std_logic;
		focaddress : in std_logic_vector(11 downto 0);
		nvmdata : in std_logic_vector(127 downto 0);
		nvmaddress : out std_logic_vector( 11 downto 0);
		done, direction, move : out std_logic
);

end BigModule; 


Architecture a_bm of BigModule is

component AF is
generic(N : integer := 8);
port(
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    dataIn : in STD_LOGIC_VECTOR(N-1 downto 0);
    addr : out STD_LOGIC_VECTOR(N-1 downto 0);
    readDone : in STD_LOGIC;
    direction : out STD_LOGIC;
    Move : out STD_LOGIC;
    FocusAddr : in STD_LOGIC_VECTOR(11 downto 0);
    Start : in STD_LOGIC;
    Done : out STD_LOGIC
    );
end component;

component MEMMOD is
	port( clk, rst : in std_logic;
		 CacheAddr : in std_logic_vector(7 downto 0);
		TopLeftAddr : in std_logic_vector(11 downto 0);
		MoveDone : in std_logic;
		nvmDataIn : in std_logic_vector(127 downto 0);
		nvmReadAddr : out std_logic_vector(11 downto 0);
		DataOut : out std_logic_Vector (7 downto 0);
		ReadDone : out std_logic
);
		
end component;
signal afaddr : std_logic_vector(7 downto 0);
signal afdirection, afmove, afdone : std_logic;
signal memnvmreadaddr : std_logic_vector(11 downto 0);
signal memdataout : std_logic_vector(7 downto 0);
signal memreaddone : std_logic;
signal strt : std_logic;
begin
strt <= movedone OR start;

afpm : AF port map (clk, rst, memdataout, afaddr, memreaddone, afdirection, afmove, focaddress, start, afdone);
mmpm : MEMMOD port map(clk, rst, afaddr, focaddress, strt, nvmdata, memnvmreadaddr, memdataout, memreaddone);

nvmaddress <= memnvmreadaddr;
done <= afdone;
direction <= afdirection;
move <= afmove;


end a_bm;