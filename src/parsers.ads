with Types; use Types;

generic
   type T is private;
   with procedure Parse_Line (Collector : in out T; Raw : String);
package Parsers is
   function Parse (Raw : String_Vectors.Vector) return T;
   function Load (Path : String) return T;
end Parsers;
