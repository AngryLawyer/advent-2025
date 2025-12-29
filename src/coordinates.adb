with Ada.Strings.Hash;

package body Coordinates is
   function Hash (C : Coordinate) return Hash_Type is
   begin
      return Ada.Strings.Hash (C'Image);
   end Hash;

   function Hash (C : Coordinate_3D) return Hash_Type is
   begin
      return Ada.Strings.Hash (C'Image);
   end Hash;
end Coordinates;
