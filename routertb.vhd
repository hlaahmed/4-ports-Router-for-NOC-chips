-- TestBench Template 

  LIBRARY ieee;
  USE ieee.std_logic_1164.ALL;
  USE ieee.numeric_std.ALL;

  ENTITY routertb IS
  
  END routertb;

  ARCHITECTURE behavior OF routertb IS 

  -- Component Declaration
 COMPONENT router is

generic( n : integer :=7);
port( datai1,datai2,datai3,datai4: in std_logic_vector(n downto 0);
      reset,wclk,rclk,wr1,wr2,wr3,wr4: in std_logic;
		datao1,datao2,datao3,datao4: out std_logic_vector(n downto 0));

end component router;

   --Inputs 
	
   signal reset,wclk,rclk,wr1,wr2,wr3,wr4 : std_logic := '0';
   signal datai1,datai2,datai3,datai4:std_logic_vector(7 downto 0);
	
	
 	--Outputs
   signal datao1,datao2,datao3,datao4:std_logic_vector(7 downto 0);
 

   -- Clock period definitions
   constant rclk_period : time := 10 ns;
   constant wclk_period : time := 10 ns;
 

  BEGIN

  -- Component Instantiation
         uut: router PORT MAP (
          reset => reset,
          rclk => rclk,
          wclk => wclk,
          wr1=> wr1,
          wr2 => wr2,
			 wr3=>wr3,
			 wr4=>wr4,
			 datai1=>datai1,
			 datai2=>datai2,
			 datai3=>datai3,
			 datai4=>datai4,
			 datao1=>datao1,
			 datao2=>datao2,
			 datao3=>datao3,
			 datao4=>datao4 
        );
rclk_process :process
   begin
		rclk <= '0';
		wait for rclk_period/2;
		rclk <= '1';
		wait for rclk_period/2;
   end process;
 
   wclk_process :process
   begin
		wclk <= '0';
		wait for wclk_period/2;
		wclk <= '1';
		wait for wclk_period/2;
   end process;
  --  Test Bench Statements
     tb : PROCESS
     BEGIN
	   reset<='1';
		wait for 10 ns;
		reset<='0';
	  wr1<='1';
		wr2<='1';
		wr3<='1';
		wr4<='1';
		datai1<="00000001";
		datai2<="10100011";
		datai3<="11011111";
		datai4<="11001101";
	  wait for 10 ns;
	  wr1<='1';
		wr2<='1';
		wr3<='1';
		wr4<='1';
		wait for 10 ns;
	  datai1<="11011001";
		datai2<="01000011";
		datai3<="01000111";
		datai4<="01111111";
		 wr1<='0';
		wr2<='0';
		wr3<='0';
		wr4<='0';
     wait for 10 ns;
	    wr1<='1';
		wr2<='1';
		wr3<='1';
		wr4<='1';
      wait for 10 ns;
		datai1<="10000001";
		datai2<="10001011";
		datai3<="10000111";
		datai4<="10001111";
		wr1<='0';
		wr2<='0';
		wr3<='0';
		wr4<='0';
		wait for 10 ns;
		reset<='0';
	         wr1<='1';
		wr2<='1';
		wr3<='1';
		wr4<='1';
	  wait for 10 ns;
	    wr1<='0';
		wr2<='0';
		wr3<='0';
		wr4<='0';
      wait for 10 ns;
		
	
     END PROCESS tb;
  --  End Test Bench 

  END;
