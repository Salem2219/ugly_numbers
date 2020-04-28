library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity mult3 is
    port (ugly3 : in std_logic_vector(15 downto 0);
    y : out std_logic_vector(15 downto 0));
end mult3;

architecture rtl of mult3 is
signal x : unsigned(31 downto 0);
begin
    x <= unsigned(ugly3) * "0000000000000011";
    y <= std_logic_vector(x(15 downto 0));
end rtl;

