with Types; use Types;
with Parsers;
with Day_7.Manifolds; use Day_7.Manifolds;

package Day_7.Parser is
   procedure Parse_Line (Collector : in out Manifold; Raw : String; Line : Positive);

   package P is new Parsers (
      T => Manifold,
      Parse_Line => Parse_Line
   );

   function Parse (Raw : String_Vectors.Vector) return Manifold renames P.Parse;
   function Read_Manifold (Path : String) return Manifold renames P.Load;
end Day_7.Parser;
