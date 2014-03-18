unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, Buttons;

type
  TForm3 = class(TForm)
    editMarks: TStringGrid;
    Button1: TButton;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    procedure Button1Click(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure editMarksSelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure editMarksKeyPress(Sender: TObject; var Key: Char);
    procedure editMarksKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  sRowTop,ssRow:integer;

implementation

uses Unit1, Unit2;

{$R *.dfm}

procedure TForm3.Button1Click(Sender: TObject);
var
  i,r:integer;
begin
  r:=0;
  for i:=2 to Form1.StringGrid1.ColCount-2 do
  begin
    Form1.StringGrid1.Cells[i,sRow]:=editMarks.Cells[1,r];
    r:=r+1;
  end;
  if Form1.StringGrid1.Cells[0,Form1.StringGrid1.RowCount-4] = '' then
  begin
    Form1.StringGrid1.RowCount:=Form1.StringGrid1.RowCount-4;
    Form1.N15.Enabled:=true;
  end;
  Form3.Close;
end;

procedure TForm3.FormActivate(Sender: TObject);
var
  c,r:integer;
begin
  r:=0;
  editMarks.ColWidths[0]:=round(Form3.Width*0.8);
  editMarks.ColWidths[1]:=round(Form3.Width*0.2);
  Form3.Caption:=Form1.StringGrid1.Cells[1,sRow];
  if editMarks.RowCount = 1 then
  begin
    for c:=2 to Form1.StringGrid1.ColCount-2 do
    begin
      editMarks.Cells[0,r]:=Form1.StringGrid1.Cells[c,0];
      editMarks.RowCount:=editMarks.RowCount+1;
      r:=r+1;
    end;
    editMarks.RowCount:=editMarks.RowCount-1;
    editMarks.Height:=editMarks.RowCount*editMarks.DefaultRowHeight+20;
    Form3.ClientHeight:=editMarks.Height+45;
    Button1.Top:=editMarks.Height+10;
    SpeedButton1.Top:=Button1.Top;   
    SpeedButton2.Top:=Button1.Top;
  end
  else
  begin
    r:=2;
    for c:=0 to editMarks.RowCount-1 do
    begin
      if Length(Form1.StringGrid1.Cells[r,sRow]) > 0 then
        editMarks.Cells[1,c]:=Form1.StringGrid1.Cells[r,sRow]
      else
        editMarks.Cells[1,c]:='';
      r:=r+1;
    end;
  end;
end;

procedure TForm3.editMarksSelectCell(Sender: TObject; ACol, ARow: Integer;
  var CanSelect: Boolean);
begin
  ssRow:=ARow;
end;

procedure TForm3.SpeedButton1Click(Sender: TObject);
begin
  editMarks.Cells[1,ssRow]:='ç/ë';
end;

procedure TForm3.SpeedButton2Click(Sender: TObject);
begin
  editMarks.Cells[1,ssRow]:='í/à';
end;

procedure TForm3.editMarksKeyPress(Sender: TObject; var Key: Char);
begin
   if not (key in['1'..'9',#8]) then key:=#0;
   if ((Length(editMarks.Cells[1,ssRow])+1) = 3) and (not (key = #8)) then key:=#0;
end;

procedure TForm3.editMarksKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  tmp:integer;
begin
  TryStrToInt(editMarks.Cells[1,ssRow],tmp);
  if tmp > 12 then
    editMarks.Cells[1,ssRow]:='';
end;

end.
