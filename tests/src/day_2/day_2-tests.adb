with Trendy_Test;
with Trendy_Test.Assertions.Integer_Assertions;
with Trendy_Test.Assertions.Discrete;

use Trendy_Test.Assertions;
use Trendy_Test.Assertions.Integer_Assertions;

with Day_2.Parser;
with Day_2.Product_Ranges;

with Ada.Text_IO; use Ada.Text_IO;

package body Day_2.Tests is
   package Long_Integer_Assertions
       is new Trendy_Test.Assertions.Discrete (Long_Integer);

   procedure Test_Example (T : in out Trendy_Test.Operation'Class) is
      use Day_2.Product_Ranges;
      use Day_2.Parser;
      Range_Array : constant String_Vectors.Vector := [
         "11-22",
         "95-115",
         "998-1012",
         "1188511880-1188511890",
         "222220-222224",
         "1698522-1698528",
         "446443-446449",
         "38593856-38593862",
         "565653-565659",
         "824824821-824824827",
         "2121212118-2121212124"
      ];
      Ranges : Product_Range_Vectors.Vector;
   begin
      T.Register;
      for R of Range_Array loop
         Ranges.Append (Parse_Range (R));
      end loop;
      Long_Integer_Assertions.Assert_EQ (T, Total_Of_Invalid_Ids (Ranges), 1227775554);
   end Test_Example;

   procedure Test_Invalid_Ids (T : in out Trendy_Test.Operation'Class) is
      use Day_2.Product_Ranges;
   begin
      T.Register;
      Assert_EQ (T, Natural_Sets.Set'Image (Invalid_Ids ((11, 22))), Natural_Sets.Set'Image ([11, 22]));
      Assert_EQ (T, Natural_Sets.Set'Image (Invalid_Ids ((95, 115))), Natural_Sets.Set'Image ([99]));
      Assert_EQ (T, Natural_Sets.Set'Image (Invalid_Ids ((998, 1012))), Natural_Sets.Set'Image ([1010]));
      Assert_EQ (T, Natural_Sets.Set'Image (Invalid_Ids ((1188511880, 1188511890))), Natural_Sets.Set'Image ([1188511885]));
      Assert_EQ (T, Natural_Sets.Set'Image (Invalid_Ids ((222220, 222224))), Natural_Sets.Set'Image ([222222]));
      Assert_EQ (T, Natural_Sets.Set'Image (Invalid_Ids ((1698522, 1698528))), Natural_Sets.Set'Image ([]));
      Assert_EQ (T, Natural_Sets.Set'Image (Invalid_Ids ((446443, 446449))), Natural_Sets.Set'Image ([446446]));
      Assert_EQ (T, Natural_Sets.Set'Image (Invalid_Ids ((38593856, 38593862))), Natural_Sets.Set'Image ([38593859]));
      Assert_EQ (T, Natural_Sets.Set'Image (Invalid_Ids ((565653, 565659))), Natural_Sets.Set'Image ([]));
      Assert_EQ (T, Natural_Sets.Set'Image (Invalid_Ids ((824824821, 824824827))), Natural_Sets.Set'Image ([]));
      Assert_EQ (T, Natural_Sets.Set'Image (Invalid_Ids ((2121212118, 2121212124))), Natural_Sets.Set'Image ([]));
   end Test_Invalid_Ids;

   function All_Tests return Trendy_Test.Test_Group is
   begin
      return
         [
            Test_Example'Access,
            Test_Invalid_Ids'Access
         ];
   end All_Tests;
end Day_2.Tests;
