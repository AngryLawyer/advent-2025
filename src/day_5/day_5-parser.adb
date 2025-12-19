with Ranges; use Ranges;

package body Day_5.Parser is
   procedure Insert_Range (Ranges : in out U64_Range_Vectors.Vector; My_Range : U64_Range) is
      Compared_Range : U64_Range;
      Merged_Range : Opt_U64_Range.Optional := Opt_U64_Range.Empty;
   begin
      for I in Ranges.First_Index .. Ranges.Last_Index loop
         Compared_Range := Ranges (I);
         Merged_Range := Overlapped (My_Range, Compared_Range);
         if Merged_Range.Has_Element then
            Ranges.Delete (I);
            Insert_Range (Ranges, Merged_Range.Value);
            return;
         end if;
      end loop;
      Ranges.Append (My_Range);
   end Insert_Range;

   procedure Parse_Line (Collector : in out Database; Raw : String; Line : Positive) is
      My_Range : U64_Range;
   begin
      if Raw = "" then
         if Collector.Done_Loading_Ranges then
            raise Parse_Error with "Encountered blank line twice";
         end if;
         Collector.Done_Loading_Ranges := True;
         return;
      end if;

      if Collector.Done_Loading_Ranges then
         Collector.Ingredients.Append (U64'Value (Raw));
      else
         My_Range := Parse_Range (Raw);
         Insert_Range (Collector.Ranges, My_Range);
      end if;
   end Parse_Line;
end Day_5.Parser;
