with Day_1.Rotation;

package Day_1.Safe is
   type Safe_Position is mod 100;
   type Safe is private;

   function Init (Pos : Safe_Position) return Safe;
   procedure Apply (S : in out Safe; Action : Day_1.Rotation.Rotation);
   function Count (S : Safe) return Integer;
   function Position (S : Safe) return Safe_Position;
private
   type Safe is record
      Pos : Safe_Position;
      Count : Integer;
   end record;
end Day_1.Safe;
