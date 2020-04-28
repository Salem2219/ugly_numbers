library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity dp is
    port (clk, rst, i2_ld, i3_ld, i5_ld, next_ugly_no_ld, wr0, wri, i_ld, i2_sel : in std_logic;
    n : in std_logic_vector(7 downto 0);
    x2, x3, x5, iltn : out std_logic;
    y : out std_logic_vector(15 downto 0));
end dp;

architecture rtl of dp is
component comp is
    port (
    a, b : in std_logic_vector(15 downto 0);
    y : out std_logic);
end component;
component complt is
    port (
    a, b : in std_logic_vector(7 downto 0);
    y : out std_logic);
end component;
component min is
    port (
    a, b, c : in std_logic_vector(15 downto 0);
    y : out std_logic_vector(15 downto 0));
end component;
component mult5 is
    port (ugly5 : in std_logic_vector(15 downto 0);
    y : out std_logic_vector(15 downto 0));
end component;
component mult3 is
    port (ugly3 : in std_logic_vector(15 downto 0);
    y : out std_logic_vector(15 downto 0));
end component;
component mult2 is
    port (ugly2 : in std_logic_vector(15 downto 0);
    y : out std_logic_vector(15 downto 0));
end component;
component plus1 is
    port (x : in std_logic_vector(7 downto 0);
    y : out std_logic_vector(7 downto 0));
end component;
component ugly_ram is
port(clk, wr0, wri : in std_logic;
i, i2, i3, i5 : in std_logic_vector(7 downto 0);
min : in std_logic_vector(15 downto 0);
ugly2, ugly3, ugly5 : out std_logic_vector(15 downto 0));
end component;
component mux16 is
    port (s : in std_logic;
    a, b : in std_logic_vector(15 downto 0);
    y : out std_logic_vector(15 downto 0));
end component;
component mux8 is
    port (s : in std_logic;
    a, b : in std_logic_vector(7 downto 0);
    y : out std_logic_vector(7 downto 0));
end component;
component reg16 is
port (clk, rst, en: in std_logic;
reg_in: in std_logic_vector(15 downto 0);
reg_out: out std_logic_vector(15 downto 0));
end component;
component reg8 is
port (clk, rst, en: in std_logic;
reg_in: in std_logic_vector(7 downto 0);
reg_out: out std_logic_vector(7 downto 0));
end component;
signal i2, i3, i5, i2_in, i3_in, i5_in, i, i_in, i2plus1, i3plus1, i5plus1, iplus1 : std_logic_vector(7 downto 0);
signal next_multiple_of_2, next_multiple_of_3, next_multiple_of_5, next2_in, next3_in, next5_in, next_ugly_no, next_ugly_no_in, ugly2, ugly3, ugly5, min2, uglyx2, uglyx3, uglyx5 : std_logic_vector(15 downto 0);
begin
    i2_mux : mux8 port map (i2_sel, "00000000", i2plus1, i2_in);
    i3_mux : mux8 port map (i2_sel, "00000000", i3plus1, i3_in);
    i5_mux : mux8 port map (i2_sel, "00000000", i5plus1, i5_in);
    i_mux : mux8 port map (i2_sel, "00000001", iplus1, i_in);
    next2_mux : mux16 port map (i2_sel, "0000000000000010", uglyx2, next2_in);
    next3_mux : mux16 port map (i2_sel, "0000000000000011", uglyx3, next3_in);
    next5_mux : mux16 port map (i2_sel, "0000000000000101", uglyx5, next5_in);
    next_mux : mux16 port map (wri, "0000000000000001", min2, next_ugly_no_in);
    i2_reg : reg8 port map (clk, rst, i2_ld, i2_in, i2);
    i3_reg : reg8 port map (clk, rst, i3_ld, i3_in, i3);
    i5_reg : reg8 port map (clk, rst, i5_ld, i5_in, i5);
    i_reg : reg8 port map (clk, rst, i_ld, i_in, i);
    next2_reg : reg16 port map (clk, rst, i2_ld, next2_in, next_multiple_of_2);
    next3_reg : reg16 port map (clk, rst, i3_ld, next3_in, next_multiple_of_3);
    next5_reg : reg16 port map (clk, rst, i5_ld, next5_in, next_multiple_of_5);
    next_reg : reg16 port map (clk, rst, next_ugly_no_ld, next_ugly_no_in, next_ugly_no);
    ram : ugly_ram port map (clk, wr0, wri, i, i2plus1, i3plus1, i5plus1, min2, ugly2, ugly3, ugly5);
    i2_adder : plus1 port map (i2, i2plus1);
    i3_adder : plus1 port map (i3, i3plus1);
    i5_adder : plus1 port map (i5, i5plus1);
    i_adder : plus1 port map (i, iplus1);
    uglymult2 : mult2 port map (ugly2, uglyx2);
    uglymult3 : mult3 port map (ugly3, uglyx3);
    uglymult5 : mult5 port map (ugly5, uglyx5);
    min2_3_5 : min port map (next_multiple_of_2, next_multiple_of_3, next_multiple_of_5, min2);
    in_complt : complt port map (i, n, iltn);
    comp2 : comp port map (next_ugly_no, next_multiple_of_2, x2);
    comp3 : comp port map (next_ugly_no, next_multiple_of_3, x3);
    comp5 : comp port map (next_ugly_no, next_multiple_of_5, x5);
    y <= next_ugly_no;
end rtl;












    



