unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, ExtCtrls,
  StdCtrls, Unit2,Unit3,unit4;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Cb1: TCheckBox;
    Cb2: TCheckBox;
    Cb3: TCheckBox;
    ComB1: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    Image2: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Rb1: TRadioButton;
    Rb2: TRadioButton;

    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);


       procedure nameschange(Sender: TObject);


    procedure RbChange(Sender: TObject);


  private
    { private declarations }
  public
    { public declarations }
  end;
type coz =(X, O, null);
var
  Form1: TForm1;
  Pvp,CompMoveDone:boolean;
  CompDif:byte;
  c,i,k,g,a,b,x1,d,y,add:integer;
  symb,Winner:coz;
  game:array [0..2,0..2] of  coz;
  pool:array [0..2,0..8] of Integer;
  n:string;
  score:LongInt;
implementation


{$R *.lfm}

{ TForm1 }




procedure TForm1.RbChange(Sender: TObject);
begin
   Form1.ComB1.Enabled:=Rb2.Checked;//rb changing
   form1.Cb1.Visible:=rb2.Checked;
   form1.Cb2.Visible:=rb2.Checked;
             //---------
             //nameschanging
   if form1.rb1.Checked=true then begin
    form1.edit1.readonly:=false;
    form1.edit2.readonly:=false;
    form1.edit1.Text:='Player1';
    form1.edit2.Text:='Player2';
   end else  form1.nameschange(form1.edit1);


end;

procedure TForm1.nameschange(Sender: TObject);
begin
        //edit.text changing
     if Cb1.Checked=false then begin
      edit1.Text:='Human';
      edit1.readonly:=false;
      edit2.readonly:=true;
       case ComB1.ItemIndex of
        0:edit2.Text:='Friendly computer';
        1:edit2.Text:='Unfriendly computer';
        2:edit2.Text:='Angry computer';
        3:edit2.Text:='Agrassive computer';
        -1:edit2.Text:='Unknown computer';
       end;
     end else begin
      edit2.Text:='Human';
      edit2.readonly:=false;
      edit1.readonly:=true;
       case ComB1.ItemIndex of
        0:edit1.Text:='Friendly computer';
        1:edit1.Text:='Unfriendly computer';
        2:edit1.Text:='Angry computer';
        3:edit1.Text:='Agrassive computer';
        -1:edit2.Text:='Unknown computer';
       end;
     end;
           //--------------
end;




procedure TForm1.Button3Click(Sender: TObject);
begin
  close;
end;







procedure TForm1.Button1Click(Sender: TObject);
begin
  i:=2;
 PlayForm.Button3.click;
if (form1.Rb2.Checked=false) or
   (form1.ComB1.ItemIndex<>-1) then begin
   PlayForm.Show;
   pvp:=form1.Rb1.Checked; //pvp mode
   if form1.rb2.Checked=true then
   begin          //difficulty

    CompDif:=form1.ComB1.ItemIndex;
    //if form1.Cb1.Checked=true then  begin
    // case CompDif of      //comp's move if he's cross
    //  0:PlayForm.easycompmove;
    //  1:PlayForm.compmove1;
    //  2:PlayForm.compmove2;
    //  3:;
    // end;
    //end;
   end;
   PlayForm.label1.Caption:=form1.Edit1.Text;
   PlayForm.label3.Caption:=form1.Edit2.Text;
   form1.Label4.Visible:=false;
   Form1.Hide;
  end else form1.Label4.Visible:=true;   //error

end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  form1.hide;
  LeaderBoard.Show;
end;

    end.
