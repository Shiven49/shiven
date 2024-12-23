library ieee;
use ieee.std_logic_1164.all;

entity left_shift_by_1 is
    port(
        data_in: in std_logic_vector(0 to 27);
        data_out: out std_logic_vector(0 to 27)
    );
end left_shift_by_1;

architecture behavior of left_shift_by_1 is
begin
    -- Perform left circular shift by 1
    data_out <= data_in(1 to 27) & data_in(0); -- Shift left by 1 and wrap the first bit
end behavior;
