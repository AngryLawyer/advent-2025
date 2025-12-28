with Coordinates; use Coordinates;
with GNAT.String_Split; use GNAT;

package body Day_8.Parser is
   procedure Parse_Line (Collector : in out Circuit; Raw : String; Line : Positive) is
      Subs : GNAT.String_Split.Slice_Set;
      Seps : constant String := ",";
      C : Coordinate_3D;
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
                  C.X := Natural'Value (Sub);
               when 2 =>
                  C.Y := Natural'Value (Sub);
               when 3 =>
                  C.Z := Natural'Value (Sub);
               when others =>
                  raise Parse_Error;
            end case;
         end;
      end loop;
      Collector.Nodes.Append (C);
   end Parse_Line;
end Day_8.Parser;
