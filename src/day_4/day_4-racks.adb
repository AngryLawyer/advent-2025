with Ada.Strings.Hash;

package body Day_4.Racks is
   function Hash (C : Coordinate) return Hash_Type is
   begin
      return Ada.Strings.Hash (C'Image);
   end Hash;

   function Is_Accessible (X : Positive; Y : Positive) return Boolean is
      Adjacent_Count : Natural := 0;
   begin
      return False;
   end Is_Accessible;
end Day_4.Racks;
