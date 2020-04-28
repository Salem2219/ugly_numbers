library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity min is
    port (
    a, b, c : in std_logic_vector(15 downto 0);
    y : out std_logic_vector(15 downto 0));
end min;

architecture rtl of min is
component min2 is
    port (
    a, b : in std_logic_vector(15 downto 0);
    y : out std_logic_vector(15 downto 0));
end component;
signal d : std_logic_vector(15 downto 0);
begin
    u : min2 port map (b, c, d);
    u2 : min2 port map (a, d, y);
end rtl;