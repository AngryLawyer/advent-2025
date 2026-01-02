with Ada.Text_IO;
with Ada.Assertions; use Ada.Assertions;

package body Day_9.Floors is
   function Largest_Area (F : Floor) return U64 is
      Best_Area : U64 := 0;
   begin
      for I in F.Tiles.First_Index .. (F.Tiles.Last_Index - 1) loop
         for J in I + 1 .. F.Tiles.Last_Index loop
            declare
               A : constant Coordinate := F.Tiles.Element (I);
               B : constant Coordinate := F.Tiles.Element (J);
               Area : U64;
            begin
               Area := U64 (abs (A.X - B.X) + 1) * U64 (abs (A.Y - B.Y) + 1);
               if Area > Best_Area then
                  Best_Area := Area;
               end if;
            end;
         end loop;
      end loop;
      return Best_Area;
   end Largest_Area;

   function Get_Line (A : Coordinate; B : Coordinate) return Line
      with Post => (Get_Line'Result.Start_Coord.X = Get_Line'Result.End_Coord.X or else Get_Line'Result.Start_Coord.Y = Get_Line'Result.End_Coord.Y) and then Get_Line'Result.Start_Coord.X <= Get_Line'Result.End_Coord.X and then Get_Line'Result.Start_Coord.Y <= Get_Line'Result.End_Coord.Y --  Lines are always axis-aligned
   is
   begin
      return Make_Line (A, B);
   end Get_Line;

   function Get_Line_Axis (L : Line) return Line_Axis is
   begin
      if L.Start_Coord.X = L.End_Coord.X then
         return Vertical;
      elsif L.Start_Coord.Y = L.End_Coord.Y then
         return Horizontal;
      else
         raise Assertion_Error;
      end if;
   end Get_Line_Axis;

   procedure Validate_Lines (Lines : Line_Vectors.Vector) is
   begin
      for I in Lines.First_Index .. Lines.Last_Index - 1 loop
         for J in I + 1 .. Lines.Last_Index loop
            declare
               A : constant Line := Lines (I);
               B : constant Line := Lines (J);
               A_Axis : Line_Axis;
               B_Axis : Line_Axis;
            begin
               A_Axis := Get_Line_Axis (A);
               B_Axis := Get_Line_Axis (B);
               if A_Axis = B_Axis then
                  -- Assumption: lines never intersect
                  case A_Axis is
                     when Horizontal =>
                        if abs (Natural (A.Start_Coord.Y) - Natural (B.Start_Coord.Y)) <= 1 then
                           if not (A.End_Coord.X < B.Start_Coord.X or else B.End_Coord.X < A.Start_Coord.X) then
                              raise Assertion_Error;
                           end if;
                        end if;
                     when Vertical =>
                        if abs (Natural (A.Start_Coord.X) - Natural (B.Start_Coord.X)) <= 1 then
                           if not (A.End_Coord.Y < B.Start_Coord.Y or else B.End_Coord.Y < A.Start_Coord.Y) then
                              raise Assertion_Error;
                           end if;
                        end if;
                  end case;
               end if;
            end;
         end loop;
      end loop;
   end Validate_Lines;

   function Get_Lines (F : Floor) return Line_Vectors.Vector
   is
      Lines : Line_Vectors.Vector;
   begin
      for I in F.Tiles.First_Index .. F.Tiles.Last_Index loop
         if I = F.Tiles.Last_Index then --  We want to wrap our last index
            Lines.Append (Get_Line (F.Tiles (I), F.Tiles (F.Tiles.First_Index)));
         else
            Lines.Append (Get_Line (F.Tiles (I), F.Tiles (I + 1)));
         end if;
      end loop;
      -- We need to check that none of our lines are side-by-side, as our algorithm won't work otherwise
      Validate_Lines (Lines);
      return Lines;
   end Get_Lines;

   function Line_Intersects (A : Line; B : Line) return Boolean is
      Axis : constant Line_Axis := Get_Line_Axis (A);
      A_Axis : Positive;
      A_Start : Positive;
      A_End : Positive;
      B_Axis : Positive;
      B_Start : Positive;
      B_End : Positive;
   begin
      if Axis = Get_Line_Axis (B) then
         case Axis is
            when Horizontal =>
               A_Start := A.Start_Coord.X;
               A_End := A.End_Coord.X;
               A_Axis := A.Start_Coord.Y;

               B_Start := B.Start_Coord.X;
               B_End := B.End_Coord.X;
               B_Axis := B.Start_Coord.Y;
            when Vertical =>
               A_Start := A.Start_Coord.Y;
               A_End := A.End_Coord.Y;
               A_Axis := A.Start_Coord.X;

               B_Start := B.Start_Coord.Y;
               B_End := B.End_Coord.Y;
               B_Axis := B.Start_Coord.X;
         end case;
         if A_Axis /= B_Axis then
            return False;
         end if;
         Ada.Text_IO.Put_Line ("Here we go " & To_String (A) & " " & To_String (B));
         if (A_Start >= B_Start and then A_End <= B_End) or else (B_Start >= A_Start and then B_End <= A_End) then
            return False;
         end if;
         return True;
      end if;
      -- Ada.Text_IO.Put_Line (To_String (A) & ", " & To_String (B));
      case Axis is
         when Horizontal =>
            A_Start := A.Start_Coord.X;
            A_End := A.End_Coord.X;
            A_Axis := A.Start_Coord.Y;

            B_Start := B.Start_Coord.Y;
            B_End := B.End_Coord.Y;
            B_Axis := B.Start_Coord.X;
         when Vertical =>
            A_Start := A.Start_Coord.Y;
            A_End := A.End_Coord.Y;
            A_Axis := A.Start_Coord.X;

            B_Start := B.Start_Coord.X;
            B_End := B.End_Coord.X;
            B_Axis := B.Start_Coord.Y;
      end case;
      -- Ada.Text_IO.Put_Line (A_Start'Image & " " & A_End'Image & " crossed at " & B_Axis'Image);
      return not (B_Axis <= A_Start or else B_Axis >= A_End or else A_Axis <= B_Start or else A_Axis >= B_End);
   end Line_Intersects;

   function Line_Intersects (R : Rect; L : Line) return Boolean is
   begin
      Ada.Text_IO.Put_Line ("Testing " & To_string (L));
      -- Check if the line points are on opposite sides of the rect
      if L.Start_Coord.X < R.X1 and then L.End_Coord.X > R.X2 and then L.Start_Coord.Y >= R.Y1 and then L.End_Coord.Y <= R.Y2 then
         return True;
      elsif L.Start_Coord.Y < R.Y1 and then L.End_Coord.Y > R.Y2 and then L.Start_Coord.X >= R.X1 and then L.End_Coord.X <= R.X2 then
         return True;
      -- Check if any line points are fully within
      elsif Fully_Within (R, L.Start_Coord) or else Fully_Within (R, L.End_Coord) then
         return True;
      end if;
      return False;
   end Line_Intersects;

   function Any_Line_Intersects_Rect (R : Rect; Lines : Line_Vectors.Vector) return Boolean is
   begin
      Ada.Text_IO.Put_Line ("Testing rect " & R'Image);
      for L of Lines loop
         if Line_Intersects (R, L) then
            Ada.Text_IO.Put_Line ("Intersects");
            return True;
         end if;
      end loop;
      return False;
   end Any_Line_Intersects_Rect;

   function Largest_Area_In_Lines (F : Floor) return U64 is
      Best_Area : U64 := 0;
      Lines : Line_Vectors.Vector;
   begin
      Lines := Get_Lines (F);
      for I in F.Tiles.First_Index .. (F.Tiles.Last_Index - 1) loop
         for J in I + 1 .. F.Tiles.Last_Index loop
            declare
               A : constant Coordinate := F.Tiles.Element (I);
               B : constant Coordinate := F.Tiles.Element (J);
               R : constant Rect := Make_Rect (A, B);
               New_Area : U64;
            begin
               if not Any_Line_Intersects_Rect (R, Lines) then
                  Ada.Text_IO.Put_Line (R'Image & " has no intersections");
                  New_Area := Area (R);
                  if New_Area > Best_Area then
                     Ada.Text_IO.Put_Line (R'Image & " chosten due to area " & New_Area'Image & " larger than " & Best_Area'Image);
                     Best_Area := New_Area;
                  end if;
               end if;
            end;
         end loop;
      end loop;
      return Best_Area;
   end Largest_Area_In_Lines;
end Day_9.Floors;
