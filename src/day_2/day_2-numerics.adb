package body Day_2.Numerics is
   function Factors (N : Positive) return Positive_Sets.Set is
      Output : Positive_Sets.Set;
   begin
      for I in 1 .. N loop
         if N mod I = 0 then
            Output.Insert (I);
         end if;
      end loop;
      return Output;
   end Factors;
end Day_2.Numerics;
