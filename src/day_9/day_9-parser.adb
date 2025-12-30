with Coordinates; use Coordinates;
with GNAT.String_Split; use GNAT;

package body Day_9.Parser is
   procedure Parse_Line (Collector : in out Floor; Raw : String; Line : Positive) is
      Subs : GNAT.String_Split.Slice_Set;
      Seps : constant String := ",";
      C : Coordinate;
   begin
      String_Split.Create (
         S => Subs,
         From => Raw,
         Separators => Seps,
         Mode => String_Split.Multiple
      );
      for I in 1 .. String_Split.Slice_Count (Subs) loop
         declare
            Sub : constant String := String_Split.Slice (Subs, I);
         begin
            case I is
               when 1 =>
                  C.X := Positive'Value (Sub);
               when 2 =>
                  C.Y := Positive'Value (Sub);
               when others =>
                  raise Parse_Error;
            end case;
         end;
      end loop;
      Collector.Tiles.Append (C);
   end Parse_Line;
end Day_9.Parser;
