library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity reverse_initial_permutation is 
    port(
        permuted_left_half: in std_logic_vector(0 to 31);
        permuted_right_half: in std_logic_vector(0 to 31);
        data_out: out std_logic_vector(0 to 63)
    );
end reverse_initial_permutation;

architecture behavior of reverse_initial_permutation is
    signal permuted_data: std_logic_vector(0 to 63);
begin
    -- Concatenate the left and right halves into permuted_data
    permuted_data <= permuted_left_half & permuted_right_half;

    -- Reverse Initial Permutation Assignment
    data_out <= permuted_data(39) & permuted_data(7)  & permuted_data(47) & permuted_data(15) &
                permuted_data(55) & permuted_data(23) & permuted_data(63) & permuted_data(31) &
                permuted_data(38) & permuted_data(6)  & permuted_data(46) & permuted_data(14) &
                permuted_data(54) & permuted_data(22) & permuted_data(62) & permuted_data(30) &
                permuted_data(37) & permuted_data(5)  & permuted_data(45) & permuted_data(13) &
                permuted_data(53) & permuted_data(21) & permuted_data(61) & permuted_data(29) &
                permuted_data(36) & permuted_data(4)  & permuted_data(44) & permuted_data(12) &
                permuted_data(52) & permuted_data(20) & permuted_data(60) & permuted_data(28) &
                permuted_data(35) & permuted_data(3)  & permuted_data(43) & permuted_data(11) &
                permuted_data(51) & permuted_data(19) & permuted_data(59) & permuted_data(27) &
                permuted_data(34) & permuted_data(2)  & permuted_data(42) & permuted_data(10) &
                permuted_data(50) & permuted_data(18) & permuted_data(58) & permuted_data(26) &
                permuted_data(33) & permuted_data(1)  & permuted_data(41) & permuted_data(9)  &
                permuted_data(49) & permuted_data(17) & permuted_data(57) & permuted_data(25) &
                permuted_data(32) & permuted_data(0)  & permuted_data(40) & permuted_data(8)  &
                permuted_data(48) & permuted_data(16) & permuted_data(56) & permuted_data(24);

end behavior;
