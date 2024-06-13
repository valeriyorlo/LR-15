program z3;

type
  PNode = ^Node;   // Определение типа указателя на узел (Node).
  Node = record    // Определение типа записи для узла.
    word: integer; // Поле для хранения целочисленного значения (данных узла).
    next: PNode;   // Указатель на следующий узел в списке.
  end;

function CreateNode(NewValue: integer): PNode;
var NewNode: PNode;
begin
  New(NewNode);
  NewNode^.word := NewValue;
  NewNode^.next := nil;
  Result := NewNode;
end;

procedure AddValue ( var Head: PNode; NewNode: PNode );
begin
  NewNode^.next := Head;
  Head := NewNode;
end;

procedure FindValue(Head: PNode);
var pp: PNode;
begin
  pp := Head;
  while (pp <> nil) do
    if(pp^.word mod 2 = 0) then
    begin
      write(pp^.word, ' ');
      pp := pp^.next;
    end
    else
    pp := pp^.next;
end;  

var Head: PNode;
  newN: PNode;
  NewValue: integer;
begin
  Head := nil;
  for var i:= 1 to 10 do
  begin
    NewValue := random(-100, 100);
    newN := CreateNode(NewValue);
    AddValue(Head, newN);
    write(NewValue, ' ');
    NewValue := 0;
  end;
  writeln('');
  FindValue(Head);
end.