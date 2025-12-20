with Trendy_Test;
with Trendy_Test.Assertions.Discrete;
with Trendy_Test.Assertions.Integer_Assertions;

use Trendy_Test.Assertions;
use Trendy_Test.Assertions.Integer_Assertions;

with Day_7.Parser; use Day_7.Parser;
with Day_7.Manifolds; use Day_7.Manifolds;

with Types; use Types;
with Ada.Text_IO; use Ada.Text_IO;

package body Day_7.Tests is
   package U64_Assertions
       is new Trendy_Test.Assertions.Discrete (U64);

   use U64_Assertions;

   Raw : constant String_Vectors.Vector := [
      ".......S.......",
      "...............",
      ".......^.......",
      "...............",
      "......^.^......",
      "...............",
      ".....^.^.^.....",
      "...............",
      "....^.^...^....",
      "...............",
      "...^.^...^.^...",
      "...............",
      "..^...^.....^..",
      "...............",
      ".^.^.^.^.^...^.",
      "..............."
   ];

   procedure Test_Example (T : in out Trendy_Test.Operation'Class) is
      M : Manifold;
   begin
      T.Register;
      M := Parse (Raw);
      Assert_EQ (T, Count_Splits (M), 21);
   end Test_Example;

   procedure Test_Example_Extended (T : in out Trendy_Test.Operation'Class) is
      M : Manifold;
   begin
      T.Register;
      M := Parse (Raw);
      Assert_EQ (T, Count_Timelines (M), 40);
   end Test_Example_Extended;

   function All_Tests return Trendy_Test.Test_Group is
   begin
      return
         [
            Test_Example'Access,
            Test_Example_Extended'Access
         ];
   end All_Tests;
end Day_7.Tests;
