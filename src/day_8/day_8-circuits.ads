with Ada.Containers.Ordered_Sets;
with Ada.Containers.Hashed_Sets;
with Ada.Containers.Vectors;
with Coordinates; use Coordinates;
with Types; use Types;

package Day_8.Circuits is
   type Circuit is record
      Nodes : Coordinate_3D_Vectors.Vector;
   end record;

   type Connection is record
      Distance_Squared : U64;
      A : Coordinate_3D;
      B : Coordinate_3D;
   end record;

   function "<" (A : Connection; B : Connection) return Boolean;

   package Ordered_Connections is new Ada.Containers.Ordered_Sets (
      Element_Type => Connection,
      "<" => "<"
   );

   package Node_Sets is new Ada.Containers.Hashed_Sets (
      Element_Type => Coordinate_3D,
      Hash => Hash,
      Equivalent_Elements => "="
   );

   package Node_Set_Vectors is new Ada.Containers.Vectors (
      Positive, Node_Sets.Set, Node_Sets."="
   );

   function Calculate_Three_Largest (C : Circuit; Connections : Positive) return Natural;
end Day_8.Circuits;
