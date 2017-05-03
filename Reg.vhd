
library ieee;
use ieee.std_logic_1164.all;

Entity n_reg is
	Generic(n: integer := 8);
	port( d : in std_logic_vector(n-1 downto 0);
	      q: out std_logic_vector(n-1 downto 0);
	      rst,clk: in std_logic;
		enable: in std_logic);
End n_reg;

architecture A_n_reg of n_reg is



begin
process(clk)
begin
	if rst = '1' then
		q <= (others => '0');
	elsif rising_edge(clk) and enable = '1' then
		q <= d;
	end if;
end process;

end A_n_reg;
