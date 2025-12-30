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
      if A.X < B.X or else A.Y < B.Y then
         return (A, B);
      end if;
      return (B, A);
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

   function Line_Intersects (R : Rect; L : Line) return Boolean is
      Axis : constant Line_Axis := Get_Line_Axis (L);
   begin
      case Axis is
         when Horizontal =>
            -- Not on the same line as our shape, so skip
            if (L.Start_Coord.Y < R.Y1 or else L.Start_Coord.Y > R.Y2) then
               return False;
            end if;
            -- Fully within
            if L.Start_Coord.X >= R.X1 and then L.End_Coord.X <= R.X2 then
               return False;
            end if;
            return (L.End_Coord.X >= R.X1) and then (L.Start_Coord.X <= R.X2);
         when Vertical =>
            -- Not on the same line as our shape, so skip
            if (L.Start_Coord.X < R.X1 or else L.Start_Coord.X > R.X2) then
               return False;
            end if;
            -- Fully within
            if L.Start_Coord.Y >= R.Y1 and then L.End_Coord.Y <= R.Y2 then
               return False;
            end if;
            return (L.End_Coord.Y >= R.Y1) and then (L.Start_Coord.Y <= R.Y2);
      end case;
   end Line_Intersects;

   function Any_Line_Intersects_Rect (R : Rect; Lines : Line_Vectors.Vector) return Boolean is
   begin
      for L of Lines loop
         if Line_Intersects (R, L) then
            Ada.Text_IO.Put_Line (R'Image & " " & L'Image);
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
               Area : U64;
            begin
               if not Any_Line_Intersects_Rect (R, Lines) then
                  Area := U64 (abs (A.X - B.X) + 1) * U64 (abs (A.Y - B.Y) + 1);
                  if Area > Best_Area then
                     Best_Area := Area;
                  end if;
               end if;
            end;
         end loop;
      end loop;
      return Best_Area;
   end Largest_Area_In_Lines;
end Day_9.Floors;
