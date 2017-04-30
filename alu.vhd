LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY alu IS
	PORT( a,b : IN std_logic_vector (7 downto 0);
	s : IN std_logic;
	f : OUT std_logic_vector (7 downto 0);
	flags_out : OUT std_logic_vector(2 downto 0));
	--carry,Negative, Overflaw
END ENTITY alu;

ARCHITECTURE struct OF alu IS
	
COMPONENT my_nadder IS
     PORT(a,b : IN std_logic_vector(7 DOWNTO 0);
          cin : IN std_logic;
            s : OUT std_logic_vector(7 DOWNTO 0);
         cout : OUT std_logic);
END COMPONENT;

signal x1, x2, x3,l,r, tmp_out,not_r :std_logic_vector(7  DOWNTO 0);
signal flags_tmp :std_logic_vector(2  DOWNTO 0);
signal car1,car2,car3: std_logic;
BEGIN

settingL: l <= b when a<b
else a;

settingR: r <= a when a<b
else b;

Nflag: flags_tmp(1) <= '1' when (a<b and s='1')
else '0';


invb: not_r <= NOT r;
adding:	my_nadder  port map (l,r,'0',x1,car1); -- a+b
subab :  my_nadder  port map (l,not_r,'1',x2,car2); --a-b

out_alu: tmp_out <= x1 when s='0' --a+b
else x2 when s = '1'; --a-b

Cflag: flags_tmp(0) <= car1 when s='0' --a+b
else car2 when s='1' --a-b
else '0';
	
Oflag:flags_tmp(2) <= '1' when ( (l(7)='0' and r(7)='0' and tmp_out(7)='1' and s = '0')  --a+b (a&b positive => out negative)
		   		   			or (  l(7)='1' and r(7)='1' and tmp_out(7)='0' and s = '0')  --a+b (a&b negative => out negative)
				   			or (  l(7)='1' and r(7)='0' and tmp_out(7)='0' and s = '1')  --a-b (a neg & b pos => out pos)
					   		or (  l(7)='0' and r(7)='1' and tmp_out(7)='1' and s = '1')  --a-b (a pos & b neg => out neg)
  							   )	
else '0';
							

setf: f<=tmp_out;
setflags: flags_out<=flags_tmp;

END struct;
