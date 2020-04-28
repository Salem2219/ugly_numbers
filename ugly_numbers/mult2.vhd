library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity mult2 is
    port (ugly2 : in std_logic_vector(15 downto 0);
    y : out std_logic_vector(15 downto 0));
end mult2;

architecture rtl of mult2 is
begin
y <= ugly2(14 downto 0) & '0';
end rtl;