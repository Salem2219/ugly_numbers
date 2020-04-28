library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity ctrl is
  port(clk,rst, start, x2, x3, x5, iltn: in std_logic;
       i2_ld, i3_ld, i5_ld, next_ugly_no_ld, wr0, wri, i_ld, i2_sel: out std_logic);
end ctrl;

architecture rtl of ctrl is
  type state_type is (s0,s1,s2,s3,s4,s5);
  signal current_state, next_state: state_type;
begin 
  process(x2, x3, x5, iltn, start, current_state)
  begin
    case current_state is
	when s0 =>  
	  i2_ld <= '0';
      i3_ld <= '0';
      i5_ld <= '0';
      next_ugly_no_ld <= '0';
      wr0 <= '0';
      wri <= '0';
      i_ld <= '0';
      i2_sel <= '0';
	  next_state <= s1;
	when s1 =>  
      i2_ld <= '0';
      i3_ld <= '0';
      i5_ld <= '0';
      next_ugly_no_ld <= '0';
      wr0 <= '0';
      wri <= '0';
      i_ld <= '0';
      i2_sel <= '0';
	  if (start = '1') then 
	    next_state <= s2 ;
	  else
	    next_state <= s1;	
	  end if;
	when s2 => 
      i2_ld <= '1';
      i3_ld <= '1';
      i5_ld <= '1';
      next_ugly_no_ld <= '1';
      wr0 <= '1';
      wri <= '0';
      i_ld <= '1';
      i2_sel <= '0';
	  next_state <= s3 ;
	when s3 =>  
      i2_ld <= '0';
      i3_ld <= '0';
      i5_ld <= '0';
      next_ugly_no_ld <= '0';
      wr0 <= '0';
      wri <= '0';
      i_ld <= '0';
      i2_sel <= '0';
      if (iltn = '1') then
      next_state <= s4;
      else
      next_state <= s1;
      end if;
	when s4 =>  
      i2_ld <= '0';
      i3_ld <= '0';
      i5_ld <= '0';
      next_ugly_no_ld <= '1';
      wr0 <= '0';
      wri <= '1';
      i_ld <= '0';
      i2_sel <= '0';
      next_state <= s5;
	when others =>
	  i2_ld <= x2;
      i3_ld <= x3;
      i5_ld <= x5;
      next_ugly_no_ld <= '0';
      wr0 <= '0';
      wri <= '0';
      i_ld <= '1';
      i2_sel <= '1';
      next_state <= s3;		
    end case;
  end process;
  process (rst, clk)
  begin
    if (rst ='1') then
      current_state <= s0;
    elsif (rising_edge(clk)) then
      current_state <= next_state;
    end if;
  end process;
end rtl;