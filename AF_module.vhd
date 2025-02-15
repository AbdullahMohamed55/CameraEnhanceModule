library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.NUMERIC_STD.all;
----------------------------------------
entity AF is
generic(N : integer := 8);
port(
    clk : in STD_LOGIC;
    rst : in STD_LOGIC;
    dataIn : in STD_LOGIC_VECTOR(N-1 downto 0);
    addr : out STD_LOGIC_VECTOR(N-1 downto 0);
    readDone : in STD_LOGIC;
    direction : out STD_LOGIC;
    Move : out STD_LOGIC;
    FocusAddr : in STD_LOGIC_VECTOR(11 downto 0);
    Start : in STD_LOGIC;
    Done : out STD_LOGIC
    );
end AF;
architecture AF of AF is



component my_8subtractor IS
       GENERIC (n : integer := 8);
PORT(a,b : IN std_logic_vector(n-1  DOWNTO 0);
            cin : IN std_logic;
            s : OUT std_logic_vector(n-1 DOWNTO 0));
END component;



component my_12adder IS
       GENERIC (n : integer := 12);
PORT(
    a,b : IN std_logic_vector(n-1  DOWNTO 0);
    cin : IN std_logic;
    s : OUT std_logic_vector(n-1 DOWNTO 0));
END component;


component my_19adder IS
       GENERIC (n : integer := 19);
PORT(a,b : IN std_logic_vector(n-1  DOWNTO 0);
            cin : IN std_logic;
            s : OUT std_logic_vector(n-1 DOWNTO 0));
END component;


component counter is
generic(N : integer := 4);
port(
    en: in STD_LOGIC;
    clr : in STD_LOGIC;
    clk : in STD_LOGIC;
    q : out STD_LOGIC_VECTOR(N-1 downto 0)
    );
end component;


component counter256 is
generic(N : integer := 9);
port(
    en: in STD_LOGIC;
    clr : in STD_LOGIC;
    clk : in STD_LOGIC;
    q : out STD_LOGIC_VECTOR(N-1 downto 0)
    );
end component;


component Algo is
generic(N : integer := 19);
port(
    en: in STD_LOGIC; -- When the 256 counter finishes.
    clr : in STD_LOGIC;
    clk : in STD_LOGIC;
    result : in STD_LOGIC_VECTOR(N-1 downto 0);
    dir : out STD_LOGIC; -- when '0' => lastmove = '01' and when '1' lastmove = '10'
    done : out STD_LOGIC;
	move : out std_logic
);
end component;

component addr_Valid IS
    PORT(   addr: IN std_logic_vector(7 DOWNTO 0);
            cnt: IN std_logic_vector(3 DOWNTO 0);
            out_fsm : out std_logic_vector(7 DOWNTO 0));
END component;


component n_reg is
    Generic(n: integer := 8);
    port( d : in std_logic_vector(n-1 downto 0);
          q: out std_logic_vector(n-1 downto 0);
          rst,clk: in std_logic;
        enable: in std_logic);
End component;

component reg_19 is
    Generic(n: integer := 19);
    port( d : in std_logic_vector(n-1 downto 0);
          q: out std_logic_vector(n-1 downto 0);
          rst,clk: in std_logic;
        enable: in std_logic);
End component;




signal sub8_res : STD_LOGIC_VECTOR(7 downto 0);
signal add12_res : STD_LOGIC_VECTOR(11 downto 0);
signal count_9 : STD_LOGIC_VECTOR (3 downto 0);
signal count_256 : STD_LOGIC_VECTOR (8 downto 0);
signal main_px_data : STD_LOGIC_VECTOR (7 downto 0);
signal out_Addr : STD_LOGIC_VECTOR (7 downto 0);
signal done_algo : STD_LOGIC;
signal dir_algo : STD_LOGIC;
signal result : STD_LOGIC_VECTOR(18 downto 0);
signal add19_res :STD_LOGIC_VECTOR (18 downto 0);
signal c256enabler : std_logic;
signal move_algo : std_logic;
signal activate : std_logic;
signal regreset : std_logic;
signal mainPxEn :std_logic;

signal minicounteren : std_logic;
signal addera : std_logic_vector(18 downto 0);
begin
minicounteren <= '1' when (activate = '1' and move_algo = '0')
else '0';

mainPxEn <= '1'
when ( activate = '1' and count_9 = "0000")
else '0';

addera <= "00000000000" & sub8_res;
c256enabler <= '1' when (count_9(3) = '1' and activate = '1') or move_algo = '1' or done_algo = '1'
else '0';
regreset <= count_256(8) or rst;
my8 : my_8subtractor port map  (dataIn,main_px_data,'1',sub8_res);
my19 : my_19adder port map  (addera,result,'0',add19_res);
my256 : counter256 port map  (c256enabler, rst, clk, count_256);
my9 :counter port map  ( minicounteren, rst, clk, count_9 );

myreg :n_reg port map  (dataIn, main_px_data, rst, clk, mainPxEn);
my1919: reg_19 port map  (add19_res, result, regreset, clk, activate );
myvalid: addr_Valid port map (count_256(7 downto 0), count_9, out_Addr);
myalgo: Algo port map  (count_256(8), rst, clk, result, dir_algo, done_algo, move_algo);

process(readDone, move_algo)
begin
if(readDone = '1') then
 activate <= '1';
 elsif move_algo = '1' or rst = '1' then
 activate <= '0';
 end if;
 end process;



direction <= dir_algo;
Done <= done_algo;
Move <= move_algo;
addr <= out_Addr;
end AF;
