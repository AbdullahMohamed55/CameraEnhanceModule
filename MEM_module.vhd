library ieee;
use ieee.std_logic_1164.all;

entity MEMMOD is
	port( clk, rst : in std_logic;
		 CacheAddr : in std_logic_vector(7 downto 0);
		TopLeftAddr : in std_logic_vector(11 downto 0);
		MoveDone : in std_logic;
		nvmDataIn : in std_logic_vector(127 downto 0);
		nvmReadAddr : out std_logic_vector(11 downto 0);
		DataOut : out std_logic_Vector (7 downto 0);
		ReadDone : out std_logic
);
		
end MEMMOD;

Architecture a_MEMMOD of MEMMOD is



COMPONENT Cache IS

	PORT(
		CLK : IN STD_LOGIC; 
		RST  : IN STD_LOGIC;
		WE : IN STD_LOGIC;
		DATAIN : IN STD_LOGIC_VECTOR(7 downto 0);
		ADDRESSWRITE : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		ADDRESSREAD : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		DATAOUT : OUT STD_LOGIC_VECTOR(7 DOWNTO 0));

END COMPONENT Cache;

COMPONENT DMA IS
PORT(
		CLK : IN std_logic;
		RST : IN std_logic;
		ReadReq : IN std_logic;
		DataIn : IN std_logic_vector(127 downto 0);
		NVMTopleftPixelAddress : IN std_logic_vector(11 downto 0);

		NVMReadAddress : OUT std_logic_vector(11 downto 0);
		CacheWriteAddress : OUT std_logic_vector(7 downto 0);
		DataOut : OUT std_logic_vector(7 downto 0);
		CacheWE : OUT std_logic;
		ReadDone : OUT std_logic
);
END COMPONENT;

signal cache_dataout : std_logic_vector(7 downto 0);
signal dma_nvmreadaddress : std_logic_vector(11 downto 0);
signal dma_cachewriteaddress : std_logic_vector(7 downto 0);
signal dma_dataout : std_logic_vector(7 downto 0);
signal dma_cachewe : std_logic;
signal dma_readdone : std_logic;

begin

nvmReadAddr <= dma_nvmreadaddress;

pmcache : Cache port map(clk, rst, dma_cachewe, dma_dataout, dma_cachewriteaddress, CacheAddr, DataOut );  

pmdma : DMA port map(clk, rst, MoveDone, nvmDataIn, TopLeftAddr, dma_nvmreadaddress,
	 dma_cachewriteaddress, dma_dataout, dma_cachewe, dma_readdone );
ReadDone <= dma_readdone;
end a_MEMMOD;