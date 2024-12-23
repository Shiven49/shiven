library ieee;
use ieee.std_logic_1164.all;

entity left_shift_by_2 is
    port(
        data_in: in std_logic_vector(0 to 27);
        data_out: out std_logic_vector(0 to 27)
    );
end left_shift_by_2;

architecture behavior of left_shift_by_2 is
begin
    -- Perform left circular shift by 2 bits
   data_out <= data_in(2 to 27) & data_in(0 to 1);

end behavior;
