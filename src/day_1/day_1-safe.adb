package body Day_1.Safe is
  function Init (Pos : Safe_Position) return Safe is
    Safe_Value : Safe;
  begin
    Safe_Value := (Pos, 0);
    return Safe_Value;
  end Init;

  procedure Apply (S : in out Safe; Action: Day_1.Rotation.Rotation) is
  begin
    case Action.Dir is
      when Day_1.Rotation.Left =>
        S.Pos := S.Pos - Safe_Position'Mod (Action.Amount);
        if S.Pos = 0 then
          S.Count := S.Count + 1;
        end if;
      when Day_1.Rotation.Right =>
        S.Pos := S.Pos + Safe_Position'Mod (Action.Amount);
        if S.Pos = 0 then
          S.Count := S.Count + 1;
        end if;
    end case;
  end Apply;

  function Count (S : Safe) return Integer is
  begin
    return S.Count;
  end Count;

  function Position (S : Safe) return Safe_Position is
  begin
    return S.Pos;
  end Position;
end Day_1.Safe;
