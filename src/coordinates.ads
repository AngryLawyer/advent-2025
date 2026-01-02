with Ada.Containers.Hashed_Sets;
with Ada.Containers.Vectors;
with Ada.Containers; use Ada.Containers;
with Types; use Types;

package Coordinates is
   type Coordinate is record
      X : Positive;  -- It's standard in Ada to 1-index things
      Y : Positive;
   end record;

   type Coordinate_3D is record
      X : Natural;
      Y : Natural;
      Z : Natural;
   end record;

   function Hash (C : Coordinate) return Hash_Type;
   function Hash (C : Coordinate_3D) return Hash_Type;

   package Coordinate_Vectors is new
      Ada.Containers.Vectors (Positive, Coordinate);

   package Coordinate_3D_Vectors is new
      Ada.Containers.Vectors (Positive, Coordinate_3D);

   package Coordinate_Sets is new
      Ada.Containers.Hashed_Sets
         (Element_Type => Coordinate,
          Hash => Hash,
          Equivalent_Elements => "=");

   type Line is record
      Start_Coord : Coordinate;
      End_Coord : Coordinate;
   end record;

   function Make_Line (A : Coordinate; B : Coordinate) return Line
      with Post => (Make_Line'Result.Start_Coord.X < Make_Line'Result.End_Coord.X or else
         ((Make_Line'Result.Start_Coord.X = Make_Line'Result.End_Coord.X) and then (Make_Line'Result.Start_Coord.Y <= Make_Line'Result.End_Coord.Y)));

   function Rotate_Line (L : Line) return Line;

   package Line_Vectors is new
      Ada.Containers.Vectors (Positive, Line);

   type Rect is record
      X1 : Positive;
      Y1 : Positive;
      X2 : Positive;
      Y2 : Positive;
   end record;

   function Make_Rect (A : Coordinate; B : Coordinate) return Rect;
   function Fully_Within (R : Rect; C : Coordinate) return Boolean;
   function Area (R : Rect) return U64;
   type Rect_Lines is array (1 .. 4) of Line;
   function To_Lines (R : Rect) return Rect_Lines;

   function To_String (C : Coordinate) return String;
   function To_String (C : Coordinate_3D) return String;
   function To_String (L : Line) return String;

end Coordinates;
