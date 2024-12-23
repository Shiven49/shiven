library ieee;
use ieee.std_logic_1164.all;

entity xor_48_bits is
    port (
        data_in  : in  std_logic_vector(47 downto 0);  
        key      : in  std_logic_vector(47 downto 0);
        data_out : out std_logic_vector(47 downto 0)
    );
end entity xor_48_bits;

architecture behavior of xor_48_bits is
begin
    -- Directly assigning the XOR result of `data_in` and `key` to `data_out`
    data_out <= data_in xor key;
end architecture behavior;
