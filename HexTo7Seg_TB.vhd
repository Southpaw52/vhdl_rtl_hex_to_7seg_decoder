LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY HexTo7Seg_TB IS
END ENTITY HexTo7Seg_TB;

ARCHITECTURE sim OF HexTo7Seg_TB IS
    SIGNAL tb_hex_in  : STD_LOGIC_VECTOR(3 DOWNTO 0) := (OTHERS => '0');
    SIGNAL tb_seg_out : STD_LOGIC_VECTOR(6 DOWNTO 0);
BEGIN
    dut_inst : ENTITY work.HexTo7Seg
        PORT MAP (
            hex_in  => tb_hex_in,
            seg_out => tb_seg_out
        );

	PROCESS is
		VARIABLE cnt : UNSIGNED(3 DOWNTO 0) := (OTHERS => '0');
    BEGIN
		cnt := cnt + 1;
		tb_hex_in <= std_logic_vector(cnt);
        WAIT FOR 10 ns;
    END PROCESS;

END ARCHITECTURE;