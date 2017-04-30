LIBRARY IEEE;
USE IEEE.std_logic_1164.all;
-- n-bit adder
ENTITY my_8subtractor IS
       GENERIC (n : integer := 8);
PORT(a,b : IN std_logic_vector(n-1  DOWNTO 0);
            cin : IN std_logic;
            s : OUT std_logic_vector(n-1 DOWNTO 0);  
			cout : OUT std_logic);
END my_8subtractor;

ARCHITECTURE a_my_8subtractor OF my_8subtractor IS
      COMPONENT my_adder IS
              PORT( a,b,cin : IN std_logic; 
			  s,cout : OUT std_logic);
        END COMPONENT;
SIGNAL temp,l ,r, not_r : std_logic_vector(n-1 DOWNTO 0);

BEGIN

	settingL: l <= b when a<b
	else a;

	settingR: r <= a when a<b
	else b;

	invR: not_r <= not r;

  f0: my_adder PORT MAP(l(0),not_r(0),cin,s(0),temp(0));
  loop1: FOR i IN 1 TO n-1 GENERATE
          fx: my_adder PORT MAP  (l(i),not_r(i),temp(i-1),s(i),temp(i));
    END GENERATE;
    cout <= temp(n-1);
END a_my_8subtractor;
