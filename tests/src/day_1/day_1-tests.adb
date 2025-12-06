with Trendy_Test;
with Trendy_Test.Assertions.Integer_Assertions;

use Trendy_Test.Assertions;
use Trendy_Test.Assertions.Integer_Assertions;

with Day_1.Parser;
with Day_1.Safe;

with Ada.Text_IO; use Ada.Text_IO;

package body Day_1.Tests is
   procedure Test_Example (T : in out Trendy_Test.Operation'Class) is
      Command_Array : constant String_Vectors.Vector := [
         "L68",
         "L30",
         "R48",
         "L5",
         "R60",
         "L55",
         "L1",
         "L99",
         "R14",
         "L82"
      ];
      Safe: Day_1.Safe.Safe;
   begin
      T.Register;
      Safe := Day_1.Safe.Init (50);
      for C of Command_Array loop
         Day_1.Safe.Apply (Safe, Day_1.Parser.Parse_Line (C));
      end loop;
      Assert_EQ (T, Integer (Day_1.Safe.Position (Safe)), 32);
      Assert_EQ (T, (Day_1.Safe.Exact_Count (Safe)), 3);
      Assert_EQ (T, (Day_1.Safe.Pass_Count (Safe)), 6);
   end Test_Example;

   procedure Test_Calculate_Passes (T : in out Trendy_Test.Operation'Class) is
   begin
      T.Register;
      Assert_EQ (T, Day_1.Safe.Calculate_Passes (Day_1.Safe.Safe_Position (50), 49), 0);
      Assert_EQ (T, Day_1.Safe.Calculate_Passes (Day_1.Safe.Safe_Position (50), 50), 1);
      Assert_EQ (T, Day_1.Safe.Calculate_Passes (Day_1.Safe.Safe_Position (50), 51), 1);
      Assert_EQ (T, Day_1.Safe.Calculate_Passes (Day_1.Safe.Safe_Position (50), 1000), 10);

   end Test_Calculate_Passes;

   function All_Tests return Trendy_Test.Test_Group is
   begin
      return
         [
            Test_Example'Access,
            Test_Calculate_Passes'Access
         ];
   end All_Tests;
end Day_1.Tests;
