unit Unit6;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, Grids;

type
  TForm6 = class(TForm)
    MainMenu1: TMainMenu;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    subjects: TStringGrid;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N14: TMenuItem;
    procedure FormActivate(Sender: TObject);
    procedure subjectsSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure FormCreate(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure N7Click(Sender: TObject);
    procedure N9Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N11Click(Sender: TObject);
    procedure N12Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  cnt,sRow:integer;
  savePath:string;

implementation

uses Unit1, Unit7, Unit2;

{$R *.dfm}

procedure TForm6.FormActivate(Sender: TObject);
var
  i:integer;
begin
  gpList:=gpNum;
  specList:=spec;
  tmList:=tm;
  subjects.ColWidths[0]:=30;
  subjects.ColWidths[1]:=221;
  subjects.Cells[0,0]:='№';
  subjects.Cells[1,0]:='Назва предмета';
  subjects.Cells[0,1]:='1';
  subjects.Cells[0,2]:='2';
  if (Length(Form1.StringGrid1.Cells[2,0]) > 0) and (form1.StringGrid1.ColCount > 3) then
  begin
    subjects.RowCount:=Form1.StringGrid1.ColCount-2;
    for i:=2 to Form1.StringGrid1.ColCount-2 do
    begin
      subjects.Cells[0,i]:=IntToStr(i-1);
      subjects.Cells[1,i-1]:=Form1.StringGrid1.Cells[i,0];
    end;
    cnt:=StrToInt(subjects.Cells[0,subjects.RowCount-1])+1;
  end;
  savePath:=ExtractFilePath(Application.ExeName)+'subjects/'+spec+'/'+IntToStr(gpNum)+'/'+IntToStr(tm)+'.txt';
  //ShowMessage(savePath);
end;

procedure TForm6.subjectsSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  sRow:=ARow;
  if Arow = subjects.RowCount-1 then
    begin
      subjects.RowCount:=subjects.RowCount+1;  
      subjects.Cells[1,subjects.RowCount-1]:='';
      subjects.Cells[0,subjects.RowCount-1]:=IntToStr(cnt);
      Inc(cnt,1);
    end;
  if (Length(subjects.Cells[1,subjects.RowCount-2]) = 0)
    and (Length(subjects.Cells[1,subjects.RowCount-3]) = 0)
    and (subjects.RowCount > 3) then
    begin
      subjects.RowCount:=subjects.RowCount-1;
      //subjects.Cells[0,subjects.RowCount-1]:='';
      Inc(cnt,-1);
    end;
      //ShowMessage(IntToStr(Length(subjects.Cells[1,subjects.RowCount-2])));
end;

procedure TForm6.FormCreate(Sender: TObject);
begin
  cnt:=3;
  srow:=1;
end;

procedure TForm6.N9Click(Sender: TObject);
begin
  Form6.Close;
end;

procedure TForm6.N4Click(Sender: TObject);
var
  i,j:integer;
  coord:TGridRect;
begin
  coord.Left:=1;
  coord.Right:=1;
  coord.Top:=1;
  coord.Bottom:=1;
  subjects.Selection:=coord;
  for i:=0 to 1 do
    for j:=1 to subjects.RowCount-1 do
      subjects.Cells[i,j]:='';
  subjects.RowCount:=3;
  subjects.Cells[0,1]:='1';
  subjects.Cells[0,2]:='2';
  cnt:=3;
  Form7.ShowModal;
end;

procedure TForm6.N13Click(Sender: TObject);
var
  i:integer;
begin   
  if sRow = subjects.RowCount-1 then
    exit;      
  subjects.RowCount:=subjects.RowCount+1;
  i:=subjects.RowCount-1;
  repeat
    subjects.Cells[1,i]:=subjects.Cells[1,i-1];
    Inc(i,-1);
  until i = sRow;
  subjects.Cells[1,sRow]:='';
  for i:=1 to subjects.RowCount-1 do
    subjects.Cells[0,i]:=IntToStr(i);
  cnt:=StrToInt(subjects.Cells[0,subjects.RowCount-1])+1;
end;

procedure TForm6.N14Click(Sender: TObject);
var
  i:integer;
begin      
  if sRow = subjects.RowCount-1 then
    exit;     
  subjects.RowCount:=subjects.RowCount+1;
  i:=subjects.RowCount-1;
  repeat
    subjects.Cells[1,i]:=subjects.Cells[1,i-1];
    Inc(i,-1);
  until i = sRow;
  subjects.Cells[1,sRow+1]:='';
  for i:=1 to subjects.RowCount-1 do
    subjects.Cells[0,i]:=IntToStr(i);
  cnt:=StrToInt(subjects.Cells[0,subjects.RowCount-1])+1;
end;

procedure TForm6.N11Click(Sender: TObject);
var
  i:integer;
begin    
  if (sRow = subjects.RowCount-1) and (subjects.RowCount > 3) then
  begin
    subjects.Cells[1,sRow]:='';
    subjects.RowCount:=subjects.RowCount-1;
    sRow:=subjects.RowCount-1;
    Exit;
  end;
  if subjects.RowCount > 3 then
  begin
    i:=sRow;
    repeat
      subjects.Cells[1,i]:=subjects.Cells[1,i+1];
      Inc(i,1);
    until i = subjects.RowCount-1;
    for i:=1 to subjects.RowCount-1 do
      subjects.Cells[0,i]:=IntToStr(i);
    subjects.RowCount:=subjects.RowCount-1;
  end; 
  cnt:=StrToInt(subjects.Cells[0,subjects.RowCount-1])+1;
end;

procedure TForm6.N12Click(Sender: TObject);
var
  i,j:integer;
  coord:TGridRect;
begin
  coord.Left:=1;
  coord.Right:=1;
  coord.Top:=1;
  coord.Bottom:=1;
  subjects.Selection:=coord;
  for i:=0 to 1 do
    for j:=1 to subjects.RowCount-1 do
      subjects.Cells[i,j]:='';
  subjects.RowCount:=3;
  subjects.Cells[0,1]:='1';
  subjects.Cells[0,2]:='2';
  cnt:=3;
end;

procedure TForm6.N5Click(Sender: TObject);
var
  i:integer;
  stList:TextFile;
  str:string;
begin
  OpenDialog1.InitialDir:=ExtractFilePath(Application.ExeName)+'subjects/';
  with OpenDialog1 do
    if Execute then
    begin
      AssignFile(stList,FileName);
      savePath:=FileName;
    end
    else
      exit;
  for i:=1 to subjects.RowCount-1 do
    subjects.Rows[i].Clear;
  subjects.RowCount:=2;
  {$I-}
  Reset(stList);
  {$I-}
  if IOResult <> 0 then
  begin
    MessageBox(0,pChar('Не вдалося відкрити'),pChar('Помилка'),MB_OK+MB_ICONERROR);
    Exit;
  end;
  i:=1;
  repeat
    readln(stList,str);
    if Length(str) > 1 then
    begin
      subjects.Cells[1,i]:=str;
      subjects.RowCount:=subjects.RowCount+1;
      Inc(i,1);
    end;
  until eof(stList);
  CloseFile(stList);

  subjects.RowCount:=subjects.RowCount-1;
   
  for i:=1 to subjects.RowCount-1 do
    subjects.Cells[0,i]:=IntToStr(i);
  cnt:=StrToInt(subjects.Cells[0,subjects.RowCount-1])+1;
end;

procedure TForm6.N6Click(Sender: TObject);
var
  f:TextFile;
  i:integer;
begin
  AssignFile(f,savePath);
  {$I-}
  Rewrite(f);
  {$I-}
  if IOResult <> 0 then
  begin
    MessageBox(0,pChar('Не вдалося зберегти'),pChar('Помилка'),MB_OK+MB_ICONERROR);
    Exit;
  end;
  i:=1;
  repeat
    if Length(subjects.Cells[1,i]) > 0 then
    begin
      writeln(f,subjects.Cells[1,i]);
      //ShowMessage(subjects.Cells[1,i]);
    end;
    Inc(i,1);
  until i=subjects.RowCount-1;
  CloseFile(f);
  MessageBox(0,pChar('Файл збережено'),pChar('Повідомлення'),MB_OK+MB_ICONINFORMATION);
end;

procedure TForm6.N7Click(Sender: TObject);
var
  f:TextFile;
  i:integer;
begin
  with SaveDialog1 do
    if Execute then
    begin
      AssignFile(f,FileName);
      savePath:=FileName;
    end
    else
      exit;
  {$I-}
  Rewrite(f);
  {$I-}
  if IOResult <> 0 then
  begin
    MessageBox(0,pChar('Не вдалося зберегти'),pChar('Помилка'),MB_OK+MB_ICONERROR);
    Exit;
  end;
  i:=1;
  repeat
    if Length(subjects.Cells[1,i]) > 0 then
    begin
      writeln(f,subjects.Cells[1,i]);
      //ShowMessage(subjects.Cells[1,i]);
    end;
    Inc(i,1);
  until i=subjects.RowCount-1;
  CloseFile(f);
  MessageBox(0,pChar('Файл збережено'),pChar('Повідомлення'),MB_OK+MB_ICONINFORMATION);
end;

procedure TForm6.N3Click(Sender: TObject);
var
  i,chk,j:integer;
begin
  chk:=0;
  j:=2;
  Form1.StringGrid1.ColCount:=3;
  for i:=1 to subjects.RowCount-1 do
    if Length(subjects.Cells[1,i])>0 then
    begin
      Form1.StringGrid1.Cells[j,0]:=subjects.Cells[1,i];
      Form1.StringGrid1.ColCount:=Form1.StringGrid1.ColCount+1;
      Form1.StringGrid1.ColWidths[j]:=Length(Form1.StringGrid1.Cells[j,0])+Length(Form1.StringGrid1.Cells[j,0])*5+25;
      Inc(chk,1); 
      Inc(j,1);
    end;
    Form1.StringGrid1.ColCount:=Form1.StringGrid1.ColCount-1;
  Form1.StringGrid1.ColCount:=Form1.StringGrid1.ColCount+1;
  Form1.StringGrid1.Cells[Form1.StringGrid1.ColCount-1,0]:='Середній бал';
  Form1.StringGrid1.ColWidths[Form1.StringGrid1.ColCount-1]:=85;

  {for i:=1 to Form1.StringGrid1.RowCount-1 do
    Form1.StringGrid1.Cells[0,i]:=IntToStr(i);  }
  Form6.Close;
end;

end.
