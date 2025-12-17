with Trendy_Test;
with Trendy_Test.Assertions.Discrete;
with Trendy_Test.Assertions.Integer_Assertions;

use Trendy_Test.Assertions;
use Trendy_Test.Assertions.Integer_Assertions;

with Day_6.Parser; use Day_6.Parser;
with Day_6.Worksheets; use Day_6.Worksheets;
with Types; use Types;
with Ada.Text_IO; use Ada.Text_IO;

package body Day_6.Tests is
   package U64_Assertions
       is new Trendy_Test.Assertions.Discrete (U64);

   use U64_Assertions;

   Raw : constant String_Vectors.Vector := [
      "123 328  51 64 ",
      " 45 64  387 23 ",
      "  6 98  215 314",
      "*   +   *   +  "
   ];

   procedure Test_Example (T : in out Trendy_Test.Operation'Class) is
      WS : Worksheet;
   begin
      T.Register;
      WS := Parse (Raw);
      Assert_EQ (T, Solve (To_Columns (WS)), 4277556);

   end Test_Example;

   procedure Test_Example_Extended (T : in out Trendy_Test.Operation'Class) is
      WS : Worksheet;
   begin
      T.Register;
      WS := Parse (Raw);
      Assert_EQ (T, Solve (To_Rotated_Columns (WS)), 3263827);
   end Test_Example_Extended;

   function All_Tests return Trendy_Test.Test_Group is
   begin
      return
         [
            Test_Example'Access,
            Test_Example_Extended'Access
         ];
   end All_Tests;
end Day_6.Tests;
