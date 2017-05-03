LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
USE ieee.numeric_std.all;
ENTITY DMA IS
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

	
END ENTITY DMA;

ARCHITECTURE a_DMA of DMA IS


signal started : std_logic;

signal p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12, p13, p14, p15 : std_logic_vector(7 downto 0);
signal readdoneinternal : std_logic;
signal nvmcounter :std_logic_vector(3 downto 0);
signal nvmnextaddress : std_logic_vector(11 downto 0);
signal cachenextaddress : std_logic_vector(7 downto 0);
	BEGIN
		p0 <= DataIn(127 downto 120);
		p1 <= DataIn(119 downto 112);
		p2 <= DataIn(111 downto 104);
		p3 <= DataIn(103 downto 96);
		p4 <= DataIn(95 downto 88);
		p5 <= DataIn(87 downto 80);
		p6 <= DataIn(79 downto 72);
		p7 <= DataIn(71 downto 64);
		p8 <= DataIn(63 downto 56);
		p9 <= DataIn(55 downto 48);
		p10 <= DataIn(47 downto 40);
		p11 <= DataIn(39 downto 32);
		p12 <= DataIn(31 downto 24);
		p13 <= DataIn(23 downto 16);
		p14 <= DataIn(15 downto 8);
		p15 <= DataIn(7 downto 0);
		
		Process(CLK, RST)

		BEGIN
			IF RST = '1' THEN
					started <= '0';
					readdoneinternal <= '0';
					nvmcounter <= (others => '0');
					nvmnextaddress <= (others => '0');
					cachenextaddress <= (others => '0');


					NVMReadAddress <= (others => '0');
					CacheWriteAddress <= (others => '0');
					DataOut <= (others => '0');
					CacheWE <= '0';
					ReadDone <= '0';
			ELSIF(rising_edge(CLK)) THEN
				IF readdoneinternal = '1' THEN
					readdoneinternal <= '0';
					ReadDone <= '0';
				END IF;
				IF ReadReq = '1' AND started = '0' THEN
					started <= '1';
					NVMReadAddress <= NVMTopLeftPixelAddress;
					nvmnextaddress <= std_logic_vector(unsigned(NVMTopLeftPixelAddress) + 16);
					cachenextaddress <= std_logic_vector(unsigned(cachenextaddress) + 1);
					DataOut <= p0;
					CacheWE <= '1';
				ELSIF started = '1' THEN
					if nvmcounter = "0000" then
						nvmcounter <= std_logic_vector(unsigned(nvmcounter) + 1);
						CacheWriteAddress <= cachenextaddress;
						cachenextaddress <= std_logic_vector(unsigned(cachenextaddress) + 1);
						DataOut <= p1;
					elsif nvmcounter = "0001" then
						nvmcounter <= std_logic_vector(unsigned(nvmcounter) + 1);
						CacheWriteAddress <= cachenextaddress;
						cachenextaddress <= std_logic_vector(unsigned(cachenextaddress) + 1);
						DataOut <= p2;
					elsif nvmcounter = "0010" then
						nvmcounter <= std_logic_vector(unsigned(nvmcounter) + 1);
						CacheWriteAddress <= cachenextaddress;
						cachenextaddress <= std_logic_vector(unsigned(cachenextaddress) + 1);
						DataOut <= p3;
					elsif nvmcounter = "0011" then
						nvmcounter <= std_logic_vector(unsigned(nvmcounter) + 1);
						CacheWriteAddress <= cachenextaddress;
						cachenextaddress <= std_logic_vector(unsigned(cachenextaddress) + 1);
						DataOut <= p4;
					elsif nvmcounter = "0100" then
						nvmcounter <= std_logic_vector(unsigned(nvmcounter) + 1);
						CacheWriteAddress <= cachenextaddress;
						cachenextaddress <= std_logic_vector(unsigned(cachenextaddress) + 1);
						DataOut <= p5;
					elsif nvmcounter = "0101" then
						nvmcounter <= std_logic_vector(unsigned(nvmcounter) + 1);
						CacheWriteAddress <= cachenextaddress;
						cachenextaddress <= std_logic_vector(unsigned(cachenextaddress) + 1);
						DataOut <= p6;
					elsif nvmcounter = "0110" then
						nvmcounter <= std_logic_vector(unsigned(nvmcounter) + 1);
						CacheWriteAddress <= cachenextaddress;
						cachenextaddress <= std_logic_vector(unsigned(cachenextaddress) + 1);
						DataOut <= p7;
					elsif nvmcounter = "0111" then
						nvmcounter <= std_logic_vector(unsigned(nvmcounter) + 1);
						CacheWriteAddress <= cachenextaddress;
						cachenextaddress <= std_logic_vector(unsigned(cachenextaddress) + 1);
						DataOut <= p8;
					elsif nvmcounter = "1000" then
						nvmcounter <= std_logic_vector(unsigned(nvmcounter) + 1);
						CacheWriteAddress <= cachenextaddress;
						cachenextaddress <= std_logic_vector(unsigned(cachenextaddress) + 1);
						DataOut <= p9;
					elsif nvmcounter = "1001" then
						nvmcounter <= std_logic_vector(unsigned(nvmcounter) + 1);
						CacheWriteAddress <= cachenextaddress;
						cachenextaddress <= std_logic_vector(unsigned(cachenextaddress) + 1);
						DataOut <= p10;
					elsif nvmcounter = "1010" then
						nvmcounter <= std_logic_vector(unsigned(nvmcounter) + 1);
						CacheWriteAddress <= cachenextaddress;
						cachenextaddress <= std_logic_vector(unsigned(cachenextaddress) + 1);
						DataOut <= p11;
					elsif nvmcounter = "1011" then
						nvmcounter <= std_logic_vector(unsigned(nvmcounter) + 1);
						CacheWriteAddress <= cachenextaddress;
						cachenextaddress <= std_logic_vector(unsigned(cachenextaddress) + 1);
						DataOut <= p12;
					elsif nvmcounter = "1100" then
						nvmcounter <= std_logic_vector(unsigned(nvmcounter) + 1);
						CacheWriteAddress <= cachenextaddress;
						cachenextaddress <= std_logic_vector(unsigned(cachenextaddress) + 1);
						DataOut <= p13;
					elsif nvmcounter = "1101" then
						nvmcounter <= std_logic_vector(unsigned(nvmcounter) + 1);
						CacheWriteAddress <= cachenextaddress;
						cachenextaddress <= std_logic_vector(unsigned(cachenextaddress) + 1);
						DataOut <= p14;
					elsif nvmcounter = "1110" then
						nvmcounter <= std_logic_vector(unsigned(nvmcounter) + 1);
						CacheWriteAddress <= cachenextaddress;
						cachenextaddress <= std_logic_vector(unsigned(cachenextaddress) + 1);
						DataOut <= p15;
					elsif nvmcounter = "1111" and cachenextaddress /= "00000000" then
						nvmcounter <= std_logic_vector(unsigned(nvmcounter) + 1);
						CacheWriteAddress <= cachenextaddress;
						cachenextaddress <= std_logic_vector(unsigned(cachenextaddress) + 1);
						NVMReadAddress <= nvmnextaddress;
						nvmnextaddress <= std_logic_vector(unsigned(nvmnextaddress) + 16);
						DataOut <= p0;
					else
						started <= '0';
						readdoneinternal <= '1';
						nvmcounter <= (others => '0');
						nvmnextaddress <= (others => '0');
						cachenextaddress <= (others => '0');


						NVMReadAddress <= (others => '0');
						CacheWriteAddress <= (others => '0');
						DataOut <= (others => '0');
						CacheWE <= '0';
						ReadDone <= '1';
					END IF;
				END IF;
			END IF;
		END PROCESS;
		

END a_DMA;