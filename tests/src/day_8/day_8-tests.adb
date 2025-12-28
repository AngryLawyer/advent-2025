with Trendy_Test.Assertions.Discrete;
with Day_8.Circuits; use Day_8.Circuits;
with Day_8.Parser; use Day_8.Parser;
with Types; use Types;

package body Day_8.Tests is
   package U64_Assertions
       is new Trendy_Test.Assertions.Discrete (U64);

   use U64_Assertions;

   Raw_Coordinates : constant String_Vectors.Vector := [
      "162,817,812",
      "57,618,57",
      "906,360,560",
      "592,479,940",
      "352,342,300",
      "466,668,158",
      "542,29,236",
      "431,825,988",
      "739,650,466",
      "52,470,668",
      "216,146,977",
      "819,987,18",
      "117,168,530",
      "805,96,715",
      "346,949,466",
      "970,615,88",
      "941,993,340",
      "862,61,35",
      "984,92,344",
      "425,690,689"
   ];

   procedure Test_Example (T : in out Trendy_Test.Operation'Class) is
      C : Circuit;
   begin
      T.Register;
      C := Parse (Raw_Coordinates);
      Assert_EQ (T, Calculate_Three_largest (C, 10), 40);
   end Test_Example;
   function All_Tests return Trendy_Test.Test_Group is
   begin
      return
         [
            Test_Example'Access
         ];
   end All_Tests;
end Day_8.Tests;
