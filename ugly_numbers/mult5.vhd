library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity mult5 is
    port (ugly5 : in std_logic_vector(15 downto 0);
    y : out std_logic_vector(15 downto 0));
end mult5;

architecture rtl of mult5 is
signal x : unsigned(31 downto 0);
begin
    x <= unsigned(ugly5) * "0000000000000101";
    y <= std_logic_vector(x(15 downto 0));
end rtl;

