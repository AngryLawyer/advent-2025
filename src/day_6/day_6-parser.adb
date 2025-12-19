package body Day_6.Parser is
   procedure Parse_Line (Collector : in out Worksheet; Raw : String; Line : Positive) is
   begin
      Collector.Raw_Rows.Append (Raw);
   end Parse_Line;
end Day_6.Parser;
