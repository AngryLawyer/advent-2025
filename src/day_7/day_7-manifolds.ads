with Coordinates; use Coordinates;
with Ada.Strings.Hash;

package Day_7.Manifolds is
   type Manifold is record
      Start : Coordinate;
      Splitters : Coordinate_Sets.Set;
   end record;

   function Count_Splits (M : Manifold) return Natural;
end Day_7.Manifolds;
