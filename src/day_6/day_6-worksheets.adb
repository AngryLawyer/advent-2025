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

   function To_Rotated_Columns (WS : Worksheet) return Column_Vectors.Vector is
      V : Column_Vectors.Vector;
      Current_Column : Column;
      First_Row : String := WS.Raw_Rows.First_Element;
   begin
      for I in reverse 1 .. First_Row'Length loop
         declare
            Agg : Unbounded_String;
            Checked : Character := Character'Val(0);
         begin
            for C of WS.Raw_Rows loop
               Checked := C (I);
               if Checked = '+' or else Checked = '*' then
                  Apply_Operation (Current_Column, "" & Checked);
               elsif Checked /= ' ' then
                  Append (Agg, Checked);
               end if;
            end loop;
            Trim (Agg, Ada.Strings.Both);
            if Length (Agg) > 0 then
               Add_Value (Current_Column, To_String (Agg));
            else
               V.Append (Current_Column);
               Current_Column := ([], Mult);
            end if;
         end;
      end loop;
      V.Append (Current_Column);
      return V;
   end To_Rotated_Columns;

   function Solve (Columns : Column_Vectors.Vector) return U64 is
      Total : U64 := 0;
   begin
      for C of Columns loop
         declare
            Sub : U64 := 0;
         begin
            for R of C.Numbers loop
               if Sub = 0 then
                  Sub := R;
               elsif C.Operation = Add then
                  Sub := Sub + R;
               else
                  Sub := Sub * R;
               end if;
            end loop;
            Total := Total + Sub;
         end;
      end loop;
      return Total;
   end Solve;
end Day_6.Worksheets;
