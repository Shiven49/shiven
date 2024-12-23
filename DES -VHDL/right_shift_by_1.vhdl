library ieee;
use ieee.std_logic_1164.all;

entity right_shift_by_1 is    --for RHS 28 bits left shift by 1 code  ,
    port(
        data_in: in std_logic_vector(0 to 27);
        data_out: out std_logic_vector(0 to 27)
    );
end right_shift_by_1;

architecture behavior of left_shift_by_1 is
begin
    -- Perform left circular shift by 1
    data_out <= data_in(26 downto 0) & data_in(27); -- Shift left and wrap the last bit
end behavior;
