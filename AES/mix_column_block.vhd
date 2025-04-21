library IEEE;
use IEEE.std_logic_1164.all;
use ieee.numeric_std.all;

library work;
use work.aes_pkg.all;

entity mix_column_block is
  port (
    clk         : in std_logic;
    reset       : in std_logic;
    data_in  : in DATA_BLOCK;
    data_out : out DATA_BLOCK
  );
end entity;

architecture arch of mix_column_block is

  component mix_column is
    port (
        clk         : in std_logic;
       reset       : in std_logic;
      data_in  : in DATA_COLUMN;
      data_out : out DATA_COLUMN
    );
  end component;

  signal tmp_in, tmp_out : DATA_COLUMN_ARRAY;


begin

  -- Generate loop to instantiate mix_column for each column
  gen_mix: for i in 0 to 3 generate
    u: mix_column port map(
                clk        => clk,
       reset      => reset,
      data_in  => tmp_in(i),
      data_out => tmp_out(i)
    );
  end generate;

  -- Extract columns from state matrix
  process(data_in)
  begin
    for i in 0 to 3 loop
      for j in 0 to 3 loop
        tmp_in(i)(j) <= data_in(j, i);  -- Extract column
      end loop;
    end loop;
  end process;

  -- Assign processed data back to output state matrix
  process(tmp_out)
  begin
    for i in 0 to 3 loop
      for j in 0 to 3 loop
        data_out(j, i) <= tmp_out(i)(j);  -- Assign back column-wise
      end loop;
    end loop;
  end process;

end architecture;
