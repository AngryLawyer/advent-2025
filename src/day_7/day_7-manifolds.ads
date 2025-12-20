with Ada.Containers.Ordered_Sets;
with Ada.Containers.Vectors;
with Ada.Strings.Hash;

with Coordinates; use Coordinates;
with Types; use Types;

package Day_7.Manifolds is

   package Natural_Sets is new Ada.Containers.Ordered_Sets (Natural);
   package Natural_Set_Vectors is new Ada.Containers.Vectors (Positive, Natural_Sets.Set, Natural_Sets."=");

   type Manifold is record
      Start : Coordinate;
      Splitters : Natural_Set_Vectors.Vector;
   end record;

   function Count_Splits (M : Manifold) return Natural;
   function Count_Timelines (M : Manifold) return U64;
end Day_7.Manifolds;
