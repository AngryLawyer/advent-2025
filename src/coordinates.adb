with Ada.Strings.Hash;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;
with Ada.Text_IO;

package body Coordinates is
   function Hash (C : Coordinate) return Hash_Type is
   begin
      return Ada.Strings.Hash (C'Image);
   end Hash;

   function Hash (C : Coordinate_3D) return Hash_Type is
   begin
      return Ada.Strings.Hash (C'Image);
   end Hash;

   function Make_Line (A : Coordinate; B : Coordinate) return Line is
   begin
      if A.X < B.X then
         return (A, B);
      elsif A.X > B.X then
         return (B, A);
      else
         if A.Y <= B.Y then
            return (A, B);
         else
            return (B, A);
         end if;
      end if;
   end Make_Line;

   function Rotate_Line (L : Line) return Line is
   begin
      return Make_Line ((L.Start_Coord.Y, L.Start_Coord.X), (L.End_Coord.Y, L.End_Coord.X));
   end Rotate_Line;

   function Make_Rect (A : Coordinate; B : Coordinate) return Rect is
      R : Rect;
   begin
      R.X1 := Positive'Min (A.X, B.X);
      R.X2 := Positive'Max (A.X, B.X);
      R.Y1 := Positive'Min (A.Y, B.Y);
      R.Y2 := Positive'Max (A.Y, B.Y);
      return R;
   end Make_Rect;

   function Fully_Within (R : Rect; C : Coordinate) return Boolean is
   begin
      return C.X > R.X1 and then C.X < R.X2 and then C.Y > R.Y1 and then C.Y < R.Y2;
   end Fully_Within;

   function Area (R : Rect) return U64 is
   begin
      return U64 ((R.X2 - R.X1) * (R.Y2 - R.Y1));
   end Area;

   function To_Lines (R : Rect) return Rect_Lines is
   begin
      return [
         Make_Line ((R.X1, R.Y1), (R.X2, R.Y1)),
         Make_Line ((R.X2, R.Y1), (R.X2, R.Y2)),
         Make_Line ((R.X1, R.Y2), (R.X2, R.Y2)),
         Make_Line ((R.X1, R.Y1), (R.X1, R.Y2))
      ];
   end To_Lines;

   function To_String (C : Coordinate) return String is
   begin
      return "(" & Trim (C.X'Image, Ada.Strings.Left) & "," & Trim (C.Y'Image, Ada.Strings.Left) & ")";
   end To_String;

   function To_String (C : Coordinate_3D) return String is
   begin
      return "(" & Trim (C.X'Image, Ada.Strings.Left) & "," & Trim (C.Y'Image, Ada.Strings.Left) & "," & Trim (C.Z'Image, Ada.Strings.Left) & ")";
   end To_String;

   function To_String (L : Line) return String is
   begin
      return To_String (L.Start_Coord) & "-" & To_String (L.End_Coord);
   end To_String;

end Coordinates;
