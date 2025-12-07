with Parse_Args; use Parse_Args;
with Day_1;

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
      Make_Integer_Option (Default => 1, Min => 1, Max => 1), "day"
      );

   AP.Parse_Command_Line;

   if AP.Parse_Success and then AP.Boolean_Value ("help") then
      AP.Usage;
   elsif AP.Parse_Success then
      case AP.Integer_Value ("day") is
         when 1 => Day_1.Run;
         when others => AP.Usage;
      end case;
   else
      AP.Usage;
   end if;
end Advent2025;
