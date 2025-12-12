package body Day_3.Banks is
   function Joltage_Inner (B : Bank; Start : Positive; Reserve_Digits : Natural; Current_Total : U64) return U64 is
      Best : Digit := 0;
      Position : Positive := Start;
      Current_Digit : Digit := 0;
      Local_Total : U64 := Current_Total;
   begin
      for I in Start .. (Natural (B.Length) - Reserve_Digits) loop
         Current_Digit := B.Element (I);
         if Current_Digit > Best then
            Best := Current_Digit;
            Position := I;
         end if;
      end loop;

      Local_Total := Local_Total + (U64 (Best) * U64 (10 ** Reserve_Digits));

      if Reserve_Digits = 0 then
         return Local_Total;
      end if;

      return Joltage_Inner (B, Position + 1, Reserve_Digits - 1, Local_Total);
   end Joltage_Inner;

   function Joltage (B : Bank; Safety_Override : Boolean) return U64 is
   begin
      if Safety_Override = True then
         return Joltage_Inner (B, 1, 11, 0);
      end if;
      return Joltage_Inner (B, 1, 1, 0);
   end Joltage;

   function Total_Joltage (Banks : Bank_Vectors.Vector; Safety_Override : Boolean) return U64 is
      Total : U64 := 0;
   begin
      for B of Banks loop
         Total := Total + Joltage (B, Safety_Override);
      end loop;
      return Total;
   end Total_Joltage;
end Day_3.Banks;
