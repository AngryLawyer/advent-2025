package Day_1.Rotation is
   type Direction is (Left, Right);
   type Rotation is record
      Dir    : Direction;
      Amount : Natural;
   end record;
end Day_1.Rotation;
