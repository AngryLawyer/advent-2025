with Coordinates; use Coordinates;

package body Day_7.Parser is
   procedure Parse_Line (Collector : in out Manifold; Raw : String; Line : Positive) is
      Coord : Coordinate;
   begin
      for I in Raw'Range loop
         if Raw (I) = 'S' then
            Collector.Start := (I, Line);
         elsif Raw (I) = '^' then
            Coord := (X => Positive (I), Y => Line);
            Collector.Splitters.Insert (Coord);
         end if;
      end loop;
   end Parse_Line;
end Day_7.Parser;
