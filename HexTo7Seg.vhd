library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity HexTo7Seg is
    port(
        hex_in  : in  std_logic_vector(3 downto 0);
        seg_out : out std_logic_vector(6 downto 0));
end entity;

architecture rtl of HexTo7Seg is
begin

    process(hex_in)
        variable A, B, C, D : std_logic;
    begin
	
		A  := hex_in(3);
        B  := hex_in(2);
        C  := hex_in(1);
        D  := hex_in(0);
   	
		-- Segment a =(seg_out(6))
        seg_out(6) <= (B and C) or (A and not D) or (C and not A) or 
                      (not B and not D) or (B and D and not A) or (A and not B and not C);

        -- Segment b = (seg_out(5))
        seg_out(5) <= (not A and not B) or (not B and not D) or 
                      (A and D and not C) or (C and D and not A) or (not A and not C and not D);

        -- Segment c = (seg_out(4))
        seg_out(4) <= (A and not B) or (B and not A) or 
                      (D and not A) or (D and not C) or (not A and not C);

        -- Segment d = (seg_out(3))
        seg_out(3) <= (B and C and not D) or (B and D and not C) or 
                      (C and D and not B) or (A and not C and not D) or (not A and not B and not D);

        -- Segment e = (seg_out(2))
        seg_out(2) <= (A and B) or (A and C) or (C and not D) or (not B and not D);

        -- Segment f = (seg_out(1))
        seg_out(1) <= (A and C) or (A and not B) or (B and not D) or 
                      (not C and not D) or (B and not A and not C);

        -- Segment g (seg_out(0))
        seg_out(0) <= (A and D) or (A and not B) or (C and not B) or 
                      (C and not D) or (B and not A and not C);
    end process;
end architecture;