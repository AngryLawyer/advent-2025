with Ada.Containers.Vectors;
with Types; use Types;

package Day_6.Worksheets is
   type Worksheet is record
      Raw_Rows : String_Vectors.Vector;
   end record;

   type Operation_Type is (Mult, Add);

   type Column is record
      Numbers : U64_Vectors.Vector;
      Operation : Operation_Type;
   end record;

   package Column_Vectors is new Ada.Containers.Vectors (Positive, Column);

   function To_Columns (WS : Worksheet) return Column_Vectors.Vector;
   function To_Rotated_Columns (WS : Worksheet) return Column_Vectors.Vector;
   function Solve (Columns : Column_Vectors.Vector) return U64;

end Day_6.Worksheets;
