unit Unit3;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  Grids,unit4,Unit5;

type

  { TLeaderBoard }

  TLeaderBoard = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Memo1: TMemo;
    Memo2: TMemo;
    SG1: TStringGrid;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);

    procedure FormCreate(Sender: TObject);
    procedure save;


  private
    { private declarations }
  public
    { public declarations }
  end;

var
  LeaderBoard: TLeaderBoard;

  BaseScore:integer;
  FileText:tstrings;

implementation
uses
  unit1, Unit2;

{$R *.lfm}

{ TLeaderBoard }

procedure TLeaderBoard.Button1Click(Sender: TObject);
begin
  save;
  form1.button3.click;
end;

procedure TLeaderBoard.Button2Click(Sender: TObject);
begin
  save;
  Form1.Show;
  PlayForm.Label4.Caption:='0';
  PlayForm.Label5.Caption:='0';
  score:=0;
  LeaderBoard.Hide;
end;

procedure TLeaderBoard.Button3Click(Sender: TObject);
begin
  LeaderBoard.Memo1.Lines.LoadFromFile('.\add\deflbt.txt');
  LeaderBoard.Memo2.Lines.LoadFromFile('.\add\defscore.txt');
   for g:=1 to 10 do begin
    LeaderBoard.SG1.cells[1,g]:=LeaderBoard.Memo1.Lines[g-1];
    LeaderBoard.SG1.cells[2,g]:=LeaderBoard.Memo2.Lines[g-1];
  end;
end;

procedure TLeaderBoard.Button4Click(Sender: TObject);
begin
  LeaderBoard.Edit2.ReadOnly:=false;
  LeaderBoard.Edit2.Visible:=true;
  LeaderBoard.Edit1.Visible:=true;
  LeaderBoard.Button5.Visible:=true;
end;

procedure TLeaderBoard.Button5Click(Sender: TObject);
begin
    for g:=10 downto 1 do
     if strtoint(Edit2.Text)>=strtoint(sg1.Cells[2,g]) then begin

    //----------adding to list------------

      if g<10 then begin
       LeaderBoard.SG1.Cells[1,g+1]:=SG1.Cells[1,g];
       LeaderBoard.SG1.Cells[2,g+1]:=SG1.Cells[2,g];
      end;
      LeaderBoard.SG1.Cells[1,g]:=LeaderBoard.Edit1.Text;
      LeaderBoard.SG1.Cells[2,g]:=LeaderBoard.Edit2.Text;
end;

    form3.Show;
  LeaderBoard.Button5.Visible:=false;
  LeaderBoard.edit1.Visible:=false;
  LeaderBoard.edit2.Visible:=false;
end;

procedure TLeaderBoard.Button6Click(Sender: TObject);
begin
  LeaderBoard.Memo1.Visible:=true;
  LeaderBoard.Memo2.Visible:=true;
end;

procedure TLeaderBoard.Button7Click(Sender: TObject);
begin
 LeaderBoard.Memo1.Visible:=false;
  LeaderBoard.Memo2.Visible:=false;
end;



procedure TLeaderBoard.FormCreate(Sender: TObject);
begin
      //sleep(1000);
  LeaderBoard.Memo1.Lines.LoadFromFile('.\add\leaderboardtext.txt');
  LeaderBoard.Memo2.Lines.LoadFromFile('.\add\leadscore.txt');
      LeaderBoard.SG1.ColWidths[0]:=20;
      LeaderBoard.SG1.ColWidths[1]:=LeaderBoard.sg1.Width-70;
      LeaderBoard.SG1.ColWidths[2]:=50;
      for g:=1 to 10 do sg1.Cells[0,g]:=inttostr(g)+'.';
  for g:=1 to 10 do begin
    LeaderBoard.SG1.cells[1,g]:=LeaderBoard.Memo1.Lines[g-1];
    LeaderBoard.SG1.cells[2,g]:=LeaderBoard.Memo2.Lines[g-1];
  end;
    LeaderBoard.SG1.cells[1,0]:='Name';
    LeaderBoard.SG1.cells[2,0]:='Score';
end;

procedure TLeaderBoard.save;
begin
  for g:=1 to 10 do begin
   LeaderBoard.Memo1.Lines[g-1]:=LeaderBoard.SG1.Cells[1,g];
   LeaderBoard.Memo2.Lines[g-1]:=LeaderBoard.SG1.Cells[2,g];
  end;
  LeaderBoard.Memo1.Lines.SaveToFile('.\add\leaderboardtext.txt');
  LeaderBoard.Memo2.Lines.SaveToFile('.\add\leadscore.txt');
end;





{ TLeaderBoard }



end.

