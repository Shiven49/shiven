library ieee;
use ieee.std_logic_1164.all;

entity right_shift_by_2 is          -- for RHS 28 bits left shift by 2 code 
    port(
        data_in: in std_logic_vector(0 to 27);
        data_out: out std_logic_vector(0 to 27)
    );
end right_shift_by_2;

architecture behavior of right_shift_by_2 is
begin
    -- Perform left circular shift by 2 bits
    data_out <= data_in(25 downto 0) & data_in(27 downto 26);
end behavior;
