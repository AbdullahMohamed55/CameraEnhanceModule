LIBRARY IEEE;
USE IEEE.std_logic_1164.all;

ENTITY fsm_nop IS
	PORT(	clk, res, en: IN std_logic;
			ir : IN std_logic_vector(15 DOWNTO 0);
			out_fsm : out std_logic_vector(15 DOWNTO 0));
END fsm_nop;
Architecture a_fsm_nop of fsm_nop is
type state_type is (s_dec_wait,	s_end_s, s_ter);
signal state: state_type;

Constant end_s : std_logic_vector(15 downto 0) := "1010000000000000";
Constant wait_s : std_logic_vector(15 downto 0) := "0000000000000000";

begin
process (clk,ir)
Begin
	if res = '1' or en = '0' then
		state <= s_dec_wait;
	elsif rising_edge(clk) and en = '1' then
		case state is
		WHEN s_dec_wait =>
			IF  ir(13 downto 12) = "00"  THEN
				state <= s_ter;
			else
				state <= s_end_s;
			END IF;
		WHEN s_ter =>
			state <= s_ter;
		WHEN s_end_s =>
			state <= s_end_s;
		end case;
	end if;
end process;
process(state)
begin
	case state is
		WHEN s_end_s =>
			out_fsm <= end_s;
		WHEN others =>
			out_fsm <= wait_s;
	end case;
end process;
END a_fsm_nop;
