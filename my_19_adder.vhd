LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
-- n-bit adder
ENTITY my_19adder IS
       GENERIC (n : integer := 19);
PORT(a,b : IN std_logic_vector(n-1  DOWNTO 0);
            cin : IN std_logic;
            s : OUT std_logic_vector(n-1 DOWNTO 0));
END my_19adder;

ARCHITECTURE a_my_19adder OF my_19adder IS
      COMPONENT my_adder IS
              PORT( a,b,cin : IN std_logic;
              s,cout : OUT std_logic);
        END COMPONENT;
SIGNAL temp : std_logic_vector(n-1 DOWNTO 0);

BEGIN
  f0: my_adder PORT MAP(a(0),b(0),cin,s(0),temp(0));
  loop1: FOR i IN 1 TO n-1 GENERATE
          fx: my_adder PORT MAP  (a(i),b(i),temp(i-1),s(i),temp(i));
    END GENERATE;
END a_my_19adder;
