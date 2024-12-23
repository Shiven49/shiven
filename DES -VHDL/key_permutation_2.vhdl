library ieee;
use ieee.std_logic_1164.all;

entity key_permutation_2 is
    port (
        left_half: in std_logic_vector(0 to 27);  -- Adjusted to 0 to 27
        right_half: in std_logic_vector(0 to 27); -- Adjusted to 0 to 27
        permuted_key: out std_logic_vector(0 to 47) -- Adjusted to 0 to 47
    );
end entity key_permutation_2;

architecture behavior of key_permutation_2 is

    -- Signal to merge left_half and right_half
    signal merged_halfs: std_logic_vector(0 to 55); -- Adjusted to 0 to 55

begin

    -- Combine left_half and right_half into merged_halfs
    merged_halfs <= left_half & right_half;

    -- Permutation according to the specified index order
   permuted_key <= merged_halfs(13) & merged_halfs(16) & merged_halfs(10) & merged_halfs(23) & 
                merged_halfs(0)  & merged_halfs(4)  & merged_halfs(2)  & merged_halfs(27) &
                merged_halfs(14) & merged_halfs(5)  & merged_halfs(20) & merged_halfs(9)  &
                merged_halfs(22) & merged_halfs(18) & merged_halfs(11) & merged_halfs(3)  &
                merged_halfs(25) & merged_halfs(7)  & merged_halfs(15) & merged_halfs(6)  &
                merged_halfs(26) & merged_halfs(19) & merged_halfs(12) & merged_halfs(1)  &
                merged_halfs(40) & merged_halfs(51) & merged_halfs(30) & merged_halfs(36) &
                merged_halfs(46) & merged_halfs(54) & merged_halfs(29) & merged_halfs(39) &
                merged_halfs(50) & merged_halfs(44) & merged_halfs(32) & merged_halfs(47) &
                merged_halfs(43) & merged_halfs(48) & merged_halfs(38) & merged_halfs(55) &
                merged_halfs(33) & merged_halfs(52) & merged_halfs(45) & merged_halfs(41) &
                merged_halfs(49) & merged_halfs(35) & merged_halfs(28) & merged_halfs(31);



end architecture behavior;
