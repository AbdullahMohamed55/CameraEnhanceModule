----------------------------------------
-- N-Bit Counter
----------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_unsigned.all;

----------------------------------------

entity counter256 is
generic(N : integer := 4);
port(
    en: in STD_LOGIC;
    clr : in STD_LOGIC;
    clk : in STD_LOGIC;
    q : out STD_LOGIC_VECTOR(N-1 downto 0)
    );
end counter256;

----------------------------------------

architecture counter256 of counter256 is
signal count: STD_LOGIC_VECTOR(N-1 downto 0);
begin
    process(clk, clr)
    begin
    if clr = '1'then
            count <= (others => '0');
    elsif en = '1' then
        if rising_edge(clk) then
            count <= count + 1;
        end if;
    end if;
    end process;
q <= count;
end counter256;

----------------------------------------
