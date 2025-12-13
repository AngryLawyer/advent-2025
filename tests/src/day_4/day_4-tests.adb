with Trendy_Test;
with Trendy_Test.Assertions.Discrete;
with Trendy_Test.Assertions.Integer_Assertions;

use Trendy_Test.Assertions;
use Trendy_Test.Assertions.Integer_Assertions;
with Stringly_Asserts;

with Ada.Text_IO; use Ada.Text_IO;
with Types; use Types;
with Day_4.Parser; use Day_4.Parser;
with Day_4.Racks; use Day_4.Racks;

package body Day_4.Tests is
   Raw : constant String_Vectors.Vector := [
      "..@@.@@@@.",
      "@@@.@.@.@@",
      "@@@@@.@.@@",
      "@.@@@@..@.",
      "@@.@@@@.@@",
      ".@@@@@@@.@",
      ".@.@.@.@@@",
      "@.@@@.@@@@",
      ".@@@@@@@@.",
      "@.@.@@@.@."
   ];

   procedure Test_Parse_Rack (T : in out Trendy_Test.Operation'Class) is
      R : Rack;
   begin
      T.Register;
      R := Parse_Rack (Raw);
      Assert_EQ (T, R.Width, 10);
      Assert_EQ (T, R.Height, 10);
      Assert_EQ (T, Positive (R.Scrolls.Length), 71);
   end Test_Parse_Rack;

   procedure Test_Example (T : in out Trendy_Test.Operation'Class) is
      R : Rack;
   begin
      T.Register;
      R := Parse_Rack (Raw);
      Assert_EQ (T, Total_Accessible(R), 13);
   end Test_Example;

   function All_Tests return Trendy_Test.Test_Group is
   begin
      return
         [
            Test_Parse_Rack'Access,
            Test_Example'Access
         ];
   end All_Tests;
end Day_4.Tests;
