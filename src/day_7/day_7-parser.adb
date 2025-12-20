with Coordinates; use Coordinates;

package body Day_7.Parser is
   procedure Parse_Line (Collector : in out Manifold; Raw : String; Line : Positive) is
      Splitter_Row : Natural_Sets.Set;
   begin
      for I in Raw'Range loop
         if Raw (I) = 'S' then
            Collector.Start := (I, Line);
         elsif Raw (I) = '^' then
            Splitter_Row.Insert (I);
         end if;
      end loop;
      Collector.Splitters.Append (Splitter_Row);
   end Parse_Line;
end Day_7.Parser;
