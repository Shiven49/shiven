library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity s1_box is
    port(
        data_in: in std_logic_vector(0 to 5);
        data_out: out std_logic_vector(0 to 3)
    );
end s1_box;

architecture behavior of s1_box is

    type s1box is array(0 to 3, 0 to 15) of integer range 0 to 15;
    constant box: s1box := (
        (14, 4, 13, 1, 2, 15, 11, 8, 3, 10, 6, 12, 5, 9, 0, 7),
        (0, 15, 7, 4, 14, 2, 13, 1, 10, 6, 12, 11, 9, 5, 3, 8),
        (4, 1, 14, 8, 13, 6, 2, 11, 15, 12, 9, 7, 3, 10, 5, 0),
        (15, 12, 8, 2, 4, 9, 1, 7, 5, 11, 3, 14, 10, 0, 6, 13)
    );

begin

    process(data_in)
        variable row: std_logic_vector(0 to 1);
        variable column: std_logic_vector(0 to 3);
        variable data_out_decimal: integer range 0 to 15;

    begin
        -- Extract the column from bits 1 to 4 of data_in
        column := data_in(1 to 4);
        
        -- Construct the row value from the first and last bits of data_in
        row := data_in(0) & data_in(5); 

        -- Get the output from the S-Box based on row and column
        data_out_decimal := box(to_integer(unsigned(row)), to_integer(unsigned(column)));

        -- Convert the output decimal value to std_logic_vector
        data_out <= std_logic_vector(to_unsigned(data_out_decimal, data_out'length));

    end process;

end behavior;
