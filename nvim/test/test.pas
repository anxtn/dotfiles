program Test;

uses SysUtils;

type
  TPerson = record
    ID: Integer;
    Name: string;
  end;

var
  Person: TPerson;
  I: Integer;

function Add(A, B: Integer): Integer;
begin
  Result := A + B;
end;

begin
  Person.ID := 1;
  Person.Name := 'Tom';

  for I := 1 to 5 do
  begin
    WriteLn('Hello ', Person.Name, '! ', I, ' + 2 = ', Add(i, 2));
  end;
end.
