LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

--we wanna the output to be my next input
ENTITY addr_Valid IS
	PORT(	addr: IN std_logic_vector(7 DOWNTO 0);
			cnt: IN std_logic_vector(3 DOWNTO 0);
			out_fsm : out std_logic_vector(7 DOWNTO 0));
END addr_Valid;

Architecture a_addr_Valid of addr_Valid is

COMPONENT my_8subtractor_noAbs IS
       GENERIC (n : integer := 8);
PORT(a,b : IN std_logic_vector(n-1  DOWNTO 0);
            cin : IN std_logic;
            s : OUT std_logic_vector(n-1 DOWNTO 0);  
			cout : OUT std_logic);
END COMPONENT;

COMPONENT my_nadder IS
       GENERIC (n : integer := 8);
PORT(a,b : IN std_logic_vector(n-1  DOWNTO 0);
            cin : IN std_logic;  
            s : OUT std_logic_vector(n-1 DOWNTO 0);    
			cout : OUT std_logic);
END COMPONENT;

signal car1,car2 : std_logic;
signal addOperand, subbOperand, x1, x2 : std_logic_vector(7 downto 0);


begin
add:	my_nadder  port map (addr, addoperand,'0',x1,car1); -- a+b

sub:	my_8subtractor_noAbs  port map (addr, subbOperand,'1',x2,car2); -- a-b

--case adding error = carry, case subtracting error= !carry

--addOperand
addoperand <= "00000001" when cnt = "0001" --addr + 1 R(+1)
else "00001111" when cnt = "0110" --addr + 16 DL(+15)
else "00010000" when cnt = "0111" --addr + 1 D(+16)
else "00010001" when cnt = "1000"; --addr + 1 DR(+17)

--subbOperand
subbOperand <= "00001111" when cnt = "0010" --addr - 16 TR(-15)
else "00010000" when cnt = "0011" --addr - 1 T(-16)
else "00010001" when cnt = "0100" --addr - 1 TL(-17)
else "00000001" when cnt = "0101"; --addr + 16 L(-1)


--pass address
out_fsm <= addr when cnt = "0000"

else x1 when (cnt = "0001" and car1 = '0') --addr + 1 R(+1)
else addr when (cnt = "0001" and car1 = '1') --ERROR CHECKING

else x2 when (cnt = "0010" and car2 = '1') --addr - 16 TR(-15)
else addr when (cnt = "0010" and car2 = '0') 

else x2 when (cnt = "0011" and car2 = '1') --addr - 1 T(-16)
else addr when (cnt = "0011" and car2 = '0') 

else x2 when (cnt = "0100" and car2 = '1') --addr - 1 TL(-17)
else addr when (cnt = "0100" and car2 = '0') 

else x2 when (cnt = "0101" and car2 = '1') --addr + 16 L(-1)
else addr when (cnt = "0101" and car2 = '0') 

else x1 when (cnt = "0110" and car1 = '0') --addr + 16 DL(+15)
else addr when (cnt = "0110" and car1 = '1') 

else x1 when (cnt = "0111" and car1 = '0') --addr + 1 D(+16)
else addr when (cnt = "0111" and car1 = '1') 

else x1 when (cnt = "1000" and car1 = '0') --addr + 1 DR(+17)
else addr when (cnt = "1000" and car1 = '1'); 

END a_addr_Valid;
