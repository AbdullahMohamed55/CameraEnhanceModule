LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

--we wanna the output to be my next input
ENTITY add_Valid IS
	PORT(	addr: IN std_logic_vector(7 DOWNTO 0);
			cnt: IN std_logic_vector(3 DOWNTO 0);
			err: out std_logic;
			out_fsm : out std_logic_vector(7 DOWNTO 0));
END add_Valid;

Architecture a_add_Valid of add_Valid is

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

--process (clk,ir)
--Begin
--	if res = '1' or en = '0' then
--		state <= s_f1;
--	elsif rising_edge(clk) and en = '1' then
--		case state is
--		WHEN s_f1 =>
--			state <= s_f2;
--		WHEN s_f2 =>
--			state <= s_dec;
--		WHEN s_dec =>
--			state <= s_dec_wait;
--		WHEN s_dec_wait =>
--			state <= s_dec_wait;
--		end case;
--	end if;
--end process;

process(cnt)
--case adding error = carry, case subtracting error= !carry
begin
	if cnt = "0000" then
		out_fsm <= addr;
		err <= '0';

	elsif cnt = "0001" then --
		--addr + 1 R
		addoperand <= "00000001";
		out_fsm <= x1;
		err <= car1;

	elsif cnt = "0010" then
		--addr - 16 TR
		subbOperand <= "00010000";
		out_fsm <= x2;
		err <= (not car2);

	elsif cnt = "0011" then
		--addr - 1 R
		subbOperand <= "00000001";
		out_fsm <= x2;
		err <= (not car2);

	elsif cnt = "0100" then
		--addr - 1 TL
		subbOperand <= "00000001";
		out_fsm <= x2;
		err <= (not car2);

	elsif cnt = "0101" then
		--addr + 16 L
		addOperand <= "00010000";
		out_fsm <= x1;
		err <= car1;

	elsif cnt = "0110" then
		--addr + 16 DL
		addOperand <= "00010000";
		out_fsm <= x1;
		err <= car1;

	elsif cnt = "0111" then
		--addr + 1 D
		addOperand <= "00000001";
		out_fsm <= x1;
		err <= car1;

	elsif cnt = "1000" then
		--addr + 1 DR
		addOperand <= "00000001";
		out_fsm <= x1;
		err <= car1;
	end if;


end process;
END a_add_Valid;
