unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, Menus;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    StringGrid1: TStringGrid;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N11: TMenuItem;
    N12: TMenuItem;
    N13: TMenuItem;
    N15: TMenuItem;
    SaveDialog1: TSaveDialog;
    OpenDialog1: TOpenDialog;
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
      Rect: TRect; State: TGridDrawState);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure N7Click(Sender: TObject);
    procedure N6Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N13Click(Sender: TObject);
    procedure N3Click(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

const ExcelApp = 'Excel.Application';

var
  Form1: TForm1;
  sRow,sCol:integer;
  started:boolean;
  MyExcel:OleVariant;

implementation

uses Unit2, Unit3, Unit4, Unit6, ComObj, ActiveX;

{$R *.dfm}

function CheckExcelInstall:boolean;
var
  ClassID: TCLSID;
  Rez : HRESULT;
begin
  Rez := CLSIDFromProgID(PWideChar(WideString(ExcelApp)), ClassID);
  if Rez = S_OK then
    Result := true
  else
    Result := false;
end;

procedure TForm1.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
begin
  with StringGrid1, StringGrid1.Canvas do
  begin
    //���������� ������ ����� ������ clSkyBlue
    if (gdSelected in State) then
      Brush.Color:=clHighlight
    else if (gdFixed in State) then
      Brush.Color:=FixedColor
    else
      Brush.Color:=Color;
    FillRect(Rect);
    SetBkMode(Handle, TRANSPARENT);
    Rect.Right:=Rect.Right -2; 
    if (ACol < 2) or (ARow = 0) then
      (Sender as TStringGrid).Canvas.Font.Style:=[fsBold]
    else
      (Sender as TStringGrid).Canvas.Font.Style:=[];
    //����� ������ ����� �� ������ ������ ��� ���������
    if (ACol <> 0) or (ACol <> 1) then
      DrawText(Handle, pchar(Cells[ACol, ARow]), -1, Rect, DT_SINGLELINE OR DT_VCENTER OR DT_CENTER)
    else
    //��������� ������ ����� �� ������ ����
      DrawText(Handle, pchar(Cells[ACol, ARow]), -1, Rect, DT_SINGLELINE OR DT_VCENTER OR DT_LEFT);
  end;
end;

procedure TForm1.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  if (ARow >0) and (ACol=1) and (Length(StringGrid1.Cells[0,ARow]) > 0) then
  begin
    sRow:=ARow;
    sCol:=ACol;
    Form3.ShowModal;
  end;
end;

procedure TForm1.N7Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.N6Click(Sender: TObject);
begin
  N15.Enabled:=true;
  Form1.Visible:=false;
  Form2.ShowModal;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if not CheckExcelInstall then
  begin
    MessageBox(0,pChar('��� ������ �������� ������� Microsoft Excell'),pChar('�������'),MB_OK+MB_ICONERROR);
    Halt(4);
    //Application.Terminate;
  end;
  started:=false;
  progRun:=false;
end;

procedure TForm1.N5Click(Sender: TObject);
var
  ExcelApp, Sheet: variant;
  Col,Row: word;
  header,trm:string;
  rwCnt:integer;
begin
  SaveDialog1.FileName:=IntToStr(gpNum)+spec+'_'+IntToStr(tm)+'_'+IntToStr(yr);
  with SaveDialog1 do
  begin
    if not Execute then Exit;
  ExcelApp:=CreateOleObject('Excel.Application');
  try
    ExcelApp.Visible:=false;
    ExcelApp.Workbooks.Add;
    Sheet:=ExcelApp.ActiveWorkbook.Worksheets[1];
    ExcelApp.Range[ExcelApp.Cells[1, 1], ExcelApp.Cells[1, StringGrid1.ColCount]].Merge;
    Sheet.Cells[1,1]:='������� ²��̲���';
    ExcelApp.Range[ExcelApp.Cells[2, 1], ExcelApp.Cells[2, StringGrid1.ColCount]].Merge;
    case tm of
    1,3,5,7: trm:='����� ������ '+IntToStr(yr)+'-'+IntToStr(yr+1)+' ����������� ����';
    2,4,6,8: trm:='����� ������ '+IntToStr(yr-1)+'-'+IntToStr(yr)+' ����������� ����';
    end;

    if spec ='k' then
      header:='����� � '+IntToStr(gpNum)+'-� �� '+trm
    else if spec = 'b' then
      header:='����� � '+IntToStr(gpNum)+'-� �� '+trm
    else
      header:='����� � '+IntToStr(gpNum)+'-� �� '+trm;

    for col:=1 to 2 do
      for row:=1 to 3 do
      begin
        ExcelApp.WorkBooks[1].WorkSheets[1].Cells[row,col].HorizontalAlignment:=3;
        ExcelApp.WorkBooks[1].WorkSheets[1].Cells[row,col].VerticalAlignment:=2;
      end;

    ExcelApp.WorkBooks[1].WorkSheets[1].Rows[3].Font.Bold:=true;

    for col:=3 to stringgrid1.ColCount do
        ExcelApp.WorkBooks[1].WorkSheets[1].Cells[3,col].Orientation:=90;

    Sheet.Cells[2,1]:=header;
    for col:=0 to stringgrid1.ColCount-1 do
      for row:=0 to stringGrid1.RowCount-1 do
        Sheet.Cells[Row+3,Col+1]:=StringGrid1.Cells[Col,Row];


    rwCnt:=0;
    for col:=1 to StringGrid1.RowCount-1 do
      if Length(StringGrid1.Cells[0,col])>0 then
        Inc(rwCnt,1);

    ExcelApp.Range[ExcelApp.Cells[3, 1], ExcelApp.Cells[rwCnt+3, StringGrid1.ColCount]].Borders.LineStyle:=1;
    ExcelApp.Range[ExcelApp.Cells[3, 1], ExcelApp.Cells[rwCnt+3, StringGrid1.ColCount]].Borders.Weight:=2;
    ExcelApp.Range[ExcelApp.Cells[3, 1], ExcelApp.Cells[rwCnt+3, StringGrid1.ColCount]].Borders.ColorIndex:=1;


    ExcelApp.Columns.Autofit;
    Sheet.Cells[rwCnt+9,2]:='������� �����_________________';


    ExcelApp.ActiveWorkbook.SaveAs(FileName);
    MessageBox(0,'���� ���������','�����������',MB_OK+MB_ICONINFORMATION);
  finally
    ExcelApp.Application.Quit;
    ExcelApp:=unassigned;
    Sheet := Unassigned;
  end;


  end;
end;

procedure TForm1.N4Click(Sender: TObject);
const
  xlCellTypeLastCell = $0000000B;
var
  XLApp, Sheet: OLEVariant;
  RangeMatrix: Variant;
  x, y, k, r, yr1, yr2: Integer;
  str:string;
begin
  N15.Enabled:=true;
  // Create Excel-OLE Object
  XLApp := CreateOleObject('Excel.Application');
  try
    // Hide Excel
    XLApp.Visible := False;

    // Open the Workbook
    with OpenDialog1 do
    if execute then
    begin
      XLApp.Workbooks.Open(FileName);

      // Sheet := XLApp.Workbooks[1].WorkSheets[1];
      Sheet := XLApp.Workbooks[ExtractFileName(FileName)].WorkSheets[1];
    end
    else
      exit;

    // In order to know the dimension of the WorkSheet, i.e the number of rows
    // and the number of columns, we activate the last non-empty cell of it

    Sheet.Cells.SpecialCells(xlCellTypeLastCell, EmptyParam).Activate;
    // Get the value of the last row
    if (Length(Sheet.Cells[XLApp.ActiveCell.Row-2,3])>0) and
      (Length(Sheet.Cells[XLApp.ActiveCell.Row-2,1])=0) then
      x := XLApp.ActiveCell.Row-2
    else
      x := XLApp.ActiveCell.Row-6;
    // Get the value of the last column
    y := XLApp.ActiveCell.Column;

    // Set Stringgrid's row &col dimensions.

    StringGrid1.RowCount := x;
    StringGrid1.ColCount := y;
    //x:=2;
    //y:=3;

    // Assign the Variant associated with the WorkSheet to the Delphi Variant

    RangeMatrix := XLApp.Range['A1', XLApp.Cells.Item[X, Y]].Value;
    //  Define the loop for filling in the TStringGrid
    k := 3;
    repeat
      for r := 1 to y do
        StringGrid1.Cells[(r - 1), (k - 3)] := RangeMatrix[K, R];
      Inc(k, 1);
      StringGrid1.RowCount := k + 1;
    until k > x;

    {if (Length(Sheet.Cells[XLApp.ActiveCell.Row,3])=0) and
      (Length(Sheet.Cells[XLApp.ActiveCell.Row,1])=0) then
      StringGrid1.RowCount:=StringGrid1.RowCount-5; }

    str:=XLApp.Workbooks[1].WorkSheets[1].Cells[2,1];
    gpNum:=StrToInt(Copy(str,9,2));
    if Copy(str,12,1) = '�' then
      spec:='k'
    else if Copy(str,12,1) = '�' then
      spec:='b'
    else
      spec:='m';
    if pos('�����',str) > 0 then
      tm:=gpNum div 10 * 2 -1
    else
      tm:=gpNum div 10 * 2;
    yr1:=StrToInt(Copy(str,pos('20',str),4));
    str:=Copy(str,pos('20',str)+5,Length(str));
    yr2:=StrToInt(Copy(str,1,4));
    case tm of
    1,3,5,7: yr:=yr1;
    2,4,6,8: yr:=yr2;
    end; 
    if spec ='k' then
      str:='������� �������, '+IntToStr(gpNum)+'-� �����,'+#32+IntToStr(tm)+'-� �������,'+#32+IntToStr(yr)+'�.'
    else if spec = 'b' then
      str:='������� �������, '+IntToStr(gpNum)+'-� �����,'+#32+IntToStr(tm)+'-� �������,'+#32+IntToStr(yr)+'�.'
    else
      str:='������� �������, '+IntToStr(gpNum)+'-� �����,'+#32+IntToStr(tm)+'-� �������,'+#32+IntToStr(yr)+'�.';
    Form1.Caption:=str;  
    //ShowMessage(IntToStr(yr));
    // Unassign the Delphi Variant Matrix
    RangeMatrix := Unassigned;

  finally
    // Quit Excel
    if not VarIsEmpty(XLApp) then
    begin
      // XLApp.DisplayAlerts := False;
      for k:=2 to StringGrid1.ColCount- 2 do
        StringGrid1.ColWidths[k]:=Length(StringGrid1.Cells[k,0])+Length(StringGrid1.Cells[k,0])*5+25;
      StringGrid1.ColWidths[StringGrid1.ColCount-1]:=85;
      StringGrid1.RowCount:=StringGrid1.RowCount-4;
      XLApp.Quit;
      XLAPP := Unassigned;
      Sheet := Unassigned;
      if Length(StringGrid1.Cells[0,StringGrid1.RowCount-1]) = 0 then
        N15.Enabled:=false;
    end;
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
var
  gp,sj:TextFile;
  gpPath,sjPath,str,formCaption:string;
  row,col:integer;
begin
  if started = false then
  begin
    started:=true;
    Form2.ShowModal;
  end
  else
  begin
    for col:=0 to StringGrid1.ColCount-1 do
      for row:=0 to StringGrid1.RowCount-1 do
        StringGrid1.Cells[col,row]:='';
    StringGrid1.ColCount:=3;
    StringGrid1.RowCount:=2;
  end;
  //Form2.ClientHeight:=Form2.ClientHeight-40;
  if spec ='k' then
    formCaption:='������� �������, '+IntToStr(gpNum)+'-� �����,'+#32+IntToStr(tm)+'-� �������,'+#32+IntToStr(yr)+'�.'
  else if spec = 'b' then
    formCaption:='������� �������, '+IntToStr(gpNum)+'-� �����,'+#32+IntToStr(tm)+'-� �������,'+#32+IntToStr(yr)+'�.'
  else
    formCaption:='������� �������, '+IntToStr(gpNum)+'-� �����,'+#32+IntToStr(tm)+'-� �������,'+#32+IntToStr(yr)+'�.';
  Form1.Caption:=formCaption;
  StringGrid1.Cells[0,0]:='�';
  StringGrid1.Cells[1,0]:='ϲ�';
  row:=1;
  col:=2;
  gpPath:=ExtractFilePath(Application.ExeName)+'groups/'+IntToStr(gpNum)+spec+'.txt';
  sjPath:=ExtractFilePath(Application.ExeName)+'subjects/'+spec+'/'+IntToStr(gpNum)+'/'+IntToStr(tm)+'.txt';
  AssignFile(gp,gpPath);
  AssignFile(sj,sjPath);
  {$I-}
  Reset(gp);
  {$I+}
  if IOResult<>0 then
    //MessageDlg('Error open',mtError,[mbOk],0)
    MessageBox(handle,pChar('������ �������� �� ���������, ������� ���� �� ��������� ���� "��������"'),pChar('������������'),MB_OK+MB_ICONWARNING)
  else
  begin
    repeat
      StringGrid1.RowCount:=StringGrid1.RowCount+1;
      readln(gp,str);
      StringGrid1.Cells[1,row]:=str;
      StringGrid1.Cells[0,row]:=IntToStr(row);
      row:=row+1;
    until eof(gp);
    StringGrid1.RowCount:=StringGrid1.RowCount-1;
    CloseFile(gp);
  end;
  {$I-}
  Reset(sj);
  {$I+}
  if IOResult<>0 then
    //MessageDlg('Error open',mtError,[mbOk],0)
    MessageBox(handle,pChar('������ �������� �� ���������, ������� ���� �� ��������� ���� "��������"'),pChar('������������'),MB_OK+MB_ICONWARNING)
  else
  begin
    repeat
      StringGrid1.ColCount:=StringGrid1.ColCount+1;
      readln(sj,str);
      StringGrid1.Cells[col,0]:=str;
      StringGrid1.ColWidths[col]:=Length(str)+Length(str)*5+25;
      col:=col+1;
    until eof(sj);
    CloseFile(sj);
    StringGrid1.Cells[StringGrid1.ColCount-1,0]:='�������� ���';
    StringGrid1.ColWidths[StringGrid1.ColCount-1]:=85;
  end;
end;

procedure TForm1.N15Click(Sender: TObject);
var
  c,r,count,tmp:integer;
  sum,mid,res,qual:real;
  temp:word;
begin
  for r:=1 to StringGrid1.RowCount-1 do
  begin
    sum:=0;
    count:=0;
    for c:=2 to StringGrid1.ColCount-2 do
      if Length(StringGrid1.Cells[c,r]) > 0 then
      begin
        if TryStrToInt(StringGrid1.Cells[c,r],tmp) then
        begin
          sum:=sum+tmp;
          Inc(count,1);
        end;
      end
      else
      begin
        Form1.Enabled:=false;
        temp:=MessageBox(0, PChar(StringGrid1.Cells[1,r]+' - ������ �� ����������'),'������������', MB_OKCANCEL+MB_ICONWARNING);
        if temp = idOk then
        begin
          Form1.Enabled:=true;
          break;
        end
        else
        begin   
          Form1.Enabled:=true;
          exit;
        end;
      end;
    if count <> 0 then
      mid:=sum/count
    else
      mid:=0;
    StringGrid1.Cells[StringGrid1.ColCount-1,r]:=FloatToStrF(mid,ffFixed,1,1);
  end;
  for r:=1 to StringGrid1.RowCount-1 do
    for c:=2 to StringGrid1.ColCount-2 do
      if Length(StringGrid1.Cells[c,r]) = 0 then
        Exit;
  N15.Enabled:=false;
  sum:=0;
  for r:=1 to StringGrid1.RowCount-1 do
    sum:=sum+StrToFloat(StringGrid1.Cells[StringGrid1.ColCount-1,r]);
  mid:=sum/(StringGrid1.RowCount-1);
  sum:=0;
  for r:=1 to StringGrid1.RowCount-1 do
  begin
    count:=0;
    for c:=2 to StringGrid1.ColCount-2 do
    begin
      if not TryStrToInt(StringGrid1.Cells[c,r],tmp) then
        tmp:=5;
      if (tmp > 2) and (StringGrid1.Cells[c,r] <> '�/�') then
        count:=count+1;
    end;
    if count = StringGrid1.ColCount-3 then
      sum:=sum+1;
  end;
  res:=sum*100/(StringGrid1.RowCount-1);
  sum:=0;
  for r:=1 to StringGrid1.RowCount-1 do
  begin
    count:=0;
    for c:=2 to StringGrid1.ColCount-2 do
    begin
      if not TryStrToInt(StringGrid1.Cells[c,r],tmp) then
        tmp:=5;
      if (tmp > 3)  and (StringGrid1.Cells[c,r] <> '�/�') then
        count:=count+1;
    end;
    if count = StringGrid1.ColCount-3 then
      sum:=sum+1;
  end;
  qual:=sum*100/(StringGrid1.RowCount-1);
  for r:=StringGrid1.RowCount to 50 do
    StringGrid1.Rows[r].Clear;
  StringGrid1.Cells[1,StringGrid1.RowCount+1]:='�������� ���';
  StringGrid1.Cells[2,StringGrid1.RowCount+1]:=FloatToStrF(mid,ffFixed,2,1);
  StringGrid1.Cells[1,StringGrid1.RowCount+2]:='���������';
  StringGrid1.Cells[2,StringGrid1.RowCount+2]:=FloatToStrF(res,ffFixed,3,1)+'%';
  StringGrid1.Cells[1,StringGrid1.RowCount+3]:='������ ��������';
  StringGrid1.Cells[2,StringGrid1.RowCount+3]:=FloatToStrF(qual,ffFixed,3,1)+'%';
  StringGrid1.RowCount:=StringGrid1.RowCount+4;

end;

procedure TForm1.N2Click(Sender: TObject);
begin
  Form4.ShowModal;
end;

procedure TForm1.N13Click(Sender: TObject);
var
  ExcelApp, Sheet: variant;
  Col,Row: word;
  header,trm:string;
  rwCnt:integer;
begin
  ExcelApp:=CreateOleObject('Excel.Application');
  try
    ExcelApp.DisplayAlerts:=false;
    ExcelApp.Visible:=false;
    ExcelApp.Workbooks.Add;
    Sheet:=ExcelApp.ActiveWorkbook.Worksheets[1];
    ExcelApp.Range[ExcelApp.Cells[1, 1], ExcelApp.Cells[1, StringGrid1.ColCount]].Merge;
    Sheet.Cells[1,1]:='������� ²��̲���';
    ExcelApp.Range[ExcelApp.Cells[2, 1], ExcelApp.Cells[2, StringGrid1.ColCount]].Merge;
    case tm of
    1,3,5,7: trm:='����� ������ '+IntToStr(yr)+'-'+IntToStr(yr+1)+' ����������� ����';
    2,4,6,8: trm:='����� ������ '+IntToStr(yr-1)+'-'+IntToStr(yr)+' ����������� ����';
    end;

    if spec ='k' then
      header:='����� � '+IntToStr(gpNum)+'-� �� '+trm
    else if spec = 'b' then
      header:='����� � '+IntToStr(gpNum)+'-� �� '+trm
    else
      header:='����� � '+IntToStr(gpNum)+'-� �� '+trm;

    for col:=1 to 2 do
      for row:=1 to 3 do
      begin
        ExcelApp.WorkBooks[1].WorkSheets[1].Cells[row,col].HorizontalAlignment:=3;
        ExcelApp.WorkBooks[1].WorkSheets[1].Cells[row,col].VerticalAlignment:=2;
      end;

    ExcelApp.WorkBooks[1].WorkSheets[1].Rows[3].Font.Bold:=true;

    for col:=3 to stringgrid1.ColCount do
        ExcelApp.WorkBooks[1].WorkSheets[1].Cells[3,col].Orientation:=90;

    Sheet.Cells[2,1]:=header;
    for col:=0 to stringgrid1.ColCount-1 do
      for row:=0 to stringGrid1.RowCount-1 do
        Sheet.Cells[Row+3,Col+1]:=StringGrid1.Cells[Col,Row];


    rwCnt:=0;
    for col:=1 to StringGrid1.RowCount-1 do
      if Length(StringGrid1.Cells[0,col])>0 then
        Inc(rwCnt,1);

    ExcelApp.Range[ExcelApp.Cells[3, 1], ExcelApp.Cells[rwCnt+3, StringGrid1.ColCount]].Borders.LineStyle:=1;
    ExcelApp.Range[ExcelApp.Cells[3, 1], ExcelApp.Cells[rwCnt+3, StringGrid1.ColCount]].Borders.Weight:=2;
    ExcelApp.Range[ExcelApp.Cells[3, 1], ExcelApp.Cells[rwCnt+3, StringGrid1.ColCount]].Borders.ColorIndex:=1;


    ExcelApp.Columns.Autofit;
    Sheet.Cells[rwCnt+9,2]:='������� �����_________________';

    Sheet.PageSetup.Zoom:=false;
    Sheet.PageSetup.FitToPagesTall:=1;
    Sheet.PageSetup.FitToPagesWide:=1;
    ExcelApp.Visible:=true;
    try
      Sheet.PrintPreview;
    except
      exit;
    end;     
    ExcelApp.Visible:=false;
  finally
    ExcelApp.Application.Quit;
    ExcelApp:=unassigned;
    Sheet := Unassigned;
  end;
end;

procedure TForm1.N3Click(Sender: TObject);
begin
  Form6.Showmodal;
end;

end.


