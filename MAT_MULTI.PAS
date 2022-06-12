program MAT_MULTI(n, m, p);
uses sysUtils;

type
    matrix = array of array of real;


var
    i, j : integer;
    n, m, p : integer;
    A, B : matrix;


procedure print_mat(n, m : integer; A : matrix);
var
    i, j : integer;
begin
    for i := 0 to n - 1 do
    begin
        for j := 0 to m - 1 do
        begin
            write(A[i,j], ' ');
        end;
        writeln('');
    end;
end;


function mat_mul(n, m, p : integer; A, B : matrix) : matrix;
var
    i, j, k : integer;

begin
    setlength(mat_mul, n, p);
    for i := 0 to n - 1 do
    begin
        for j := 0 to p - 1 do
        begin
            mat_mul[i, j] := 0.0;
        end;
    end;  

    for i := 0 to n - 1 do
    begin
        for j := 0 to p - 1 do
        begin
            for k := 0 to m - 1 do
            begin
                mat_mul[i,j] := mat_mul[i,j] + A[i,k] * B[k,j];
            end;
        end; 
    end;
end;


begin
    n := strToInt(paramStr(1));
    m := strToInt(paramStr(2));
    p := strToInt(paramStr(3));


    setlength(A, n, m);  
    writeln('Introduce la matriz A NxM:');
    for i := 0 to n - 1 do
    begin
        for j := 0 to m - 1 do
        begin
            writeln('Introduce el elemento (', i, ',', j, ')');
            readln(A[i, j]);
        end;
    end;
    print_mat(n, m, A);


    setlength(b, m, p);
    writeln('Introduce la matriz B MxP:');
    for i := 0 to m - 1 do
    begin
        for j := 0 to p - 1 do
        begin
            writeln('Introduce el elemento (', i, ',', j, ')');
            readln(B[i, j]);
        end;
    end;
    
    print_mat(m, p, B);
    print_mat(n, p, mat_mul(n, m, p, A, B));
end.