LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use work.top.all;

ENTITY fsm_top IS
	PORT(	clk, res, en: IN std_logic;
			ir : IN std_logic_vector(15 DOWNTO 0);
			out_fsm : out std_logic_vector(15 DOWNTO 0));
END fsm_top;
Architecture a_fsm_top of fsm_top is

type state_type is (s_f1, s_f2, s_dec, s_dec_wait);
signal state: state_type;

begin
process (clk,ir)
Begin
	if res = '1' or en = '0' then
		state <= s_f1;
	elsif rising_edge(clk) and en = '1' then
		case state is
		WHEN s_f1 =>
			state <= s_f2;
		WHEN s_f2 =>
			state <= s_dec;
		WHEN s_dec =>
			state <= s_dec_wait;
		WHEN s_dec_wait =>
			state <= s_dec_wait;
		end case;
	end if;
end process;
process(state)
begin
	case state is
		WHEN s_f1 =>
			out_fsm <= f1;
		WHEN s_f2 =>
			out_fsm <= f2;
		WHEN s_dec =>
			out_fsm <= dec;
		WHEN s_dec_wait =>
			out_fsm <= end_s;
	end case;
end process;
END a_fsm_top;
