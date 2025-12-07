with Ada.Text_IO;

with Trendy_Test.Assertions.Integer_Assertions;
with Trendy_Test.Reports;

with Day_1.Tests;
with Day_2.Tests;

use Trendy_Test.Assertions;
use Trendy_Test.Assertions.Integer_Assertions;

procedure Tests is
begin
    Trendy_Test.Register (Day_1.Tests.All_Tests);
    Trendy_Test.Register (Day_2.Tests.All_Tests);
    Trendy_Test.Reports.Print_Basic_Report(Trendy_Test.Run);
end Tests;
