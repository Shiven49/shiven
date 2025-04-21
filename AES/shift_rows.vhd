library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.aes_pkg.all;

entity shift_rows is
  port (
    clk         : in std_logic;
    reset       : in std_logic;
    data_in  : in  DATA_BLOCK;
    data_out : out DATA_BLOCK
  );
end entity;

architecture optimized of shift_rows is
begin
  process(data_in)
  begin
    -- First row remains unchanged
    for j in 0 to 3 loop
      data_out(0, j) <= data_in(0, j);
    end loop;

    -- Perform cyclic left shifts for each row
    for j in 0 to 3 loop
      data_out(1, j) <= data_in(1, (j + 1) mod 4);
      data_out(2, j) <= data_in(2, (j + 2) mod 4);
      data_out(3, j) <= data_in(3, (j + 3) mod 4);
    end loop;
  end process;
end architecture;
