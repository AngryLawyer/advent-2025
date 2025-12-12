with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings;

package body Day_2.Product_Ranges is
   function Count_Digits (N : U64) return Natural is
      S : Unbounded_String;
   begin
      S := To_Unbounded_String (N'Image);
      Trim (S, Ada.Strings.Both);
      return Length (S);
   end Count_Digits;

   function Duplicated (N : U64; Size : Positive; Repetitions : Positive) return U64
   is
      Len : Natural;
      Sliced : U64;
      Acc : U64 := 0;
   begin
      Len := Count_Digits (N);
      Sliced := N / (10 ** (Len - Size));

      for I in 0 .. (Repetitions - 1) loop
         Acc := Acc + (Sliced * (10 ** (I * Size)));
      end loop;

      return Acc;
   end Duplicated;

   procedure Invalid_Ids_For_Length (R : Product_Range; Digit_Count : Positive; Divisor : Positive; Matches : in out U64_Sets.Set) is
      Start_Check : U64;
      Stop_Check : U64;
      Step : U64;
      I : U64;
      Duplicated_Number : U64;
      Chunk_Size : Positive;
   begin
      Chunk_Size := Digit_Count / Divisor;
      Step := 10 ** Chunk_Size;
      Start_Check := R.Left / Step * Step;
      Stop_Check := R.Right / Step * Step;
      I := Start_Check;
      while I <= Stop_Check loop
         Duplicated_Number := Duplicated (I, Chunk_Size, Divisor);
         if Duplicated_Number >= R.Left and then Duplicated_Number <= R.Right then
            if Matches.Contains (Duplicated_Number) = False then
               Matches.Insert (Duplicated_Number);
            end if;
         end if;
         I := I + Step;
      end loop;
   end Invalid_Ids_For_Length;

   function Invalid_Ids (R : Product_Range; Any_Repeated : Boolean) return U64_Sets.Set is
      Digit_Count : Positive;
      Divisors: Positive_Sets.Set;
      Left_Digits : Positive;
      Right_Digits : Positive;
      Invalid_Numbers : U64_Sets.Set;
   begin
      Left_Digits := Count_Digits (R.Left);
      Right_Digits := Count_Digits (R.Right);

      if not Any_Repeated then
         Divisors.Insert (2);
      else
         -- Find all factors, and discard 1 as we need a minimum of 2 loops
         for I in Left_Digits .. Right_Digits loop
            Divisors := Divisors.Union (Factors (I));
         end loop;
         Divisors.Delete (1);
      end if;

      for Divisor of Divisors loop
         Invalid_Ids_For_Length (R, Right_Digits, Divisor, Invalid_Numbers);
      end loop;
      return Invalid_Numbers;
   end Invalid_Ids;

   function Total_Of_Invalid_Ids (RS : Product_Range_Vectors.Vector; Any_Repeated : Boolean) return U64 is
      Invalid_Numbers : U64_Sets.Set;
      Output : U64 := 0;
   begin
      for R of RS loop
         Invalid_Numbers.Union (Invalid_Ids (R, Any_Repeated));
      end loop;
      for I of Invalid_Numbers loop
         Output := Output + I;
      end loop;
      return Output;
   end Total_Of_Invalid_Ids;

end Day_2.Product_Ranges;
