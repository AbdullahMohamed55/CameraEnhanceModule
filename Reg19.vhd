

library ieee;
use ieee.std_logic_1164.all;

Entity reg_19 is
	Generic(n: integer := 19);
	port( d : in std_logic_vector(n-1 downto 0);
	      q: out std_logic_vector(n-1 downto 0);
	      rst,clk: in std_logic;
		enable: in std_logic);
End reg_19;

architecture A_reg_19 of reg_19 is



begin
process(clk)
begin
	if rst = '1' and rising_edge(clk) then
		q <= (others => '0');
	elsif rising_edge(clk) and enable = '1' then
		q <= d;
	end if;
end process;

end A_reg_19;