with Ada.Containers.Hashed_Sets;
with Ada.Containers.Vectors;
with Ada.Containers; use Ada.Containers;

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

end Coordinates;
