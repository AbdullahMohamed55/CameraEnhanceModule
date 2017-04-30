LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use work.one_op.all;

ENTITY fsm_one_op IS
	PORT(	clk, res, en: IN std_logic;
			ir : IN std_logic_vector(15 DOWNTO 0);
			out_fsm : out std_logic_vector(15 DOWNTO 0));
END fsm_one_op;
Architecture a_fsm_one_op of fsm_one_op is
type state_type is (s_dec_wait,	s_dst_r, s_dst_ri, s_dst_ai1, s_dst_ai2, s_dst_ad1, s_dst_ad2,
					s_dst_ind1, s_dst_ind2, s_dst_ind3, s_dst_ind4, s_dst_ind5, s_dst_id1, s_dst_id2, s_dst_d1, s_dst_d2,
					s_inc, s_dec, s_clr, s_inv, s_lsr_o, s_ror_o, s_rrc_o, s_asr_o, s_lsl_o, s_rol_o, s_rlc_o, s_ex_rd, s_ex_id1, s_ex_id2,
					s_end_s, s_dst, s_dst_before_indirect, s_dst_before_ex, s_dst_after_ex);
signal state: state_type;


begin
process (clk,ir)
Begin
	if res = '1' or en = '0' then
		state <= s_dec_wait;
	elsif rising_edge(clk) and en = '1' then
		case state is
		WHEN s_dec_wait =>
			IF  ir(4 downto 2) = "000"  THEN
				state <= s_dst_r;
			elsif ir(4 downto 2) = "100" Then
				state <= s_dst_ri;
			elsif ir(3 downto 2) = "01" Then
				state <= s_dst_ai1;
			elsif ir(3 downto 2) = "10" Then
				state <= s_dst_ad1;
			elsif ir(3 downto 2) = "11" Then
				state <= s_dst_ind1;
			END IF;
		WHEN s_dst_r =>
			state <= s_dst;
		WHEN s_dst_ri =>
			state <= s_dst_d1;
		WHEN s_dst_ai1 =>
			state <= s_dst_ai2;
		WHEN s_dst_ai2 =>
			state <= s_dst_before_indirect;
		WHEN s_dst_ad1 =>
			state <= s_dst_ad2;
		WHEN s_dst_ad2 =>
			state <= s_dst_before_indirect;
		WHEN s_dst_ind1 =>
			state <= s_dst_ind2;
		WHEN s_dst_ind2 =>
			state <= s_dst_ind3;
		WHEN s_dst_ind3 =>
			state <= s_dst_ind4;
		WHEN s_dst_ind4 =>
			state <= s_dst_ind5;
		WHEN s_dst_ind5 =>
			state <= s_dst_before_indirect;
		WHEN s_dst_before_indirect =>
			IF ir(4) = '0' Then
				state <= s_dst_d1;
			elsif ir(4) = '1' Then
				state <= s_dst_id1;
			END IF;
		WHEN s_dst_id1 =>
			state <= s_dst_id2;
		WHEN s_dst_id2 =>
			state <= s_dst_d1;
		WHEN s_dst_d1 =>
			state <= s_dst_d2;
		WHEN s_dst_d2 =>
			state <= s_dst;
		WHEN s_dst =>
			IF ir(13 downto 10) = "0000" Then
				state <= s_inc;
			elsif ir(13 downto 10) = "0001" Then
				state <= s_dec;
			elsif ir(13 downto 10) = "0010" Then
				state <= s_clr;
			elsif ir(13 downto 10) = "0011" Then
				state <= s_inv;
			elsif ir(13 downto 10) = "0100" Then
				state <= s_lsr_o;
			elsif ir(13 downto 10) = "0101" Then
				state <= s_ror_o;
			elsif ir(13 downto 10) = "0110" Then
				state <= s_rrc_o;
			elsif ir(13 downto 10) = "0111" Then
				state <= s_asr_o;
			elsif ir(13 downto 10) = "1000" Then
				state <= s_lsl_o;
			elsif ir(13 downto 10) = "1001" Then
				state <= s_rol_o;
			elsif ir(13 downto 10) = "1010" Then
				state <= s_rlc_o;
			END IF;
		WHEN s_inc =>
			state <= s_dst_before_ex;
		WHEN s_dec =>
			state <= s_dst_before_ex;
		WHEN s_clr =>
			state <= s_dst_before_ex;
		WHEN s_inv =>
			state <= s_dst_before_ex;
		WHEN s_lsr_o =>
			state <= s_dst_before_ex;
		WHEN s_ror_o =>
			state <= s_dst_before_ex;
		WHEN s_rrc_o =>
			state <= s_dst_before_ex;
		WHEN s_asr_o =>
			state <= s_dst_before_ex;
		WHEN s_lsl_o =>
			state <= s_dst_before_ex;
		WHEN s_rol_o =>
			state <= s_dst_before_ex;
		WHEN s_rlc_o =>
			state <= s_dst_before_ex;
		WHEN s_dst_before_ex =>
			IF ir(4 downto 2) = "000" Then
				state <= s_ex_rd;
			else
				state <= s_ex_id1;
			end if;
		WHEN s_ex_rd =>
			state <= s_dst_after_ex;
		WHEN s_ex_id1 =>
			state <= s_ex_id2;
		WHEN s_ex_id2 =>
			state <= s_dst_after_ex;
		WHEN s_dst_after_ex =>
			state <= s_end_s;
		WHEN s_end_s =>
			state <= s_end_s;
		end case;
	end if;
end process;
process(state)
begin
	case state is
		WHEN s_dst_r =>
			out_fsm <= dst_r;
		WHEN s_dst_ri =>
			out_fsm <= dst_ri;
		WHEN s_dst_ai1 =>
			out_fsm <= dst_ai1;
		WHEN s_dst_ai2 =>
			out_fsm <= dst_ai2;
		WHEN s_dst_ad1 =>
			out_fsm <= dst_ad1;
		WHEN s_dst_ad2 =>
			out_fsm <= dst_ad2;
		WHEN s_dst_ind1 =>
			out_fsm <= dst_ind1;
		WHEN s_dst_ind2 =>
			out_fsm <= dst_ind2;
		WHEN s_dst_ind3 =>
			out_fsm <= dst_ind3;
		WHEN s_dst_ind4 =>
			out_fsm <= dst_ind4;
		WHEN s_dst_ind5 =>
			out_fsm <= dst_ind5;
		WHEN s_dst_id1 =>
			out_fsm <= dst_id1;
		WHEN s_dst_id2 =>
			out_fsm <= dst_id2;
		WHEN s_dst_d1 =>
			out_fsm <= dst_d1;
		WHEN s_dst_d2 =>
			out_fsm <= dst_d2;
		WHEN s_inc =>
			out_fsm <= inc;
		WHEN s_dec =>
			out_fsm <= dec;
		WHEN s_clr =>
			out_fsm <= clr;
		WHEN s_inv =>
			out_fsm <= inv;
		WHEN s_lsr_o =>
			out_fsm <= lsr_o;
		WHEN s_ror_o =>
			out_fsm <= ror_o;
		WHEN s_rrc_o =>
			out_fsm <= rrc_o;
		WHEN s_asr_o =>
			out_fsm <= asr_o;
		WHEN s_lsl_o =>
			out_fsm <= lsl_o;
		WHEN s_rol_o =>
			out_fsm <= rol_o;
		WHEN s_rlc_o =>
			out_fsm <= rlc_o;
		WHEN s_ex_rd =>
			out_fsm <= ex_rd;
		WHEN s_ex_id1 =>
			out_fsm <= ex_id1;
		WHEN s_ex_id2 =>
			out_fsm <= ex_id2;
		WHEN s_end_s =>
			out_fsm <= end_s;
		WHEN others =>
			out_fsm <= wait_s;
	end case;
end process;
END a_fsm_one_op;
