with GNAT.String_Split; use GNAT;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Strings;

package body Day_6.Worksheets is
   procedure Apply_Operation (C : in out Column; Symbol : String) is
   begin
      if Symbol = "*" then
         C.Operation := Mult;
      elsif Symbol = "+" then
         C.Operation := Add;
      end if;
   end Apply_Operation;

   procedure Add_Value (C : in out Column; Symbol : String) is
   begin
      C.Numbers.Append (U64'Value (Symbol));
   end Add_Value;

   function To_Columns (WS : Worksheet) return Column_Vectors.Vector is
      V : Column_Vectors.Vector;
      Subs : GNAT.String_Split.Slice_Set;
      Seps : constant String := " ";
   begin
      for Line_No in WS.Raw_Rows.First_Index .. WS.Raw_Rows.Last_Index loop
         begin
            declare
               Trimmed : Unbounded_String := To_Unbounded_String (WS.Raw_Rows (Line_No));
            begin
               Trim (Trimmed, Ada.Strings.Both);
               String_Split.Create (
                  S => Subs,
                  From => To_String (Trimmed),
                  Separators => Seps,
                  Mode => String_Split.Multiple
               );

               for I in 1 .. String_Split.Slice_Count (Subs) loop
                  declare
                     Sub : constant String := String_Split.Slice (Subs, I);
                     C : Column;
                  begin
                     if Line_No = 1 then
                        C := (Numbers => [], Operation => Mult);
                        V.Append (C);
                     end if;

                     if Line_No = WS.Raw_Rows.Last_Index then
                        Apply_Operation (V (Natural (I)), Sub);
                     else
                        Add_Value (V (Natural (I)), Sub);
                     end if;
                  end;
               end loop;
            end;
         end;
      end loop;
      return V;
   end To_Columns;
end Day_6.Worksheets;
