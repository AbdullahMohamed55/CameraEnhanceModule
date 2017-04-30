LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
-- n-bit adder
ENTITY my_8subtractor_noAbs IS
       GENERIC (n : integer := 8);
PORT(a,b : IN std_logic_vector(n-1  DOWNTO 0);
            cin : IN std_logic;
            s : OUT std_logic_vector(n-1 DOWNTO 0);  
			cout : OUT std_logic);
END my_8subtractor_noAbs;

ARCHITECTURE a_my_8subtractor_noAbs OF my_8subtractor_noAbs IS
      COMPONENT my_adder IS
              PORT( a,b,cin : IN std_logic; 
			  s,cout : OUT std_logic);
        END COMPONENT;
SIGNAL temp, not_b : std_logic_vector(n-1 DOWNTO 0);

BEGIN

	invB: not_b <= not b;

  f0: my_adder PORT MAP(a(0),not_b(0),cin,s(0),temp(0));
  loop1: FOR i IN 1 TO n-1 GENERATE
          fx: my_adder PORT MAP  (a(i),not_b(i),temp(i-1),s(i),temp(i));
    END GENERATE;
    cout <= temp(n-1);
END a_my_8subtractor_noAbs;
