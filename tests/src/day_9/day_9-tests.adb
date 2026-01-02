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

   procedure Test_Line_Intersects_Line (T : in out Trendy_Test.Operation'Class) is
      type Line_Pair is array (1 .. 2) of Line;
      Parallel_Pairs : constant array (1 .. 4) of Line_Pair := [
         [((7, 1), (11, 1)), ((7, 1), (11, 1))],
         [((6, 1), (12, 1)), ((7, 1), (11, 1))],
         [((8, 1), (10, 1)), ((7, 1), (11, 1))],
         [((7, 2), (11, 2)), ((7, 1), (11, 1))]
      ];
      Nonintersecting_Pairs : constant array (1 .. 4) of Line_Pair := [
         --  Ends
         [((2, 2), (4, 2)), ((1, 1), (1, 3))],
         [((2, 2), (4, 2)), ((2, 1), (2, 3))],
         --  Body
         [((2, 2), (4, 2)), ((3, 1), (3, 2))],
         [((2, 2), (4, 2)), ((3, 2), (3, 3))]
      ];
      Intersecting_Pairs : constant array (1 .. 5) of Line_Pair := [
         -- Cross
         [((2, 2), (4, 2)), ((3, 1), (3, 3))],
         -- Overlap on bound
         [((2, 2), (4, 2)), ((1, 2), (3, 2))],
         [((2, 2), (4, 2)), ((3, 2), (5, 2))],
         -- Overlap on both bounds
         [((2, 2), (4, 2)), ((1, 2), (5, 2))],
         [((1, 2), (3, 2)), ((2, 2), (4, 2))]
      ];
   begin
      T.Register;
      --  Parallel lines never intersect
      for P of Parallel_Pairs loop
         Assert (T, not Line_Intersects (P (1), P (2)));
         Assert (T, not Line_Intersects (Rotate_Line (P (1)), Rotate_Line (P (2))));
      end loop;
      for P of Nonintersecting_Pairs loop
         Assert (T, not Line_Intersects (P (1), P (2)));
         Assert (T, not Line_Intersects (Rotate_Line (P (1)), Rotate_Line (P (2))));
      end loop;
      for P of Intersecting_Pairs loop
         Assert (T, Line_Intersects (P (1), P (2)));
         Assert (T, Line_Intersects (Rotate_Line (P (1)), Rotate_Line (P (2))));
      end loop;
   end Test_Line_Intersects_Line;

   procedure Test_Line_Intersects_Rect (T : in out Trendy_Test.Operation'Class) is
      R : constant Rect := Make_Rect ((7, 1), (11, 7));
      Good_Lines : constant array (1 .. 7) of Line := [
         ((7, 1), (11, 1)),
         ((11, 1), (11, 7)),
         ((9, 7), (11, 7)),
         ((9, 5), (9, 7)),
         ((2, 3), (2, 5)),
         ((2, 3), (7, 3)),
         ((7, 1), (7, 3))
      ]; 
      Bad_Lines : constant array (1 .. 1) of Line := [
         ((2, 5), (9, 5))
      ];
   begin
      T.Register;

      for G of Good_Lines loop
         Assert (T, not Line_Intersects (R, G));
      end loop;

      for B of Bad_Lines loop
         Assert (T, Line_Intersects (R, B));
      end loop;
   end Test_Line_Intersects_Rect;

   procedure Test_Any_Line_Intersects_Rect (T : in out Trendy_Test.Operation'Class) is
      F : Floor;
      Lines : Line_Vectors.Vector;
   begin
      T.Register;
      F := Parse (Raw_Coordinates);
      Lines := Get_Lines (F);
      Assert (T, Any_Line_Intersects_Rect (Make_Rect ((7, 1), (11, 7)), Lines));
      Assert (T, Any_Line_Intersects_Rect (Make_Rect ((2, 3), (9, 7)), Lines));
      Assert (T, not Any_Line_Intersects_Rect (Make_Rect ((2, 3), (9, 5)), Lines));
   end Test_Any_Line_Intersects_Rect;

   procedure Test_Example_Extended (T : in out Trendy_Test.Operation'Class) is
      F : Floor;
   begin
      T.Register;
      F := Parse (Raw_Coordinates);
      Assert_EQ (T, Largest_Area_In_Lines (F), 24);
   end Test_Example_Extended;

   function All_Tests return Trendy_Test.Test_Group is
   begin
      return
         [
            --Test_Example'Access,
            --Test_Lines'Access,
            --Test_Line_Intersects_Line'Access
            --Test_Line_Intersects_Rect'Access,
            Test_Any_Line_Intersects_Rect'Access
            --Test_Example_Extended'Access
         ];
   end All_Tests;
end Day_9.Tests;
