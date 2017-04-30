LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
use work.mov.all;

ENTITY fsm_mov IS
	PORT(	clk, res, en: IN std_logic;
			ir : IN std_logic_vector(15 DOWNTO 0);
			out_fsm : out std_logic_vector(15 DOWNTO 0));
END fsm_mov;
Architecture a_fsm_mov of fsm_mov is
type state_type is (s_dec_wait, s_src_r, s_src_ri1, s_src_ri2, s_src_ri3, s_src_ai1, s_src_ai2, s_src_ad1, s_src_ad2, s_src_ind1, s_src_ind2, s_src_ind3, s_src_ind4, s_src_ind5, s_src_id1, s_src_id2, s_src_d1, s_src_d2, s_dst_r, s_dst_ri, s_dst_ai1, s_dst_ai2, s_dst_ad1, s_dst_ad2, s_dst_ind1, s_dst_ind2, s_dst_ind3, s_dst_ind4, s_dst_ind5, s_dst_id1, s_dst_id2, s_dst_d1, s_dst_d2, s_end_s, s_src, s_dst, s_src_before_indirect, s_dst_before_indirect);
signal state: state_type;
begin
process (clk,ir)
Begin
	if res = '1' or en = '0' then
		state <= s_dec_wait;
	elsif rising_edge(clk) and en = '1' then
		case state is
		WHEN s_dec_wait =>
			IF  ir(9 downto 7) = "000"  THEN
				state <= s_src_r;
			elsif ir(9 downto 7) = "100" Then
				state <= s_src_ri1;
			elsif ir(8 downto 7) = "01" Then
				state <= s_src_ai1;
			elsif ir(8 downto 7) = "10" Then
				state <= s_src_ad1;
			elsif ir(8 downto 7) = "11" Then
				state <= s_src_ind1;
			END IF;
		WHEN s_src_r =>
			state <= s_src;
		WHEN s_src_ri1 =>
			state <= s_src_ri2;
		WHEN s_src_ri2 =>
			state <= s_src_ri3;
		WHEN s_src_ri3 =>
			state <= s_src;
		WHEN s_src_ai1 =>
			state <= s_src_ai2;
		WHEN s_src_ai2 =>
			state <= s_src_before_indirect;
		WHEN s_src_ad1 =>
			state <= s_src_ad2;
		WHEN s_src_ad2 =>
			state <= s_src_before_indirect;
		WHEN s_src_ind1 =>
			state <= s_src_ind2;
		WHEN s_src_ind2 =>
			state <= s_src_ind3;
		WHEN s_src_ind3 =>
			state <= s_src_ind4;
		WHEN s_src_ind4 =>
			state <= s_src_ind5;
		WHEN s_src_ind5 =>
			state <= s_src_before_indirect;
		WHEN s_src_before_indirect =>
			IF ir(9) = '0' Then
				state <= s_src_d1;
			elsif ir(9) = '1' Then
				state <= s_src_id1;
			END IF;
		WHEN s_src_id1 =>
			state <= s_src_id2;
		WHEN s_src_id2 =>
			state <= s_src_d1;
		WHEN s_src_d1 =>
			state <= s_src_d2;
		WHEN s_src_d2 =>
			state <= s_src;
		WHEN s_src =>
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
			state <= s_end_s;
		WHEN s_end_s =>
			state <= s_end_s;
		end case;
	end if;
end process;
process(state)
begin
	case state is
		WHEN s_src_r =>
			out_fsm <= src_r;
		WHEN s_src_ri1 =>
			out_fsm <= src_ri1;
		WHEN s_src_ri2 =>
			out_fsm <= src_ri2;
		WHEN s_src_ri3 =>
			out_fsm <= src_ri3;
		WHEN s_src_ai1 =>
			out_fsm <= src_ai1;
		WHEN s_src_ai2 =>
			out_fsm <= src_ai2;
		WHEN s_src_ad1 =>
			out_fsm <= src_ad1;
		WHEN s_src_ad2 =>
			out_fsm <= src_ad2;
		WHEN s_src_ind1 =>
			out_fsm <= src_ind1;
		WHEN s_src_ind2 =>
			out_fsm <= src_ind2;
		WHEN s_src_ind3 =>
			out_fsm <= src_ind3;
		WHEN s_src_ind4 =>
			out_fsm <= src_ind4;
		WHEN s_src_ind5 =>
			out_fsm <= src_ind5;
		WHEN s_src_id1 =>
			out_fsm <= src_id1;
		WHEN s_src_id2 =>
			out_fsm <= src_id2;
		WHEN s_src_d1 =>
			out_fsm <= src_d1;
		WHEN s_src_d2 =>
			out_fsm <= src_d2;
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
		WHEN s_end_s =>
			out_fsm <= end_s;
		WHEN others =>
			out_fsm <= wait_s;
	end case;
end process;
END a_fsm_mov;
