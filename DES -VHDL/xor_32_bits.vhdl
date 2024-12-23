library ieee;
use ieee.std_logic_1164.all;



entity xor_32_bits is
    port (
        data_in  : in  std_logic_vector(0 to 31);  
        lhs_bits : in  std_logic_vector(0 to 31);
        data_out : out std_logic_vector(0 to 31)
    );
end entity xor_32_bits;

architecture behavior of xor_32_bits is
begin
    -- Performing XOR operation between `lhs_bits` and `data_in`
    data_out <= data_in xor lhs_bits ;
end architecture behavior;
