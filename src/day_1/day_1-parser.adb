with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed;

package body Day_1.Parser is
   function Parse_Rotation (Line : String) return Day_1.Rotation.Rotation is
      Dir    : Day_1.Rotation.Direction;
      Amount : Natural;
   begin
      case Line (Line'First) is
         when 'L' =>
            Dir := Day_1.Rotation.Left;

         when 'R' =>
            Dir := Day_1.Rotation.Right;

         when others =>
            raise Parse_Error;
      end case;

      Amount := Natural'Value (Ada.Strings.Fixed.Tail (Line, Line'Length - 1));

      return (Dir, Amount);
   end Parse_Rotation;

   procedure Parse_Line (Collector : in out Rotation_Vectors.Vector; Line : String) is
   begin
      Collector.Append (Parse_Rotation (Line));
   end Parse_Line;

end Day_1.Parser;
