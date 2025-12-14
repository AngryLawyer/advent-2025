with Ada.Containers.Vectors;
with Parsers;
with Day_1.Rotation;
with Types; use Types;

package Day_1.Parser is
   package Rotation_Vectors is new
     Ada.Containers.Vectors
       (Index_Type   => Natural,
        Element_Type => Day_1.Rotation.Rotation,
        "="          => Day_1.Rotation."=");

   Parse_Error : exception;

   function Parse_Rotation (Line : String) return Day_1.Rotation.Rotation;
   procedure Parse_Line (Collector : in out Rotation_Vectors.Vector; Line : String);

   package P is new Parsers (
      T => Rotation_Vectors.Vector,
      Parse_Line => Parse_Line
   );

   function Parse (Raw : String_Vectors.Vector) return Rotation_Vectors.Vector renames P.Parse;
   function Read_Directions (Path : String) return Rotation_Vectors.Vector renames P.Load;

end Day_1.Parser;
