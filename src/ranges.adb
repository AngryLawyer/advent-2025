package body Ranges is
   function Overlapped (Left : U64_Range; Right : U64_Range) return Opt_U64_Range.Optional is
   begin
      if Left.Right >= Right.Left or Left.Left <= Right.Right then
         null;
      end if;
      return Opt_U64_Range.Empty;
   end;
end Ranges;
