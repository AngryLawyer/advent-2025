with Trendy_Test;
with Trendy_Test.Assertions.Integer_Assertions;

use Trendy_Test.Assertions;
use Trendy_Test.Assertions.Integer_Assertions;

with Day_1.Parser;
with Day_1.Safe;
with Day_1.Rotation;

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
      use Day_1.Safe;
      use Day_1.Rotation;
   begin
      T.Register;
      Assert_EQ (T, Calculate_Passes (
         Safe_Position (50), (Right, 49)
      ), 0);
      Assert_EQ (T, Calculate_Passes (
         Safe_Position (50), (Right, 50)
      ), 1);
      Assert_EQ (T, Calculate_Passes (
         Safe_Position (50), (Right, 51)
      ), 1);
      Assert_EQ (T, Calculate_Passes (
         Safe_Position (50), (Right, 1000)
      ), 10);

      Assert_EQ (T, Calculate_Passes (
         Safe_Position (50), (Left, 49)
      ), 0);
      Assert_EQ (T, Calculate_Passes (
         Safe_Position (50), (Left, 50)
      ), 1);
      Assert_EQ (T, Calculate_Passes (
         Safe_Position (50), (Left, 51)
      ), 1);
      Assert_EQ (T, Calculate_Passes (
         Safe_Position (50), (Left, 1000)
      ), 10);

      Assert_EQ (T, Calculate_Passes (
         Safe_Position (25), (Left, 24)
      ), 0);
      Assert_EQ (T, Calculate_Passes (
         Safe_Position (25), (Left, 25)
      ), 1);
      Assert_EQ (T, Calculate_Passes (
         Safe_Position (25), (Left, 26)
      ), 1);

      Assert_EQ (T, Calculate_Passes (
         Safe_Position (50), (Left, 68)
      ), 1);
      Assert_EQ (T, Calculate_Passes (
         Safe_Position (82), (Left, 30)
      ), 0);
      Assert_EQ (T, Calculate_Passes (
         Safe_Position (52), (Right, 48)
      ), 1);

      Assert_EQ (T, Calculate_Passes (
         Safe_Position (0), (Left, 5)
      ), 0);

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
