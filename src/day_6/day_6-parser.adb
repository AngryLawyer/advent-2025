package body Day_6.Parser is
   procedure Parse_Line (Collector : in out Worksheet; Line : String) is
   begin
      Collector.Raw_Rows.Append (Line);
   end Parse_Line;
end Day_6.Parser;
