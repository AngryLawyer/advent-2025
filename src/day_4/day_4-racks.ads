with Ada.Containers; use Ada.Containers;
with Ada.Containers.Hashed_Sets;
with Coordinates; use Coordinates;

package Day_4.Racks is
   type Rack is record
      Scrolls : Coordinate_Sets.Set;
      Width : Positive;
      Height : Positive;
   end record;

   function Is_Accessible (R : Rack; X : Positive; Y : Positive) return Boolean;
   function Total_Accessible (R : Rack) return Natural;
   function Total_Accessible_With_Removal (R : in out Rack) return Natural;
end Day_4.Racks;
