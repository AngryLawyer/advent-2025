with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed;

package body Day_1.Parser is

   function Parse_Line (Line : String) return Day_1.Rotation.Rotation is
      Dir    : Day_1.Rotation.Direction;
      Amount : Natural;
   begin
      case Line (Line'First) is
         when 'L' =>
            Dir := Day_1.Rotation.Left;

         when 'R' =>
            Dir := Day_1.Rotation.Right;

         when others =>
            raise ParseError;
      end case;

      Amount := Natural'Value (Ada.Strings.Fixed.Tail (Line, Line'Length - 1));

      return (Dir, Amount);
   end Parse_Line;

   function Read_Directions (Path : String) return Rotation_Vectors.Vector is
      V : Rotation_Vectors.Vector;
      F : File_Type;
   begin
      Open (F, In_File, Path);
      while not End_Of_File (F) loop
         V.Append (Parse_Line (Get_Line (F)));
      end loop;
      return V;
   end Read_Directions;
end Day_1.Parser;
