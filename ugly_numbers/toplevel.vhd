library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity toplevel is
    port (clk, rst, start : in std_logic;
    n : in std_logic_vector(7 downto 0);
    y : out std_logic_vector(15 downto 0));
end toplevel;

architecture rtl of toplevel is
component dp is
    port (clk, rst, i2_ld, i3_ld, i5_ld, next_ugly_no_ld, wr0, wri, i_ld, i2_sel : in std_logic;
    n : in std_logic_vector(7 downto 0);
    x2, x3, x5, iltn : out std_logic;
    y : out std_logic_vector(15 downto 0));
end component;
component ctrl is
  port(clk,rst, start, x2, x3, x5, iltn: in std_logic;
       i2_ld, i3_ld, i5_ld, next_ugly_no_ld, wr0, wri, i_ld, i2_sel: out std_logic);
end component;
signal i2_ld, i3_ld, i5_ld, next_ugly_no_ld, wr0, wri, i_ld, i2_sel, x2, x3, x5, iltn : std_logic;
begin
    datapath : dp port map (clk, rst, i2_ld, i3_ld, i5_ld, next_ugly_no_ld, wr0, wri, i_ld, i2_sel, n, x2, x3, x5, iltn, y );
    control : ctrl port map (clk,rst, start, x2, x3, x5, iltn, i2_ld, i3_ld, i5_ld, next_ugly_no_ld, wr0, wri, i_ld, i2_sel);
end rtl;