with Parse_Args; use Parse_Args;
with Day_1;
with Day_2;
with Day_3;

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
      Make_Integer_Option (Default => 3, Min => 1, Max => 3), "day"
      );

   AP.Parse_Command_Line;

   if AP.Parse_Success and then AP.Boolean_Value ("help") then
      AP.Usage;
   elsif AP.Parse_Success then
      case AP.Integer_Value ("day") is
         when 1 => Day_1.Run;
         when 2 => Day_2.Run;
         when 3 => Day_3.Run;
         when others => AP.Usage;
      end case;
   else
      AP.Usage;
   end if;
end Advent2025;
