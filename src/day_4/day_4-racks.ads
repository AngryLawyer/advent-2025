with Ada.Containers; use Ada.Containers;
with Ada.Containers.Hashed_Sets;

package Day_4.Racks is
   type Coordinate is record
      x : Positive;  -- It's standard in Ada to 1-index things
      y : Positive;
   end record;

   function Hash (C : Coordinate) return Hash_Type;

   package Coordinate_Sets is new
      Ada.Containers.Hashed_Sets
         (Element_Type => Coordinate,
          Hash => Hash,
          Equivalent_Elements => "=");

   type Rack is record
      Scrolls : Coordinate_Sets.Set;
      Width : Positive;
      Height : Positive;
   end record;

   function Is_Accessible (X : Positive; Y : Positive) return Boolean;
end Day_4.Racks;
