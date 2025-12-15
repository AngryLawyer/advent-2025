with Trendy_Test;
with Trendy_Test.Assertions.Discrete;
with Trendy_Test.Assertions.Integer_Assertions;

use Trendy_Test.Assertions;
use Trendy_Test.Assertions.Integer_Assertions;
with Types; use Types;
with Day_5.Databases; use Day_5.Databases;
with Day_5.Parser; use Day_5.Parser;
with Ada.Text_IO; use Ada.Text_IO;

package body Day_5.Tests is
   package U64_Assertions
       is new Trendy_Test.Assertions.Discrete (U64);

   use U64_Assertions;

   Raw : constant String_Vectors.Vector := [
      "3-5",
      "10-14",
      "16-20",
      "12-18",
      "",
      "1",
      "5",
      "8",
      "11",
      "17",
      "32"
   ];
   procedure Test_Parse (T : in out Trendy_Test.Operation'Class) is
      DB : Database;
   begin
      T.Register;
      DB := Parse (Raw);
      Assert_EQ (T, Natural (DB.Ranges.Length), 2);
      Assert_EQ (T, Natural (DB.Ingredients.Length), 6);
   end Test_Parse;

   procedure Test_Example (T : in out Trendy_Test.Operation'Class) is
      DB : Database;
   begin
      T.Register;
      DB := Parse (Raw);
      Assert_EQ (T, Freshness_Count (DB), 3);
   end Test_Example;

   procedure Test_Example_Extended (T : in out Trendy_Test.Operation'Class) is
      DB : Database;
   begin
      T.Register;
      DB := Parse (Raw);
      Assert_EQ (T, All_Possible_Freshness_Count (DB), 14);
   end Test_Example_Extended;

   function All_Tests return Trendy_Test.Test_Group is
   begin
      return
         [
            Test_Parse'Access,
            Test_Example'Access,
            Test_Example_Extended'Access
         ];
   end All_Tests;
end Day_5.Tests;
