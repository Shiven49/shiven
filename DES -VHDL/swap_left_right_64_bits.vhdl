library ieee;
use ieee.std_logic_1164.all;

-- This function swaps the left and right 32-bit halves of a 64-bit data block
-- Used in DES after the final round to complete encryption with a reverse permutation

entity swap_left_right_64_bits is
    port(
        data_in_left: in std_logic_vector(31 downto 0);  -- 32-bit input left half
        data_in_right: in std_logic_vector(31 downto 0); -- 32-bit input right half
        data_out_left: out std_logic_vector(31 downto 0); -- Swapped output left half
        data_out_right: out std_logic_vector(31 downto 0) -- Swapped output right half
    );
end swap_left_right_64_bits;

architecture behavior of swap_left_right_64_bits is
begin
    data_out_left <= data_in_right; -- Swapping left half with right half
    data_out_right <= data_in_left; -- Swapping right half with left half
end behavior;
