with Trendy_Test;
with Trendy_Test.Assertions.Integer_Assertions;

use Trendy_Test.Assertions;
use Trendy_Test.Assertions.Integer_Assertions;

with Day_2.Parser;
with Day_2.Product_Range;

with Ada.Text_IO; use Ada.Text_IO;

package body Day_2.Tests is
   procedure Test_Example (T : in out Trendy_Test.Operation'Class) is
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
      Current_Range : Day_2.Product_Range.Product_Range;
      Total : Natural := 0;
   begin
      T.Register;
      for R of Range_Array loop
         Current_Range := Day_2.Parser.Parse_Range (R);
         Total := Total + Day_2.Product_Range.Total_Invalid_Ids (Current_Range);
      end loop;
      Assert_EQ (T, Total, 1227775554);
   end Test_Example;

   procedure Test_Total_Invalid_Ids (T : in out Trendy_Test.Operation'Class) is
      use Day_2.Product_Range;
   begin
      T.Register;
      Assert_EQ (T, Total_Invalid_Ids ((11, 22)), 2);
      Assert_EQ (T, Total_Invalid_Ids ((95, 115)), 1);
   end Test_Total_Invalid_Ids;

   function All_Tests return Trendy_Test.Test_Group is
   begin
      return
         [
            Test_Example'Access,
            Test_Total_Invalid_Ids'Access
         ];
   end All_Tests;
end Day_2.Tests;
