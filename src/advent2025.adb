with Parse_Args; use Parse_Args;
with Day_1;
with Day_2;
with Day_3;
with Day_4;
with Day_5;
with Day_6;
with Day_7;
with Day_8;
with Day_9;
with Day_10;
with Day_11;
with Day_12;

procedure Advent2025 is
   AP : Argument_Parser;
begin
   AP.Add_Option (
      Make_Boolean_Option (False),
      "help",
      'h',
      Usage => "Display this help text"
      );
   AP.Append_Positional (
      Make_Integer_Option (Default => 7, Min => 1, Max => 7), "day"
      );

   AP.Parse_Command_Line;

   if AP.Parse_Success and then AP.Boolean_Value ("help") then
      AP.Usage;
   elsif AP.Parse_Success then
      case AP.Integer_Value ("day") is
         when 1 => Day_1.Run;
         when 2 => Day_2.Run;
         when 3 => Day_3.Run;
         when 4 => Day_4.Run;
         when 5 => Day_5.Run;
         when 6 => Day_6.Run;
         when 7 => Day_7.Run;
         when others => AP.Usage;
      end case;
   else
      AP.Usage;
   end if;
end Advent2025;
