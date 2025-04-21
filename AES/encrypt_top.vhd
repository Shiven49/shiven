library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

library work;
use work.aes_pkg.all;

entity aes_top is
  port (
    clk         : in std_logic;
    reset       : in std_logic;
    plaintext   : in DATA_BLOCK;
    input_key   : in DATA_BLOCK;
    ciphertext  : out DATA_BLOCK
  );
end entity;

architecture arch of aes_top is

component sbox_block is
    port (
      clk         : in std_logic;
      reset       : in std_logic;
      data_in  : in DATA_BLOCK;
      data_out : out DATA_BLOCK
    );
  end component;

  component shift_rows is
    port (
      clk         : in std_logic;
      reset       : in std_logic;
      data_in  : in DATA_BLOCK;
      data_out : out DATA_BLOCK
    );
  end component;

  component mix_column_block is
    port (
      clk         : in std_logic;
      reset       : in std_logic;
      data_in  : in DATA_BLOCK;
      data_out : out DATA_BLOCK
    );
  end component;

  component add_round_key is
 port (
    clk         : in std_logic;
    reset       : in std_logic;
    data_in      : in  DATA_BLOCK;
    cipher_block : in  DATA_BLOCK;
    data_out     : out DATA_BLOCK
  );
  end component;


  component create_round_key
    port (
      clk         : in std_logic;
      reset       : in std_logic;
      cipher_block : in DATA_BLOCK;
      round_count  : in std_logic_vector(7 downto 0);
      out_block    : out DATA_BLOCK
    );
  end component;

  signal round0_out, round1_key, sub_out1, shift_out1, mix_out1, round1_out ,round2_key,sub_out2 ,shift_out2,mix_out2,
  round2_out: DATA_BLOCK;
  signal round3_out, round3_key, sub_out3, shift_out3, mix_out3, round4_out ,round4_key,sub_out4 ,shift_out4,mix_out4,
  round5_out: DATA_BLOCK;
  signal  round5_key, sub_out5, shift_out5, mix_out5,round8_key,sub_out8 ,shift_out8,mix_out8,
  round6_out: DATA_BLOCK;
  signal  round6_key, sub_out6, shift_out6, mix_out6,round10_key,sub_out10 ,shift_out10,mix_out10,
  round7_out: DATA_BLOCK;
  signal round10_out, round7_key, sub_out7, shift_out7, mix_out7, round9_out ,round9_key,sub_out9 ,shift_out9,mix_out9,
  round8_out: DATA_BLOCK;

begin

  -- Initial AddRoundKey (Round 0)
  round0: add_round_key
    port map (
      clk        => clk,
      reset      => reset,
      data_in      => plaintext,
      cipher_block => input_key,
      data_out     => round0_out
    );
------------round 1 --------------------


  key_exp1: create_round_key
    port map (
      clk        => clk,
      reset      => reset,
      cipher_block => input_key,
      round_count  => X"01",  -- Round 1
      out_block    => round1_key
    ); 
    -- SubBytes
  sub1: sbox_block
    port map (
      clk        => clk,
      reset      => reset,
      data_in  => round0_out,
      data_out => sub_out1
    );
  -- ShiftRows
  shift1: shift_rows
    port map (
       clk        => clk,
      reset      => reset,
      data_in  => sub_out1,
      data_out => shift_out1
    );
  -- MixColumns
  mix1: mix_column_block
    port map (
      clk        => clk,
      reset      => reset,
      data_in  => shift_out1,
      data_out => mix_out1
    );
  
  -- AddRoundKey (Round 1)
  round1: add_round_key
    port map (
      clk        => clk,
      reset      => reset,
      data_in      => mix_out1,
      cipher_block => round1_key,
      data_out     => round1_out
    );

---------round 2 ------------------------

  key_exp2: create_round_key
    port map (
      clk        => clk,
      reset      => reset,
      cipher_block => round1_key,
      round_count  => X"02",  -- Round 2
      out_block    => round2_key
    ); 
  -- SubBytes
  sub2: sbox_block
    port map (
      clk        => clk,
      reset      => reset,
      data_in  => round1_out,
      data_out => sub_out2
    );
  -- ShiftRows
  shift2: shift_rows
    port map (
      clk        => clk,
      reset      => reset,
      data_in  => sub_out2,
      data_out => shift_out2
    );
  -- MixColumns
  mix2: mix_column_block
    port map (
      clk        => clk,
      reset      => reset,
      data_in  => shift_out2,
      data_out => mix_out2
    );
  
  -- AddRoundKey (Round 1)
  round2: add_round_key
    port map (
      clk        => clk,
      reset      => reset,
      data_in      => mix_out2,
      cipher_block => round2_key,
      data_out     => round2_out
    );


--------------round 3 ------------------------

  key_exp3: create_round_key
    port map (
      clk        => clk,
      reset      => reset,
      cipher_block => round2_key,
      round_count  => X"04",  -- Round 3
      out_block    => round3_key
    ); 
  -- SubBytes
  sub3: sbox_block
    port map (
      clk        => clk,
      reset      => reset,
      data_in  => round2_out,
      data_out => sub_out3
    );
  -- ShiftRows
  shift3: shift_rows
    port map (
       clk        => clk,
      reset      => reset,
      data_in  => sub_out3,
      data_out => shift_out3
    );
  -- MixColumns
  mix3: mix_column_block
    port map (
      clk        => clk,
      reset      => reset,
      data_in  => shift_out3,
      data_out => mix_out3
    );
  
  -- AddRoundKey 
  round3: add_round_key
    port map (
      clk        => clk,
      reset      => reset,
      data_in      => mix_out3,
      cipher_block => round3_key,
      data_out     => round3_out
    );


----------------round 4 -------------------

  key_exp4: create_round_key
    port map (
      clk        => clk,
      reset      => reset,
      cipher_block => round3_key,
      round_count  => X"08",  -- Round 4
      out_block    => round4_key
    ); 
  -- SubBytes
  sub4: sbox_block
    port map (
      clk        => clk,
      reset      => reset,
      data_in  => round3_out,
      data_out => sub_out4
    );
  -- ShiftRows
  shift4: shift_rows
    port map (
      clk        => clk,
      reset      => reset,
      data_in  => sub_out4,
      data_out => shift_out4
    );
  -- MixColumns
  mix4: mix_column_block
    port map (
      clk        => clk,
      reset      => reset,
      data_in  => shift_out4,
      data_out => mix_out4
    );
  
  -- AddRoundKey (Round 1)
  round4: add_round_key
    port map (
      clk        => clk,
      reset      => reset,
      data_in      => mix_out4,
      cipher_block => round4_key,
      data_out     => round4_out
    );



--------------round 5 --------------

  key_exp5: create_round_key
    port map (
      clk        => clk,
      reset      => reset,
      cipher_block => round4_key,
      round_count  => X"10",  -- Round 5
      out_block    => round5_key
    ); 
  -- SubBytes
  sub5: sbox_block
    port map (
      clk        => clk,
      reset      => reset,
      data_in  => round4_out,
      data_out => sub_out5
    );
  -- ShiftRows
  shift5: shift_rows
    port map (
      clk        => clk,
      reset      => reset,
      data_in  => sub_out5,
      data_out => shift_out5
    );
  -- MixColumns
  mix5: mix_column_block
    port map (
      clk        => clk,
      reset      => reset,
      data_in  => shift_out5,
      data_out => mix_out5
    );
  
  -- AddRoundKey 
  round5: add_round_key
    port map (
      clk        => clk,
      reset      => reset,
      data_in      => mix_out5,
      cipher_block => round5_key,
      data_out     => round5_out
    );


 
 ----------------round 6 ------------------
 

  key_exp6: create_round_key
    port map (
      clk        => clk,
      reset      => reset,
      cipher_block => round5_key,
      round_count  => X"20",  -- Round 6
      out_block    => round6_key
    ); 
  -- SubBytes
  sub6: sbox_block
    port map (
      clk        => clk,
      reset      => reset,
      data_in  => round5_out,
      data_out => sub_out6
    );
  -- ShiftRows
  shift6: shift_rows
    port map (
      clk        => clk,
      reset      => reset,
      data_in  => sub_out6,
      data_out => shift_out6
    );
  -- MixColumns
  mix6: mix_column_block
    port map (
      clk        => clk,
      reset      => reset,
      data_in  => shift_out6,
      data_out => mix_out6
    );
  
  -- AddRoundKey 
  round6: add_round_key
    port map (
      clk        => clk,
      reset      => reset,
      data_in      => mix_out6,
      cipher_block => round6_key,
      data_out     => round6_out
    );


  
  ------------------round 7 ----------------
 
  key_exp7: create_round_key
    port map (
      clk        => clk,
      reset      => reset,
      cipher_block => round6_key,
      round_count  => X"40",  -- Round 7
      out_block    => round7_key
    ); 
  -- SubBytes
  sub7: sbox_block
    port map (
      clk        => clk,
      reset      => reset,
      data_in  => round6_out,
      data_out => sub_out7
    );
  -- ShiftRows
  shift7: shift_rows
    port map (
      clk        => clk,
      reset      => reset,
      data_in  => sub_out7,
      data_out => shift_out7
    );
  -- MixColumns
  mix7: mix_column_block
    port map (
      clk        => clk,
      reset      => reset,
      data_in  => shift_out7,
      data_out => mix_out7
    );
  
  -- AddRoundKey 
  round7: add_round_key
    port map (
      clk        => clk,
      reset      => reset,
      data_in      => mix_out7,
      cipher_block => round7_key,
      data_out     => round7_out
    );


  
  --------------------round 8 ----------------------

  key_exp8: create_round_key
    port map (
      clk        => clk,
      reset      => reset,
      cipher_block => round7_key,
      round_count  => X"80",  -- Round 8
      out_block    => round8_key
    ); 
  -- SubBytes
  sub8: sbox_block
    port map (
      clk        => clk,
      reset      => reset,
      data_in  => round7_out,
      data_out => sub_out8
    );
  -- ShiftRows
  shift8: shift_rows
    port map (
      clk        => clk,
      reset      => reset,
      data_in  => sub_out8,
      data_out => shift_out8
    );
  -- MixColumns
  mix8: mix_column_block
    port map (
       clk        => clk,
      reset      => reset,
      data_in  => shift_out8,
      data_out => mix_out8
    );
  
  -- AddRoundKey 
  round8: add_round_key
    port map (
      clk        => clk,
      reset      => reset,
      data_in      => mix_out8,
      cipher_block => round8_key,
      data_out     => round8_out
    );


  ----------------round 9 -------------------
  

  key_exp9: create_round_key
    port map (
      clk        => clk,
      reset      => reset,
      cipher_block => round8_key,
      round_count  => X"1B",  -- Round 9
      out_block    => round9_key
    ); 
  -- SubBytes
  sub9: sbox_block
    port map (
      clk        => clk,
      reset      => reset,
      data_in  => round8_out,
      data_out => sub_out9
    );
  -- ShiftRows
  shift9: shift_rows
    port map (
      clk        => clk,
      reset      => reset,
      data_in  => sub_out9,
      data_out => shift_out9
    );
  -- MixColumns
  mix9: mix_column_block
    port map (
      clk        => clk,
      reset      => reset,
      data_in  => shift_out9,
      data_out => mix_out9
    );
  
  -- AddRoundKey 
  round9: add_round_key
    port map (
      clk        => clk,
      reset      => reset,
      data_in      => mix_out9,
      cipher_block => round9_key,
      data_out     => round9_out
    );


  
  ---------------round 10 -------------

  key_exp10: create_round_key
    port map (
      clk        => clk,
      reset      => reset,
      cipher_block => round9_key,
      round_count  => X"36",  -- Round 10
      out_block    => round10_key
    ); 
  -- SubBytes
  sub10: sbox_block
    port map (
      clk        => clk,
      reset      => reset,
      data_in  => round9_out,
      data_out => sub_out10
    );
  -- ShiftRows
  shift10: shift_rows
    port map (
      clk        => clk,
      reset      => reset,
      data_in  => sub_out10,
      data_out => shift_out10
    );

  -- AddRoundKey 
  round10: add_round_key
    port map (
      clk        => clk,
      reset      => reset,
      data_in      => shift_out10,
      cipher_block => round10_key,
      data_out     => round10_out
    );

  -- Final output after round 10
  ciphertext <= round10_out;

end architecture;
