unit Unit4;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm2 }

  TForm2 = class(TForm)
    Edit1: TEdit;
    Label1: TLabel;
    Memo1: TMemo;

    procedure Edit1EditingDone(Sender: TObject);
    procedure Memo1Change(Sender: TObject);

  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form2: TForm2;

implementation
     uses
       unit1,unit2,unit3,Unit5;
{$R *.lfm}

     { TForm2 }



procedure TForm2.Edit1EditingDone(Sender: TObject);
begin
  if form2.Edit1.Text[1]='/' then begin

    case Form2.Edit1.Text of
  '/':if 1<2 then begin
    Memo1.Lines.Add('---------');
    Memo1.Lines.Add( 'enabled commands:/block, /compmove3, /compmovedone, /draw, /easycompmove, /hide, /play like cross, /play like zero, /poolcreate, /pvc, /pvp, /score, /show, /unlock lb edits, /verspoolsearch, /winchek');
  Memo1.Lines.Add('---------');
  end;
  '/verspoolsearch':PlayForm.VersPoolSearch;
  '/show symbols':PlayForm.Button4Click(PlayForm.Button4);
  '/easycompmove':PlayForm.easycompmove;
  '/winchek':PlayForm.wincheck;
  '/score':Form2.Memo1.Lines.Add('Usage: /score [+, -, ++, --, +inc, -inc]') ;
  '/score show':PlayForm.Button8.Click;
  '/score +':score:=score+50;
  '/score -':score:=score-50;
  '/score ++':score:=score+500;
  '/score --':score:=score-500;
  '/score +inc':score:=score+50000;
  '/score -inc':score:=score-50000;
  '/draw':PlayForm.drawing;
  '/block':PlayForm.block;
  '/unlock lb edits':LeaderBoard.Button4.Click;
  '/show memos':LeaderBoard.Button6.Click;
  '/hide memos':LeaderBoard.Button7.Click;
  '/show playform':PlayForm.Show;
  '/hide playform':PlayForm.Hide;
  '/show leaderboard':LeaderBoard.Show;
  '/hide leadreboard':LeaderBoard.Hide;
   '/show':Form2.Memo1.Lines.Add('Usage: /show [menu, playform, leaderboard, memos, pool, symbols]');
   '/hide':Form2.Memo1.Lines.Add('Usage: /hide [menu, playform, leaderboard, memos]');
  '/compmovedone':if CompMoveDone=true then
  form2.Memo1.Lines.Add('Compmovedone is true') else if CompMoveDone=false then
  form2.Memo1.Lines.Add('Compmovedone is false');
  '/compmove3':PlayForm.compmove3;
  '/show pool':for b:=0 to 8 do begin
     Form2.Memo1.Lines.Add(inttostr(pool[0,b])+'-x');
     Form2.Memo1.Lines.Add(inttostr(pool[1,b])+'-y');
     Form2.Memo1.Lines.Add(inttostr(pool[2,b])+'-cof');
   end;
  '/poolcreate':PlayForm.PoolCreate;
  '/show menu':Form1.Show;
  '/hide menu':Form1.Hide;
  '/play like cross':Form1.Cb1.Checked:=false;
  '/play like zero':Form1.Cb1.Checked:=false;
  '/pvc':Form2.Memo1.Lines.Add('Usage: /pvc [difficulty from 0 to 3]');
  '/pvp':if 0=0 then begin Form1.rb1.Checked:=true;
                           form1.RbChange(Form1.Rb1); end;
  '/pvc 0':if 0=0 then begin Form1.rb2.Checked:=true;
                             Form1.ComB1.ItemIndex:=0;
                             form1.RbChange(Form1.Rb2);

  end;
  '/pvc 1':if 0=0 then begin Form1.rb2.Checked:=true;
                             Form1.ComB1.ItemIndex:=1;
                             form1.RbChange(Form1.Rb2);

  end;
  '/pvc 2':if 0=0 then begin Form1.rb2.Checked:=true;
    Form1.ComB1.ItemIndex:=2;
                             form1.RbChange(Form1.Rb2);

  end;
  '/pvc 3':if 0=0 then begin Form1.rb2.Checked:=true;
    Form1.ComB1.ItemIndex:=3;
                             form1.RbChange(Form1.Rb2);

  end;
  end;

  end
  else Form2.Memo1.Lines.Add(Form2.Edit1.Text);

end;

procedure TForm2.Memo1Change(Sender: TObject);
begin

end;

end.

