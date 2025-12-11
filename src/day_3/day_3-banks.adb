package body Day_3.Banks is
   type Check_Pair is record 
      Value : Digit := 0;
      Position : Positive := 1;
   end record;

   function Joltage (B : Bank) return Natural is
      Length : Natural;
      First_Digit : Check_Pair;
      Second_Digit : Digit := 0;
      Current_Digit : Digit := 0;
      Result : Natural;
   begin
      Length := Natural (B.Length);
      for I in 1 .. Length - 1 loop
         Current_Digit := B.Element (I);
         if Current_Digit > First_Digit.Value then
            First_Digit.Value := Current_Digit;
            First_Digit.Position := I;
         end if;
      end loop;

      Current_Digit := 0;
      for I in (First_Digit.Position + 1) .. Length loop
         Current_Digit := B.Element (I);
         if Current_Digit > Second_Digit then
            Second_Digit := Current_Digit;
         end if;
      end loop;

      return (First_Digit.Value * 10) + Second_Digit;
   end Joltage;

   function Total_Joltage (Banks : Bank_Vectors.Vector) return Natural is
      Total : Natural := 0;
   begin
      for B of Banks loop
         Total := Total + Joltage (B);
      end loop;
      return Total;
   end Total_Joltage;
end Day_3.Banks;
