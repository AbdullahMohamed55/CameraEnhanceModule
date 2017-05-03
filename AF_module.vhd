ibrary IEEE;
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
    moveDone : in STD_LOGIC;
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
            s : OUT std_logic_vector(n-1 DOWNTO 0);
            cout : OUT std_logic);
END component;



component my_12adder IS
       GENERIC (n : integer := 12);
PORT(
    a,b : IN std_logic_vector(n-1  DOWNTO 0);
    cin : IN std_logic;
    s : OUT std_logic_vector(n-1 DOWNTO 0);
    cout : OUT std_logic);
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
generic(N : integer := 4);
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
    q : out STD_LOGIC_VECTOR(N-1 downto 0);
    dir : out STD_LOGIC; -- when '0' => lastmove = '01' and when '1' lastmove = '10'
    done : out STD_LOGIC
);
end component;

component add_Valid IS
    PORT(   addr: IN std_logic_vector(7 DOWNTO 0);
            cnt: IN std_logic_vector(3 DOWNTO 0);
            err: out std_logic;
            out_fsm : out std_logic_vector(7 DOWNTO 0));
END component;


component n_reg is
    Generic(n: integer := 16);
    port( d : in std_logic_vector(n-1 downto 0);
          q: out std_logic_vector(n-1 downto 0);
          rst,clk: in std_logic;
        enable: in std_logic);
End component;


signal sub8_res : STD_LOGIC_VECTOR(7 downto 0);
signal add12_res : STD_LOGIC_VECTOR(11 downto 0);
signal count_9 : STD_LOGIC_VECTOR (3 downto 0);
signal count_256 : STD_LOGIC_VECTOR (7 downto 0);
signal main_px_data : STD_LOGIC_VECTOR (7 downto 0);
signal main_px_data : STD_LOGIC_VECTOR (7 downto 0);
signal out_Addr : STD_LOGIC_VECTOR (7 downto 0);
signal err : STD_LOGIC;


port map my_8subtractor ()

begin

end AF;
