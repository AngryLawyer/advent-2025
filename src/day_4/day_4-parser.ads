with Types; use Types;
with Day_4.Racks; use Day_4.Racks;

package Day_4.Parser is
   function Parse_Rack (Raw : String_Vectors.Vector) return Rack;
   function Read_Rack (Path : String) return Rack;
end Day_4.Parser;
