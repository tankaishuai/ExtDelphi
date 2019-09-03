unit Unit1;

interface

implementation

uses
  RegExpr;

var
  g_strResult : string;

function RegExprMatchStdcall(szText: pchar; szPatten : pchar; iGroup:integer) : pchar; stdcall;
var
  RegExpr: TRegExpr;
  ret : string;
  i : integer;
  i2 : integer;
  tmp : string;
begin
  g_strResult := '';
  RegExpr := TRegExpr.Create;
  RegExpr.Expression := szPatten;
  if RegExpr.Exec(szText) then
  begin
     ret := RegExpr.Match[iGroup];
     i := 0;
     //while (i >= 0) and (i < 1) do
     //   tmp := RegExpr.Match[i];
     //  if length(tmp) = 0 then
     //   begin
     //     i := -1;
     //   end
     //   else
     //   begin
     //     ret := concat(ret, #13, tmp);
     //     i2 := i + 1;
     //     i := i2;
     //   end;
     //end;
     g_strResult := ret;
  end;
  //RegExpr.Destroy;
  RegExpr.Free;
  result := pchar(g_strResult);
end;

function RegExprMatchPascal(szText: pchar; szPatten : pchar; iGroup:integer) : pchar; pascal;
var
  RegExpr: TRegExpr;
begin
  result := RegExprMatchStdcall(szText, szPatten, iGroup);
end;

exports
  RegExprMatchStdcall,
  RegExprMatchPascal;

end.
