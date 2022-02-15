entity oneBitFullAdder is
	generic(prop_delay: Time := 10 ns);
	port(a_in,b_in,carry_in: in bit;
	result,carry_out: out bit);
end entity oneBitFullAdder;

architecture behaviour1 of oneBitFullAdder is
begin
	oneProcess : process(a_in,b_in,carry_in) is
	
begin
	if a_in = '0' then 
		if b_in = '0' then
			if carry_in = '0' then
-- All three variable = 0--
			result <= '0' after prop_delay;
			carry_out <= '0' after prop_delay;
		
			else
--a_in = 0, b_in = 0, carry_in = 1--
			result <= '1' after prop_delay;
			carry_out <= '0' after prop_delay;
			end if;
		else 
--a_in = 0, b_in = 1, 
			if carry_in = '0' then
			result <= '1' after prop_delay;
			carry_out <= '0' after prop_delay;
			
			else 

			result <= '0' after prop_delay;
			carry_out <= '1' after prop_delay;
		
			end if;
		end if;
	else 
--a_in = 1
			if b_in = '0' then
--a_in = 1. b_in = 0
			if carry_in = '0' then				
			result <= '1' after prop_delay;
			carry_out <= '0' after prop_delay;
				
			else
				
			result <= '0' after prop_delay;
				carry_out <= '1' after prop_delay;

			end if;						

			else 
--a_in = 1. b_in = 1
			if carry_in = '0' then
			result <= '0' after prop_delay;
			carry_out <= '1' after prop_delay;
				
			else
				
			result <= '1' after prop_delay;
			carry_out <= '1' after prop_delay;

			end if; 
		end if;
	end if;
end process oneProcess;
end architecture behaviour1;