program DekartTreeNeyKey;

{$APPTYPE CONSOLE}
{$R+,Q+,I+}

uses
  SysUtils;

type P_Tree = ^T_Tree;
     T_Tree = record
        data : string;
        y : integer;
        size : integer;
        left,right : P_Tree;
     end;

var u : P_Tree;

function SIZE(h : P_Tree) : integer;
begin
  if h = nil then result := 0 else result := h.size;
end;

function MAKE(s : string) : P_Tree;
var v : P_Tree;
begin
  new(v);
  v.data := s;
  v.size := 1;
  v.y := 1 + random(1000);
  v.left := nil;
  v.right := nil;
  result := v;
end;

function MERGE(l,r : P_Tree) : P_Tree;
begin
  if l = nil then begin
    result := r;
    exit;
  end;
  if r = nil then begin
    result := l;
    exit;
  end;
  if l.y >= r.y then begin
    l.right := MERGE(l.right,r);
    u := l;
  end else begin
    r.left := MERGE(l,r.left);
    u := r;
  end;
  u.size := 1 + SIZE(u.left) + SIZE(u.right);
  result := u;
end;

procedure SPLIT(h : P_Tree; ind : integer; var l,r : P_Tree);
begin
  if h = nil then begin
    l := nil;
    r := nil;
    exit;
  end;
  if ind <= SIZE(h.left) then begin
    SPLIT(h.left,ind,l,r);
    h.left := r;
    r := h;
  end else begin
    SPLIT(h.right,ind - SIZE(h.left) - 1,l,r);
    h.right := l;
    l := h;
  end;
  h.size := SIZE(h.left) + 1 + SIZE(h.right);
end;

procedure ADD(s : string);
var v : P_Tree;
begin
  v := MAKE(s);
  u := MERGE(u,v);
end;

procedure INS(s : string;k : integer);
var v,l,r : P_Tree;
begin
  SPLIT(u,k,l,r);
  v := MAKE(s);
  l := MERGE(l,v);
  u := MERGE(l,r);
end;

procedure DEL(a,b : integer);
var length : integer;
    v,l,r : P_Tree;
begin
    length := b - a + 1;
    SPLIT(u,a,l,r);
    SPLIT(r,length,v,r);
    u := MERGE(l,r);
end;

function KEY(h : P_Tree;p : integer) : string;
var L : integer;
begin
  if (h = nil) or (p>h.size) then begin
    result := 'OUT OF RANGE';
    exit;
  end;
  L := SIZE(h.left);
  if p = L then begin
    result := h.data;
    exit;
  end else if p < L then begin
    result := KEY(h.left,p);
    exit;
  end else begin
    result := KEY(h.right,p - L - 1);
    exit;
  end;
end;

var s : string;
    c1,c2,c3,c4 : char;
    k,a,b,p : integer;
begin
  reset(input,'input.txt');
  rewrite(output,'output.txt');
  u := nil;
  randomize;
  while (true) do begin
    read(c1,c2,c3,c4);
    if (c1+c2+c3 = 'END') then halt
    else if (c1+c2+c3 = 'ADD') then begin
      readln(s);
      ADD(s);
    end else if (c1+c2+c3 = 'INS') then begin
      readln(k,c4,s);
      if (k>SIZE(u)) then ADD(s) else INS(s,k - 1);
    end else if (c1+c2+c3 = 'DEL') then begin
      readln(a,b);
      DEL(a - 1,b - 1);
    end else if (c1+c2+c3 = 'KEY') then begin
      readln(p);
      writeln(KEY(u,p - 1));
    end;
  end;
end.

