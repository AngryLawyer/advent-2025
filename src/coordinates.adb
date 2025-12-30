with Ada.Strings.Hash;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

package body Coordinates is
   function Hash (C : Coordinate) return Hash_Type is
   begin
      return Ada.Strings.Hash (C'Image);
   end Hash;

   function Hash (C : Coordinate_3D) return Hash_Type is
   begin
      return Ada.Strings.Hash (C'Image);
   end Hash;

   function To_String (C : Coordinate_3D) return String is
   begin
      return "(" & Trim (C.X'Image, Ada.Strings.Left) & "," & Trim (C.Y'Image, Ada.Strings.Left) & "," & Trim (C.Z'Image, Ada.Strings.Left) & ")";
   end To_String;

   function Make_Rect (A : Coordinate; B : Coordinate) return Rect is
      R : Rect;
   begin
      R.X1 := Positive'Min (A.X, B.X);
      R.X2 := Positive'Max (A.X, B.X);
      R.Y1 := Positive'Min (A.Y, B.Y);
      R.Y2 := Positive'Max (A.Y, B.Y);
      return R;
   end Make_Rect;
end Coordinates;
