with Ranges; use Ranges;
with Types; use Types;

package Day_5.Databases is
   type Database is record
      ranges : U64_Range_Vectors.Vector;
      ingredients : U64_Vectors.Vector;
   end record;

   function Freshness_Count (DB : Database) return Natural;
end Day_5.Databases;
