with Ranges; use Ranges;
with Types; use Types;

package Day_5.Databases is
   type Database is record
      Ranges : U64_Range_Vectors.Vector;
      Ingredients : U64_Vectors.Vector;
      Done_Loading_Ranges : Boolean := False;
   end record;

   function Freshness_Count (DB : Database) return Natural;
   function All_Possible_Freshness_Count (DB : Database) return U64;
end Day_5.Databases;
