with Coordinates; use Coordinates;
with Types; use Types;

package Day_9.Floors is
   type Floor is record
      Tiles : Coordinate_Vectors.Vector;
   end record;

   type Line_Axis is (Horizontal, Vertical);

   function Largest_Area (F : Floor) return U64;
   function Get_Lines (F : Floor) return Line_Vectors.Vector;
   function Largest_Area_In_Lines (F : Floor) return U64;
   function Line_Intersects (A : Line; B : Line) return Boolean;
   function Line_Intersects (R : Rect; L : Line) return Boolean;
   function Any_Line_Intersects_Rect (R : Rect; Lines : Line_Vectors.Vector) return Boolean;
end Day_9.Floors;
