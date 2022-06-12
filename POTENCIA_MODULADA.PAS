program potencia_modulada(a, b, c);
uses sysUtils;

var
    a, b, c : integer;

function pot_mod(a, b, c : integer) : integer;
begin
    if b = 0 then
        pot_mod := 1
    else
        pot_mod := ((a mod c) * pot_mod(a, b-1, c)) mod c;  
end;

begin
    a := strToInt(paramStr(1));
    b := strToInt(paramStr(2));
    c := strToInt(paramStr(3));

    if (a < 0) or (b < 0) or (c < 2) then
        exit;

    writeln(pot_mod(a, b, c));
end.