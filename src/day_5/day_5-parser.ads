with Types; use Types;
with Day_5.Databases; use Day_5.Databases;

package Day_5.Parser is
   function Parse_Database (V : String_Vectors.Vector) return Database;
   function Load_Database (Path : String) return Database;
end Day_5.Parser;
