with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings;

package body Day_2.Product_Ranges is
   function Count_Digits (N : Long_Natural) return Natural is
      package Float_Functions is
         new Ada.Numerics.Generic_Elementary_Functions (Long_Float);
   begin
      if N = 0 then
         return 0;
      end if;
      return Natural (Long_Float'Floor (Float_Functions.Log (Long_Float (N), 10.0))) + 1;
   end Count_Digits;

   function Duplicated (N : Long_Natural) return Long_Natural
      with Pre => Count_Digits (N) mod 2 = 0
   is
      S : Unbounded_String;
      Half : Natural;
   begin
      S := To_Unbounded_String (N'Image);
      Trim (S, Ada.Strings.Both);
      Half := (Length (S)) / 2;

      return Long_Natural'Value (Slice (S, 1, Half) & Slice (S, 1, Half));
   end Duplicated;

   function Invalid_Ids (R : Product_Range) return Natural_Sets.Set is
      Start_Check : Long_Natural;
      Stop_Check : Long_Natural;
      Step : Long_Natural;
      I : Long_Natural;
      D : Long_Natural;
      Invalid_Numbers: Natural_Sets.Set;
   begin
      Step := 10 ** (Count_Digits (R.Left) / 2);
      Start_Check := R.Left / Step * Step;
      Stop_Check := R.Right / Step * Step;
      I := Start_Check;
      Put_Line ("In range " & R.Left'Image & R.Right'Image);
      while I <= Stop_Check loop
         -- Impossible to have a duplicated string on odd character count
         if Count_Digits (I) mod 2 = 0 then
            D := Duplicated (I);
            if D >= R.Left and then D <= R.Right then
               Put_Line (I'Image & " Duplicated" & D'Image);
               if Invalid_Numbers.Contains (D) = false then
                  Invalid_Numbers.Insert (D);
               end if;
            end if;
         end if;
         I := I + Step;
      end loop;
      return Invalid_Numbers;
   end Invalid_Ids;

   function Total_Of_Invalid_Ids (RS : Product_Range_Vectors.Vector) return Long_Natural is
      Invalid_Numbers : Natural_Sets.Set;
      Output : Long_Natural := 0;
   begin
      for R of RS loop
         Invalid_Numbers.Union (Invalid_Ids (R));
      end loop;
      for I of Invalid_Numbers loop
         Output := Output + I;
      end loop;
      return Output;
   end Total_Of_Invalid_Ids;

end Day_2.Product_Ranges;
