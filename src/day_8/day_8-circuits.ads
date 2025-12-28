with Coordinates; use Coordinates;
with Types; use Types;

package Day_8.Circuits is
   type Circuit is record
      Nodes : Coordinate_3D_Vectors.Vector;
   end record;

   function Calculate_Three_Largest (C : Circuit; Connections : Natural) return U64;
end Day_8.Circuits;
