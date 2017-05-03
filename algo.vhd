library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
----------------------------------------
-- Clr first time only and after done signal.---
entity Algo is
generic(N : integer := 19);
port(
    en: in STD_LOGIC; -- When the 256 counter finishes.
    clr : in STD_LOGIC;
    clk : in STD_LOGIC;
    result : in STD_LOGIC_VECTOR(N-1 downto 0);
    dir : out STD_LOGIC; -- when '0' => lastmove = '01' and when '1' lastmove = '10'
    done : out STD_LOGIC
);
end Algo;


architecture Algo of Algo is
signal lastResult : STD_LOGIC_VECTOR(N-1 downto 0);
signal lastmove : STD_LOGIC_VECTOR(1 downto 0);
signal count : STD_LOGIC;
begin
process (clr,en)
begin
    if clr = '1' then
        lastResult <= (others => '0');
        lastmove <= (others => '0');
        dir <= '0';
        count <= '0';
        done <= '0';
    end if;
    if en ='1' then
        if lastmove ="00" and count = '0' then
            lastmove <="01";

        elsif unsigned (result) > unsigned (lastResult) and lastmove = "01" then
            count <= '1';

        elsif unsigned (result) < unsigned (lastResult) and lastmove = "01" and count = '0' then
            dir<='1';
            lastmove<="10";
        elsif unsigned (result) < unsigned (lastResult) and lastmove = "01" and count = '1'  then
            done <='1';

        elsif unsigned (result) > unsigned (lastResult) and lastmove ="10"  then
            dir <='1';
        else
            done <='1';

        end if;
        lastResult <= result;
    end if ;
end process;
end Algo;


