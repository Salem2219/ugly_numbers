library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity ugly_ram is
port(clk, wr0, wri : in std_logic;
i, i2, i3, i5 : in std_logic_vector(7 downto 0);
min : in std_logic_vector(15 downto 0);
ugly2, ugly3, ugly5 : out std_logic_vector(15 downto 0));
end ugly_ram;
architecture rtl of ugly_ram is
type ram_type is array (0 to 255) of
std_logic_vector(15 downto 0);
signal program: ram_type;
begin
process(clk)
begin
if (rising_edge(clk)) then
if (wr0 = '1') then
program(0) <= "0000000000000001";
elsif (wri = '1') then
program(conv_integer(unsigned(i))) <= min;
end if;
end if;
end process;
ugly2 <= program(conv_integer(unsigned(i2)));
ugly3 <= program(conv_integer(unsigned(i3)));
ugly5 <= program(conv_integer(unsigned(i5)));
end rtl;