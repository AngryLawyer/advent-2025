with Ada.Containers.Vectors;
with Day_1.Rotation;

package Day_1.Parser is
   package Rotation_Vectors is new
     Ada.Containers.Vectors
       (Index_Type   => Natural,
        Element_Type => Day_1.Rotation.Rotation,
        "="          => Day_1.Rotation."=");

   Parse_Error : exception;

   function Read_Directions (Path : String) return Rotation_Vectors.Vector;
   function Parse_Line (Line : String) return Day_1.Rotation.Rotation;
end Day_1.Parser;
