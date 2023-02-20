uses GraphABC;


procedure narisovatb_odnu_verhnuyu_zakoruchku(x,y, n:integer); 
begin
  line(x+n,y,x,y);
  line(x,y+n,x,y);
  line(x+n,y+n,x+n,y);
end;

procedure narisovatb_odnu_levuyu_zakoruchku(x,y, n:integer); 
begin
  line(x+n,y,x,y);
  line(x,y+n,x+n,y+n);
  line(x+n,y+n,x+n,y);
end;

procedure narisovatb_odnu_pravuyu_zakoruchku(x,y, n:integer); 
begin
  line(x+ n,y,x,y);
  line(x,y+n,x+n,y+n);
  line(x,y+n,x,y);
end;

procedure narisovatb_odnu_nizhnuyu_zakoruchku(x,y, n:integer); 
begin
  line(x+n,y,x+n,y+n);
  line(x,y+n,x+n,y+n);
  line(x,y+n,x,y);
end;

procedure narisovatb_odin_kvadrat_iz_zakoruchek(x,y, n:integer);
begin
  narisovatb_odnu_verhnuyu_zakoruchku(x,y, n);
  narisovatb_odnu_nizhnuyu_zakoruchku(x-n,y, n);
  narisovatb_odnu_verhnuyu_zakoruchku(x-2*n,y, n);
  line(x+n, y+n, x+n, y+2*n);
  narisovatb_odnu_pravuyu_zakoruchku(x,y+2*n, n);
  line(x-2*n, y+n, x-2*n, y+2*n);
  narisovatb_odnu_levuyu_zakoruchku(x-2*n,y+2*n, n);
end;

procedure narisovatb_odin_kvadrat_pobolbshe(x,y, n:integer);
begin
  narisovatb_odin_kvadrat_iz_zakoruchek(x, y, n);
  line(x-2*n, y+3*n, x-3*n, y+3*n);
  narisovatb_odin_kvadrat_iz_zakoruchek(x-4*n, y, n);
  line(x+n, y+3*n, x+n, y+4*n);
  line(x-6*n, y+3*n, x-6*n, y+4*n);
  narisovatb_odnu_nizhnuyu_zakoruchku(x-6*n, y+4*n, n);
  narisovatb_odnu_nizhnuyu_zakoruchku(x, y+4*n, n);
  line(x-n, y+4*n, x, y+4*n);
  line(x-4*n, y+4*n, x-5*n, y+4*n);
  narisovatb_odnu_levuyu_zakoruchku(x-4*n, y+4*n, n);
  narisovatb_odnu_pravuyu_zakoruchku(x-2*n, y+4*n, n);
  narisovatb_odnu_pravuyu_zakoruchku(x-4*n, y+5*n, n);
  narisovatb_odnu_levuyu_zakoruchku(x-2*n, y+5*n, n);
  narisovatb_odnu_levuyu_zakoruchku(x-4*n, y+6*n, n);
  narisovatb_odnu_pravuyu_zakoruchku(x-2*n, y+6*n, n);
  line(x-n, y+7*n, x, y+7*n);
  line(x-5*n, y+7*n, x-4*n, y+7*n);
  narisovatb_odnu_verhnuyu_zakoruchku(x-6*n, y+6*n, n);
  narisovatb_odnu_verhnuyu_zakoruchku(x, y+6*n, n);
end;

procedure bolbshoy_kvadrat_s_recursiey(a, x, y, n, i:integer);
begin
  if a=1 then
    narisovatb_odnu_verhnuyu_zakoruchku(x, y, n)
  else
    if a=2 then
      narisovatb_odin_kvadrat_iz_zakoruchek(x, y, n)
    else 
      if a=3 then
        narisovatb_odin_kvadrat_pobolbshe(x, y, n)
      else 
        if a>3 then begin
          if i<a then begin
            if i mod 2 = 0 then begin
              x += 8*n;
              y += 8*n;
              narisovatb_odin_kvadrat_pobolbshe(x, y, n);
              i += 1;
              bolbshoy_kvadrat_s_recursiey(a, x, y, n, i);
            end
            else begin
              x -= 8*n; 
              narisovatb_odin_kvadrat_pobolbshe(x,y, n);
              i += 1;
              sleep(20);
              bolbshoy_kvadrat_s_recursiey(a, x, y, n, i);
          end;
          end
          else
            exit;
        end;
          
    
      
  
       
end;

begin
  var i:=0;
  var a:=ReadInteger('Введите глубину');
  println();
  var n:=ReadInteger('Введите масштаб');
  println();
  var x:=50;
  var y:=50;
  bolbshoy_kvadrat_s_recursiey(a,x,y, n, i);

end.