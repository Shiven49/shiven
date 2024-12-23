library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity split_48_bits_to_8x6 is
    port(
        data_in   : in  std_logic_vector(47 downto 0);
        data_out_1: out std_logic_vector(5 downto 0); -- holds data 47 to 42
        data_out_2: out std_logic_vector(5 downto 0); -- holds data 41 to 36
        data_out_3: out std_logic_vector(5 downto 0); -- holds data 35 to 30
        data_out_4: out std_logic_vector(5 downto 0); -- holds data 29 to 24
        data_out_5: out std_logic_vector(5 downto 0); -- holds data 23 to 18
        data_out_6: out std_logic_vector(5 downto 0); -- holds data 17 to 12
        data_out_7: out std_logic_vector(5 downto 0); -- holds data 11 to 6
        data_out_8: out std_logic_vector(5 downto 0)  -- holds data 5 to 0
    );
end split_48_bits_to_8x6;

architecture behavior of split_48_bits_to_8x6 is
begin
    -- Assign 6-bit segments to each output signal
    data_out_1 <= data_in(47 downto 42);
    data_out_2 <= data_in(41 downto 36);
    data_out_3 <= data_in(35 downto 30);
    data_out_4 <= data_in(29 downto 24);
    data_out_5 <= data_in(23 downto 18);
    data_out_6 <= data_in(17 downto 12);
    data_out_7 <= data_in(11 downto 6);
    data_out_8 <= data_in(5 downto 0);

end behavior;
