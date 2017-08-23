library IEEE;
use IEEE.std_logic_1164.all;

entity test_button is
port(a:in  std_logic;
	 b:in  std_logic;
	 c:out std_logic);
end entity test_button;

architecture rtl of test_button is
begin
 c<= a xor b;
end architecture rtl;