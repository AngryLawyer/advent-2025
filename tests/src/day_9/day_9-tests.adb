with Trendy_Test.Assertions; use Trendy_Test.Assertions;
with Trendy_Test.Assertions.Discrete;
with Day_9.Floors; use Day_9.Floors;
with Day_9.Parser; use Day_9.Parser;
with Types; use Types;
with Coordinates; use Coordinates;

package body Day_9.Tests is
   package U64_Assertions
       is new Trendy_Test.Assertions.Discrete (U64);

   use U64_Assertions;

   Raw_Coordinates : constant String_Vectors.Vector := [
      "7,1",
      "11,1",
      "11,7",
      "9,7",
      "9,5",
      "2,5",
      "2,3",
      "7,3"
   ];

   procedure Test_Example (T : in out Trendy_Test.Operation'Class) is
      F : Floor;
   begin
      T.Register;
      F := Parse (Raw_Coordinates);
      Assert_EQ (T, Largest_Area (F), 50);
   end Test_Example;

   procedure Test_Lines (T : in out Trendy_Test.Operation'Class) is
      F : Floor;
      L : Line_Vectors.Vector;
   begin
      T.Register;
      F := Parse (Raw_Coordinates);
      L := Get_Lines (F);
      Assert_EQ (T, U64 (L.Length), 8);
   end Test_Lines;

   procedure Test_Example_Extended (T : in out Trendy_Test.Operation'Class) is
      F : Floor;
   begin
      T.Register;
      F := Parse (Raw_Coordinates);
      Assert_EQ (T, Largest_Area_In_Lines (F), 24);
   end Test_Example_Extended;

   procedure Test_Line_Intersects (T : in out Trendy_Test.Operation'Class) is
      R : Rect := Make_Rect ((3, 3), (4, 4));
   begin
      T.Register;
      Assert (T, not Line_Intersects (R, ((1, 1), (2, 1))));
      Assert (T, not Line_Intersects (R, ((1, 1), (1, 2))));

      Assert (T, not Line_Intersects (R, ((3, 1), (3, 2))));
      Assert (T, not Line_Intersects (R, ((3, 2), (4, 2))));

      Assert (T, not Line_Intersects (R, ((1, 3), (2, 3))));
      Assert (T, not Line_Intersects (R, ((2, 3), (2, 4))));

      Assert (T, not Line_Intersects (R, ((5, 3), (6, 3))));
      Assert (T, not Line_Intersects (R, ((5, 3), (5, 4))));

      Assert (T, not Line_Intersects (R, ((3, 5), (4, 5))));
      Assert (T, not Line_Intersects (R, ((3, 5), (3, 6))));

      --  Inside
      Assert (T, not Line_Intersects (R, ((3, 3), (4, 3))));
      Assert (T, not Line_Intersects (R, ((3, 3), (3, 4))));

      -- Intersection
      Assert (T, Line_Intersects (R, ((2, 3), (3, 3))));
      Assert (T, Line_Intersects (R, ((3, 2), (3, 4))));
      Assert (T, Line_Intersects (R, ((4, 4), (4, 5))));
      Assert (T, Line_Intersects (R, ((4, 4), (5, 4))));

      -- Actual Values
      Assert (T, not Line_Intersects (Make_Rect ((2, 3), (9, 5)), ((7, 1), (11, 1))));
   end Test_Line_Intersects;

   procedure Test_Any_Line_Intersects_Rect (T : in out Trendy_Test.Operation'Class) is
      F : Floor;
      Lines : Line_Vectors.Vector;
   begin
      T.Register;
      F := Parse (Raw_Coordinates);
      Lines := Get_Lines (F);
      Assert (T, not Any_Line_Intersects_Rect (Make_Rect ((2, 3), (9, 5)), Lines));
   end Test_Any_Line_Intersects_Rect;

   function All_Tests return Trendy_Test.Test_Group is
   begin
      return
         [
            Test_Example'Access,
            Test_Lines'Access,
            -- Test_Line_Intersects'Access,
            Test_Any_Line_Intersects_Rect'Access --,
            -- Test_Example_Extended'Access
         ];
   end All_Tests;
end Day_9.Tests;
