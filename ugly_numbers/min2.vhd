library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity min2 is
    port (
    a, b : in std_logic_vector(15 downto 0);
    y : out std_logic_vector(15 downto 0));
end min2;

architecture rtl of min2 is
begin
    y <= a when unsigned(a) < unsigned(b) else b;
end rtl;
