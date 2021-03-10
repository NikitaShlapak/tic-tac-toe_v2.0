unit Unit2;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls, Unit3,Unit4;

type

  { TPlayForm }

  TPlayForm = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    Image5: TImage;
    Image6: TImage;
    Image7: TImage;
    Image8: TImage;
    Image9: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Shape1: TShape;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure block;
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure cross(Sender: TObject);

     procedure zero(Sender: TObject);

    procedure Button8Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);


    procedure Label2DblClick(Sender: TObject);


    procedure PoolCreate;
    procedure wincheck;
    procedure easycompmove;
    procedure ImagepvpClick(Sender: TObject);
    procedure ImageClick(Sender: TObject);
     procedure PoolSearch(x1,y,add:integer);
      procedure VersPoolSearch;
     procedure compmove1;
     procedure compmove2;
     procedure compmove3;
       procedure drawing;
       procedure freecheck;
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  PlayForm: TPlayForm;


implementation
uses
  Unit1;

{$R *.lfm}

{ TPlayForm }

procedure TPlayForm.Button1Click(Sender: TObject);
begin
  form1.button3.click;
end;

procedure TPlayForm.Button2Click(Sender: TObject);
begin
LeaderBoard.show;
  if pvp=false then begin
   LeaderBoard.Edit1.Visible:=true;
       LeaderBoard.Edit2.Visible:=true;
       LeaderBoard.button5.Visible:=true;

LeaderBoard.Edit2.Text:=inttostr(score);
if Form1.Cb1.Checked=true then LeaderBoard.Edit1.text:=PlayForm.Label3.Caption else
                               LeaderBoard.Edit1.text:=PlayForm.Label1.Caption;

  end else begin
       LeaderBoard.Edit1.Visible:=false;
       LeaderBoard.Edit2.Visible:=false;
       LeaderBoard.button5.Visible:=false;
  end;
PlayForm.Hide;
end;

procedure TPlayForm.cross(Sender: TObject);
begin
 //(Sender as timage).Picture.LoadFromFile('cross.png');

   (Sender as timage).Canvas.pen.Color:=clred;
    (Sender as timage).Canvas.Pen.Width:=10;

     if form1.cb3.Checked = true then begin
    (Sender as timage).Canvas.Line(5,5,85,85); //fast
     (Sender as timage).Canvas.Line(5,85,85,5);
       end else begin

      for a:=2 to 17 do  begin
      (Sender as timage).Canvas.Line(5,5,5*a,a*5);
      Sleep(10);
      end;                        //animation
      for a:=2 to 17 do  begin
      (Sender as timage).Canvas.Line(85,5,90-5*a,a*5);
      Sleep(10);
    end;

     end;
       (sender as timage).Enabled:=false;
end;



procedure TPlayForm.zero(Sender: TObject);
var x,y:integer;
  ang:real;
begin
       (Sender as timage).Canvas.pen.Color:=clBlue;
    (Sender as timage).Canvas.Pen.Width:=1;
   (Sender as timage).Canvas.Brush.Color:=clBlue;
        if form1.cb3.Checked = true then begin
     (Sender as timage).Picture.LoadFromFile('zero.png');
        (Sender as timage).Canvas.Ellipse(5,5,85,85);           //fast
     (Sender as timage).Canvas.Brush.Color:=clWhite;
      (Sender as timage).Canvas.Ellipse(15,15,75,75);
      end else begin

     ang:=0;
  while ang<=6.28 do begin
     Sleep(1);
    x:=45+round(35*cos(ang));
    y:=45+round(35*sin(ang));                              //animation
    (Sender as timage).Canvas.Ellipse(x-5,y-5,x+5,y+5);
     ang:=ang+0.09;
 end  ;
  (Sender as timage).Canvas.Ellipse(5,5,85,85);
     (Sender as timage).Canvas.Brush.Color:=clWhite;
      (Sender as timage).Canvas.Ellipse(14,14,76,76);
end;
      (sender as timage).Enabled:=false;
      end;
procedure TPlayForm.ImagepvpClick(Sender: TObject);
begin


  case (i mod 2) of
   0:symb:=X;
   1:symb:=O;
  end;

  (sender as Timage).Enabled:=false;
   n:=(sender as timage).name[6];
   case n of
     '1':game[0,0]:=symb;
     '2':game[1,0]:=symb;
     '3':game[2,0]:=symb;
     '4':game[0,1]:=symb;
     '5':game[1,1]:=symb;
     '6':game[2,1]:=symb;
     '7':game[0,2]:=symb;
     '8':game[1,2]:=symb;
     '9':game[2,2]:=symb;
   end;


    if symb=X then cross(sender as timage) else zero(sender as timage);
    // (sender as timage).picture.LoadFromFile('cross.png') else
    // (sender as timage).Picture.LoadFromFile('zero.png');

  i:=i+1;
   wincheck;


  end;

procedure TPlayForm.ImageClick(Sender: TObject);
begin
     if (sender as timage).Enabled=true then begin
      if pvp=true then begin ImagepvpClick(sender as timage) //pvp on
    end else begin //pvp off

     (Sender as timage).Enabled:=false;

     if form1.Cb1.Checked=false then symb:=X else symb:=O;

     case (sender as timage).Name[6] of
      '1':game[0,0]:=symb;
      '2':game[1,0]:=symb;
      '3':game[2,0]:=symb;
      '4':game[0,1]:=symb;
      '5':game[1,1]:=symb;
      '6':game[2,1]:=symb;
      '7':game[0,2]:=symb;
      '8':game[1,2]:=symb;
      '9':game[2,2]:=symb;
     end;
       // drawing;
       if symb=x then cross(sender as timage) else zero(sender as timage);
     wincheck;
     if PlayForm.Button3.Visible<>true then begin
       freecheck;
       if (CompMoveDone=false) and (Form1.Rb2.Checked=true) then  begin
           if Form1.Cb2.Checked=false then sleep(100+random(1900));
         case CompDif of
          0:easycompmove;
          1:compmove1;
          2:compmove2;
          3:compmove3;
         end;


   //drawing;
         wincheck;
        end;
       end;
      end;
     end;
     drawing;
end;

procedure TPlayForm.drawing;
begin
 form2.Memo1.Lines.Add('Drawing started...');
    if game[0,0]=X then begin
     PlayForm.Image1.Picture.LoadFromFile('cross.png');
     PlayForm.Image1.Enabled:=false;
     end                   else
    if game[0,0]=O then begin
     PlayForm.Image1.Picture.LoadFromFile('zero.png');
     PlayForm.Image1.Enabled:=false;
     end                   ;
    if game[0,1]=X then begin
     PlayForm.Image4.Picture.LoadFromFile('cross.png');
     PlayForm.Image4.Enabled:=false;
     end                   else
    if game[0,1]=O then begin
     PlayForm.Image4.Picture.LoadFromFile('zero.png');
     PlayForm.Image4.Enabled:=false;
     end                   ;
    if game[0,2]=X then begin
     PlayForm.Image7.Picture.LoadFromFile('cross.png');
     PlayForm.Image7.Enabled:=false;
     end                   else
    if game[0,2]=O then begin
     PlayForm.Image7.Picture.LoadFromFile('zero.png');
     PlayForm.Image7.Enabled:=false;
     end                   ;
    if game[1,0]=X then begin
     PlayForm.Image2.Picture.LoadFromFile('cross.png');
     PlayForm.Image2.Enabled:=false;
     end                   else
    if game[1,0]=O then begin
     PlayForm.Image2.Picture.LoadFromFile('zero.png');
     PlayForm.Image2.Enabled:=false;
     end                   ;
    if game[1,1]=X then begin
     PlayForm.Image5.Picture.LoadFromFile('cross.png');
     PlayForm.Image5.Enabled:=false;
     end                   else
    if game[1,1]=O then begin
     PlayForm.Image5.Picture.LoadFromFile('zero.png');
     PlayForm.Image5.Enabled:=false;
     end                   ;
    if game[1,2]=X then begin
     PlayForm.Image8.Picture.LoadFromFile('cross.png');
     PlayForm.Image8.Enabled:=false;
     end                   else
    if game[1,2]=O then begin
     PlayForm.Image8.Picture.LoadFromFile('zero.png');
     PlayForm.Image8.Enabled:=false;
     end                   ;
    if game[2,0]=X then begin
     PlayForm.Image3.Picture.LoadFromFile('cross.png');
     PlayForm.Image3.Enabled:=false;
     end                   else
    if game[2,0]=O then begin
     PlayForm.Image3.Picture.LoadFromFile('zero.png');
     PlayForm.Image3.Enabled:=false;
     end                  ;
    if game[2,1]=X then begin
     PlayForm.Image6.Picture.LoadFromFile('cross.png');
     PlayForm.Image6.Enabled:=false;
     end                   else
    if game[2,1]=O then begin
     PlayForm.Image6.Picture.LoadFromFile('zero.png');
     PlayForm.Image6.Enabled:=false;
     end                  ;
    if game[2,2]=X then begin
     PlayForm.Image9.Picture.LoadFromFile('cross.png');
     PlayForm.Image9.Enabled:=false;
     end                  else
    if game[2,2]=O then begin
     PlayForm.Image9.Picture.LoadFromFile('zero.png');
     PlayForm.Image9.Enabled:=false;
     end;
     form2.Memo1.Lines.Add('Drawing finished');
end;


procedure TPlayForm.freecheck;
    begin
    form2.Memo1.Lines.Add('finding free positions...');
    CompMoveDone:=true;
        for k:=0 to 2 do
        for g:= 0 to 2 do if game[g,k]=null then begin
         CompMoveDone:=false;
        form2.Memo1.Lines.Add('found at '+inttostr(g)+';'+inttostr(k));  end;
        if CompMoveDone=true then block else form2.Memo1.Lines.Add('free position(s) found');
        end;



procedure TPlayForm.easycompmove;
begin

   {-----comp's brain-----}
       // freecheck;
        while  CompMoveDone=false do begin
         k:=random(3);
         g:=random(3);
         form2.Memo1.Lines.Add('easy comp is moving');
         if game[k,g]=null then begin
          if Form1.cb1.Checked=true then game[k,g]:=X else game[k,g]:=O;
          CompMoveDone:=true;
          case inttostr(g) of
          '0': if 0=0 then case k of
           0:if Form1.cb1.Checked=true then cross(PlayForm.Image1) else zero(PlayForm.Image1);
           1:if Form1.cb1.Checked=true then cross(PlayForm.Image2) else zero(PlayForm.Image2);
           2:if Form1.cb1.Checked=true then cross(PlayForm.Image3) else zero(PlayForm.Image3);
            end;
          '1':if 0=0 then case k of
           0:if Form1.cb1.Checked=true then cross(PlayForm.Image4) else zero(PlayForm.Image4);
           1:if Form1.cb1.Checked=true then cross(PlayForm.Image5) else zero(PlayForm.Image5);
           2:if Form1.cb1.Checked=true then cross(PlayForm.Image6) else zero(PlayForm.Image6);

          end;
          '2':if 0=0 then case k of
           0:if Form1.cb1.Checked=true then cross(PlayForm.Image7) else zero(PlayForm.Image7);
           1:if Form1.cb1.Checked=true then cross(PlayForm.Image8) else zero(PlayForm.Image8);
           2:if Form1.cb1.Checked=true then cross(PlayForm.Image9) else zero(PlayForm.Image9);

          end; end;
          form2.Memo1.Lines.Add('Random move is done at '+inttostr(k)+';'+inttostr(g));
          drawing;
          //wincheck;
         end;
        end;
        {--------------------}

end ;

     procedure TPlayForm.compmove1;
    begin
    form2.Memo1.Lines.Add('normal comp is moving');
    for k:=0 to 2 do if CompMoveDone<>true then  begin
     if (game[k,0]=null) and (game[k,1]=game[k,2]) and (game[k,1]<>null)
      then    begin
       CompMoveDone:=true;
      if Form1.cb1.Checked=true then game[k,0]:=X else game[k,0]:=O;
      case k of
       0:if Form1.cb1.Checked=true then cross(PlayForm.Image1) else zero(PlayForm.Image1);
       1:if Form1.cb1.Checked=true then cross(PlayForm.Image2) else zero(PlayForm.Image2);
       2:if Form1.cb1.Checked=true then cross(PlayForm.Image3) else zero(PlayForm.Image3);
      end;
      form2.Memo1.Lines.Add('Normal move is done at '+inttostr(k)+';0');
                                     end    else
     if (game[k,1]=null) and (game[k,0]=game[k,2]) and (game[k,0]<>null)
      then  begin
      CompMoveDone:=true;
      if Form1.cb1.Checked=true then game[k,1]:=X else game[k,1]:=O;
      case k of
       0:if Form1.cb1.Checked=true then cross(PlayForm.Image4) else zero(PlayForm.Image4);
       1:if Form1.cb1.Checked=true then cross(PlayForm.Image5) else zero(PlayForm.Image5);
       2:if Form1.cb1.Checked=true then cross(PlayForm.Image6) else zero(PlayForm.Image6);
      end;
      form2.Memo1.Lines.Add('Normal move is done at '+inttostr(k)+';1');
                         end                else
     if (game[k,2]=null) and (game[k,1]=game[k,0]) and (game[k,1]<>null)
      then  begin
      CompMoveDone:=true;
      if Form1.cb1.Checked=true then game[k,2]:=X else game[k,2]:=O;
      case k of
       0:if Form1.cb1.Checked=true then cross(PlayForm.Image7) else zero(PlayForm.Image7);
       1:if Form1.cb1.Checked=true then cross(PlayForm.Image8) else zero(PlayForm.Image8);
       2:if Form1.cb1.Checked=true then cross(PlayForm.Image9) else zero(PlayForm.Image9);
      end;
      form2.Memo1.Lines.Add('Normal move is done at '+inttostr(k)+';2');
                   end                      else


   if (game[0,k]=null) and (game[1,k]=game[2,k]) and (game[1,k]<>null)
      then begin
      CompMoveDone:=true;
      if Form1.cb1.Checked=true then game[0,k]:=X else game[0,k]:=O;
      case k of
       0:if Form1.cb1.Checked=true then cross(PlayForm.Image1) else zero(PlayForm.Image1);
       1:if Form1.cb1.Checked=true then cross(PlayForm.Image4) else zero(PlayForm.Image4);
       2:if Form1.cb1.Checked=true then cross(PlayForm.Image7) else zero(PlayForm.Image7);
      end;
      form2.Memo1.Lines.Add('Normal move is done at 0;'+inttostr(k));
             end                            else
     if (game[1,k]=null) and (game[0,k]=game[2,k]) and (game[0,k]<>null)
      then begin
      CompMoveDone:=true;
      if Form1.cb1.Checked=true then game[1,k]:=X else game[1,k]:=O;
      case k of
       0:if Form1.cb1.Checked=true then cross(PlayForm.Image2) else zero(PlayForm.Image2);
       1:if Form1.cb1.Checked=true then cross(PlayForm.Image5) else zero(PlayForm.Image5);
       2:if Form1.cb1.Checked=true then cross(PlayForm.Image8) else zero(PlayForm.Image8);
      end;
       form2.Memo1.Lines.Add('Normal move is done at 1;'+inttostr(k));
             end                            else
     if (game[2,k]=null) and (game[1,k]=game[0,k]) and (game[1,k]<>null)
      then begin
      CompMoveDone:=true;
      if Form1.cb1.Checked=true then game[2,k]:=X else game[2,k]:=O;
      case k of
       0:if Form1.cb1.Checked=true then cross(PlayForm.Image3) else zero(PlayForm.Image3);
       1:if Form1.cb1.Checked=true then cross(PlayForm.Image6) else zero(PlayForm.Image6);
       2:if Form1.cb1.Checked=true then cross(PlayForm.Image9) else zero(PlayForm.Image9);
      end;
       form2.Memo1.Lines.Add('Normal move is done at 2;'+inttostr(k));
             end                            ;
                                         end;
    if CompMoveDone<>true then
    if (game[0,0]=null) and (game[1,1]=game[2,2]) and (game[1,1]<>null) then
    begin
     if Form1.cb1.Checked=true then game[0,0]:=X else game[0,0]:=O;
     if Form1.cb1.Checked=true then cross(PlayForm.Image1) else zero(PlayForm.Image1);
      form2.Memo1.Lines.Add('Normal move is done at 0;0');
     CompMoveDone:=true;
    end else
if (game[2,2]=null) and  (game[1,1]=game[0,0]) and (game[1,1]<>null) then
    begin
      if Form1.cb1.Checked=true then game[2,2]:=X else game[2,2]:=O;
      if Form1.cb1.Checked=true then cross(PlayForm.Image9) else zero(PlayForm.Image9);
       form2.Memo1.Lines.Add('Normal move is done at 2;2');
     CompMoveDone:=true;
     end else


     if (game[0,2]=null) and (game[1,1]=game[2,0]) and (game[1,1]<>null) then
     begin
      if Form1.cb1.Checked=true then game[0,2]:=X else game[0,2]:=O;
      if Form1.cb1.Checked=true then cross(PlayForm.Image7) else zero(PlayForm.Image7);
       form2.Memo1.Lines.Add('Normal move is done at 0;2');
     CompMoveDone:=true;
     end else
      if (game[2,0]=null) and (game[1,1]=game[0,2]) and (game[1,1]<>null) then
     begin
      if Form1.cb1.Checked=true then game[2,0]:=X else game[2,0]:=O;
      if Form1.cb1.Checked=true then cross(PlayForm.Image3) else zero(PlayForm.Image3);
       form2.Memo1.Lines.Add('Normal move is done at 2;0');
     CompMoveDone:=true;
     end else


     if (game[1,1]=null) and (((game[0,0]=game[2,2]) and (game[0,0]<>null))or
     ((game[0,2]=game[2,0]) and (game[0,2]<>null))) then begin
      if Form1.cb1.Checked=true then game[1,1]:=X else game[1,1]:=O;
      if Form1.cb1.Checked=true then cross(PlayForm.Image5) else zero(PlayForm.Image5);
       form2.Memo1.Lines.Add('Normal move is done at 1;1');
     CompMoveDone:=true;
     drawing;
     //wincheck;
     end else

     easycompmove;
        end;

     procedure TPlayForm.PoolCreate;
    begin
    form2.Memo1.Lines.Add('Hard comp is moving');
     for k:=0 to 2 do     //filling pool
      for g:=0 to 8 do
       pool[k,g]:=0;
       g:=0;
    for a:=0 to 2 do
     for b:=0 to 2 do begin
      pool[0,g]:=a;
      pool[1,g]:=b;
      g:=g+1;
     end;       //----------


    //base priority
    for k:=0 to 2 do
     for g:=0 to 2 do begin
      if (g<>1) and (k<>1) and ( (g=k) or (g+k=2) ) then PoolSearch(k,g,400);
      if (g+k) mod 2 = 1 then PoolSearch(k,g,200);
      if (g=k) and (g=1) then PoolSearch(k,g,500);       //correct
            end;

      //additional priority
      for k:=0 to 2 do   begin
     if (game[k,0]=null) and (game[k,1]=game[k,2]) and (game[k,1]<>null) then begin
      if Form1.cb1.Checked=true then begin
       if game[k,1]=O then PoolSearch(k,0,1000) else PoolSearch(k,0,2000) end else  begin
       if game[k,1]=X then PoolSearch(k,0,1000) else PoolSearch(k,0,2000) end;
     end;


     if (game[k,1]=null) and (game[k,0]=game[k,2]) and (game[k,0]<>null) then  begin
      if Form1.cb1.Checked=true then begin
       if game[k,0]=O then PoolSearch(k,1,1000) else PoolSearch(k,1,2000) end else  begin
       if game[k,0]=X then PoolSearch(k,1,1000) else PoolSearch(k,1,2000) end;
      end;


     if (game[k,2]=null) and (game[k,1]=game[k,0]) and (game[k,1]<>null) then  begin
      if Form1.cb1.Checked=true then begin
       if game[k,1]=O then PoolSearch(k,2,1000) else PoolSearch(k,2,2000) end else  begin
       if game[k,1]=X then PoolSearch(k,2,1000) else PoolSearch(k,2,2000) end;
      end;


   if (game[0,k]=null) and (game[1,k]=game[2,k]) and (game[1,k]<>null) then begin
    if Form1.cb1.Checked=true then begin
     if game[1,k]=O then PoolSearch(0,k,1000) else PoolSearch(0,k,2000) end else  begin
     if game[1,k]=X then PoolSearch(0,k,1000) else PoolSearch(0,k,2000) end;
      end;


     if (game[1,k]=null) and (game[0,k]=game[2,k]) and (game[0,k]<>null) then begin
      if Form1.cb1.Checked=true then begin
       if game[0,k]=O then PoolSearch(1,k,1000) else PoolSearch(1,k,2000) end else  begin
       if game[0,k]=X then PoolSearch(1,k,1000) else PoolSearch(1,k,2000) end;
        end;

     if (game[2,k]=null) and (game[1,k]=game[0,k]) and (game[1,k]<>null) then begin
      if Form1.cb1.Checked=true then begin
       if game[1,k]=O then PoolSearch(2,k,1000) else PoolSearch(2,k,2000) end else  begin
       if game[1,k]=X then PoolSearch(2,k,1000) else PoolSearch(2,k,2000) end;
        end;
                                         end;

    if (game[0,0]=null) and (game[1,1]=game[2,2]) and (game[1,1]<>null) then begin
     if Form1.cb1.Checked=true then begin
      if game[1,1]=O then PoolSearch(0,0,1000) else PoolSearch(0,0,2000) end else  begin
      if game[1,1]=X then PoolSearch(0,0,1000) else PoolSearch(0,0,2000) end;


    end ;
if (game[2,2]=null) and  (game[1,1]=game[0,0]) and (game[1,1]<>null) then begin
      if Form1.cb1.Checked=true then   begin
       if game[1,1]=O then PoolSearch(2,2,1000) else PoolSearch(2,2,2000) end else  begin
       if game[1,1]=X then PoolSearch(2,2,1000) else PoolSearch(2,2,2000) end;
         end;




     if (game[0,2]=null) and (game[1,1]=game[2,0]) and (game[1,1]<>null) then
     begin
      if Form1.cb1.Checked=true then begin
       if game[1,1]=O then PoolSearch(0,2,1000) else PoolSearch(0,2,2000) end else  begin
       if game[1,1]=X then PoolSearch(0,2,1000) else PoolSearch(0,2,2000) end;


     end ;
      if (game[2,0]=null) and (game[1,1]=game[0,2]) and (game[1,1]<>null) then
     begin
      if Form1.cb1.Checked=true then begin
       if game[1,1]=O then PoolSearch(2,0,1000) else PoolSearch(2,0,2000) end else  begin
       if game[1,1]=X then PoolSearch(2,0,1000) else PoolSearch(2,0,2000) end;

     end ;


     if (game[1,1]=null) and (game[0,0]=game[2,2]) and (game[0,0]<>null) then begin
      if Form1.cb1.Checked=true then begin
       if game[0,0]=O then PoolSearch(1,1,1000) else PoolSearch(1,1,2000) end else  begin
       if game[0,0]=X then PoolSearch(1,1,1000) else PoolSearch(1,1,2000) end;

     end;

      if (game[1,1]=null) and (game[2,0]=game[0,2]) and (game[2,0]<>null) then begin
      if Form1.cb1.Checked=true then begin
       if game[2,0]=O then PoolSearch(1,1,1000) else PoolSearch(1,1,2000) end else  begin
       if game[2,0]=X then PoolSearch(1,1,1000) else PoolSearch(1,1,2000) end;

     end;


     //-----------------



     end;

     procedure TPlayForm.VersPoolSearch;
         begin
           d:=0;
           Form2.Memo1.Lines.Add('Looking for the highest priority...');
           for c:=0 to 8 do begin
            if d<pool[2,c] then d:=pool[2,c];
           end;
           Form2.Memo1.Lines.Add('The highest priority is '+inttostr(d));

     Form2.Memo1.Lines.Add('Coordinate output...');
       repeat
         for c:=0 to 8 do begin
          if pool[2,c]=d then begin
           if (random(1000) mod 20=0) then  begin
            x1:=pool[0,c];
            y:=pool[1,c];
            Form2.Memo1.Lines.Add('X='+IntToStr(x1)+' Y='+IntToStr(y)+'. Prioriry is '+IntToStr(d));
            CompMoveDone:=true;
            Form2.Memo1.Lines.Add('Cicle is finished with C='+IntToStr(c));
            Break;
           end;
          end;
         end;
        until CompMoveDone=true;


         end;

      procedure TPlayForm.compmove2;
    begin
      PoolCreate;
      VersPoolSearch;
      if form1.cb1.Checked=false then game[x1,y]:=O else game[x1,y]:=X;
      case inttostr(y) of
          '0': if 0=0 then case x1 of
           0:if Form1.cb1.Checked=true then cross(PlayForm.Image1) else zero(PlayForm.Image1);
           1:if Form1.cb1.Checked=true then cross(PlayForm.Image2) else zero(PlayForm.Image2);
           2:if Form1.cb1.Checked=true then cross(PlayForm.Image3) else zero(PlayForm.Image3);
            end;
          '1':if 0=0 then case x1 of
           0:if Form1.cb1.Checked=true then cross(PlayForm.Image4) else zero(PlayForm.Image4);
           1:if Form1.cb1.Checked=true then cross(PlayForm.Image5) else zero(PlayForm.Image5);
           2:if Form1.cb1.Checked=true then cross(PlayForm.Image6) else zero(PlayForm.Image6);

          end;
          '2':if 0=0 then case x1 of
           0:if Form1.cb1.Checked=true then cross(PlayForm.Image7) else zero(PlayForm.Image7);
           1:if Form1.cb1.Checked=true then cross(PlayForm.Image8) else zero(PlayForm.Image8);
           2:if Form1.cb1.Checked=true then cross(PlayForm.Image9) else zero(PlayForm.Image9);

          end; end;
      drawing;
      //wincheck;
        end;

     procedure TPlayForm.compmove3;
    begin
     Form2.Memo1.Lines.Add('Undefetable comp is moving...');
     if Form1.Cb1.Checked<>true then begin
      PoolCreate;
       if game[1,1]=O then begin
        d:=0;
        for g:=0 to 2 do
         for k:=0 to 2 do
          if game[k,g]<>null then d:=d+1;
        if d=3 then begin
         if ((game[0,0]=X) and (game[2,2]=X)) or ((game[0,2]=X) and (game[2,0]=X)) then
        begin
         PoolSearch(0,0,-1000);
         PoolSearch(2,0,-1000);
         PoolSearch(0,2,-1000);
         PoolSearch(2,2,-1000);
        end else

        if game[1,0]=X then begin
         if (game[2,1]=X) or (game[2,2]=X) then PoolSearch(0,2,-1000) else
         if (game[0,1]=X) or (game[0,2]=X) then PoolSearch(2,2,-1000)
        end else
        if game[2,1]=X then begin
         if (game[1,0]=X) or (game[0,0]=X) then PoolSearch(0,2,-1000) else
         if (game[0,2]=X) or (game[0,1]=X) then PoolSearch(2,2,-1000)
        end else
        if game[1,2]=X then begin
         if (game[0,0]=X) or (game[0,1]=X) then PoolSearch(2,0,-1000) else
         if (game[2,0]=X) or (game[2,1]=X) then PoolSearch(2,2,-1000)
        end else
        if game[0,1]=X then begin
         if (game[1,0]=X) or (game[2,0]=X) then PoolSearch(2,2,-1000) else
         if (game[1,2]=X) or (game[2,2]=X) then PoolSearch(2,0,-1000)
        end;
       end;
         end;

      VersPoolSearch;
      game[x1,y]:=O;
      case inttostr(y) of
          '0': if 0=0 then case x1 of
           0:if Form1.cb1.Checked=true then cross(PlayForm.Image1) else zero(PlayForm.Image1);
           1:if Form1.cb1.Checked=true then cross(PlayForm.Image2) else zero(PlayForm.Image2);
           2:if Form1.cb1.Checked=true then cross(PlayForm.Image3) else zero(PlayForm.Image3);
            end;
          '1':if 0=0 then case x1 of
           0:if Form1.cb1.Checked=true then cross(PlayForm.Image4) else zero(PlayForm.Image4);
           1:if Form1.cb1.Checked=true then cross(PlayForm.Image5) else zero(PlayForm.Image5);
           2:if Form1.cb1.Checked=true then cross(PlayForm.Image6) else zero(PlayForm.Image6);

          end;
          '2':if 0=0 then case x1 of
           0:if Form1.cb1.Checked=true then cross(PlayForm.Image7) else zero(PlayForm.Image7);
           1:if Form1.cb1.Checked=true then cross(PlayForm.Image8) else zero(PlayForm.Image8);
           2:if Form1.cb1.Checked=true then cross(PlayForm.Image9) else zero(PlayForm.Image9);

          end; end;
      drawing;
        end else compmove2;
     end;



     procedure TPlayForm.PoolSearch(x1,y,add:integer);
begin
   form2.Memo1.Lines.Add('Adding priority...');
   if game[x1,y]=null then begin
    for c:=0 to 8 do  begin
     if (pool[0,c]=x1) and (pool[1,c]=y) then pool[2,c]:=pool[2,c]+add;
    end;
    Form2.Memo1.Lines.Add('Priority addind if finished.');
   end else for c:=0 to 8 do  begin
     if (pool[0,c]=x1) and (pool[1,c]=y) then pool[2,c]:=0;
    end;
   for c:=0 to 8 do
    if (pool[2,c]<0) then pool[2,c]:=0;
end;


procedure TPlayForm.block;
begin
   PlayForm.Image1.Enabled:=false;
   PlayForm.Image2.Enabled:=false;
   PlayForm.Image3.Enabled:=false;
   PlayForm.Image4.Enabled:=false;
   PlayForm.Image5.Enabled:=false;
   PlayForm.Image6.Enabled:=false;
   PlayForm.Image7.Enabled:=false;
   PlayForm.Image8.Enabled:=false;
   PlayForm.Image9.Enabled:=false;

   PlayForm.Button3.Visible:=true;

    if Winner=X then  begin
     form2.Memo1.Lines.Add('Game is finished. Cross Won.');
    PlayForm.label4.Caption:=inttostr(StrToInt(PlayForm.label4.Caption)+1);
     if pvp=false then
      if Form1.cb1.Checked=true then begin
       score:=score-5*(CompDif+1);
      end
     else  begin
      score:=score+5*sqr(CompDif+1);
      //if (strtoint(PlayForm.Label4.Caption)>=StrToInt(PlayForm.Label5.Caption)+10+random(6)) then
      //if  CompDif<4 then CompDif:=CompDif+1;
     end;
   end else
   if Winner=O then begin
   form2.Memo1.Lines.Add('Game is finished. Zero Won.');
    PlayForm.label5.Caption:=inttostr(StrToInt(PlayForm.label5.Caption)+1);
      if pvp=false then
      if Form1.cb1.Checked=true then begin
       score:=score+5*sqr(CompDif+1)  ;
       //if (strtoint(PlayForm.Label5.Caption)>=StrToInt(PlayForm.Label4.Caption)+10+random(6)) then
      //if  CompDif<4 then CompDif:=CompDif+1;
      end
     else    score:=score-5*(CompDif+1);
   end else form2.Memo1.Lines.Add('Game is finished with no winner.');
   if score<0 then score:=0;
end;

procedure TPlayForm.Button3Click(Sender: TObject);
begin
   for k:=0 to 2  do
    for g:=0 to 2 do game[k,g]:=null;
      Winner:=null;
   PlayForm.Image1.Enabled:=true;
   PlayForm.Image2.Enabled:=true;
   PlayForm.Image3.Enabled:=true;
   PlayForm.Image4.Enabled:=true;
   PlayForm.Image5.Enabled:=true;
   PlayForm.Image6.Enabled:=true;
   PlayForm.Image7.Enabled:=true;
   PlayForm.Image8.Enabled:=true;
   PlayForm.Image9.Enabled:=true;

   PlayForm.Image1.Picture.LoadFromFile('nully.png');
   PlayForm.Image2.Picture.LoadFromFile('nully.png');
   PlayForm.Image3.Picture.LoadFromFile('nully.png');
   PlayForm.Image4.Picture.LoadFromFile('nully.png');
   PlayForm.Image5.Picture.LoadFromFile('nully.png');
   PlayForm.Image6.Picture.LoadFromFile('nully.png');
   PlayForm.Image7.Picture.LoadFromFile('nully.png');
   PlayForm.Image8.Picture.LoadFromFile('nully.png');
   PlayForm.Image9.Picture.LoadFromFile('nully.png');
      PlayForm.Button3.Visible:=false;
    if (Form1.Cb1.Checked=true) and (pvp=false) then begin
     case CompDif of
      0:easycompmove;
      1:compmove1;
      2:compmove2;
      3:compmove2;
     end;
    end;



end;

procedure TPlayForm.Button4Click(Sender: TObject);
begin
   Form2.Memo1.Lines.Add('---------');
   for k:=0 to 2 do
for g:=0 to 2 do
  case  game[k,g] of
    X:Form2.Memo1.Lines.Add('Symbol X at '+inttostr(k)+';'+inttostr(g));
    O:Form2.Memo1.Lines.Add('Symbol O at '+inttostr(k)+';'+inttostr(g));
    null:Form2.Memo1.Lines.Add('No Symbol at '+inttostr(k)+';'+inttostr(g));
  // easycompmove;

  end;
   Form2.Memo1.Lines.Add('---------');
end;

procedure TPlayForm.Button5Click(Sender: TObject);
begin
  easycompmove;
end;

procedure TPlayForm.Button6Click(Sender: TObject);
begin
  drawing;
end;

procedure TPlayForm.Button7Click(Sender: TObject);
begin
   form2.Show;
   //PlayForm.Button4.Visible:=true;
   //PlayForm.Button5.Visible:=true;
   //PlayForm.Button6.Visible:=true;
   //PlayForm.Button8.Visible:=true;
end;





procedure TPlayForm.Button8Click(Sender: TObject);
begin
  Form2.Memo1.Lines.Add('Score='+inttostr(score));
end;

procedure TPlayForm.Button9Click(Sender: TObject);
begin
  wincheck;
end;





procedure TPlayForm.Label2DblClick(Sender: TObject);
begin
   Form2.Show;
   PlayForm.Label2.Enabled:=False;
end;




procedure TPlayForm.wincheck;
begin

  Form2.Memo1.Lines.Add('---------');
 Form2.Memo1.Lines.Add('Looking for a winner...');
 Form2.Memo1.Lines.Add('built freecheck started');
 freecheck;
 Form2.Memo1.Lines.Add('built freecheck finished');
  if (game[0,0]=game[0,1]) and (game[0,0]=game[0,2]) and (game[0,0]<>null) then
        begin
         Form2.Memo1.Lines.Add('Line found at 0;0, 0;1 and 0;2');
         Winner:=game[0,0];
         block;
        end else
  if (game[1,0]=game[1,1]) and (game[1,0]=game[1,2]) and (game[1,0]<>null) then
      begin
       Form2.Memo1.Lines.Add('Line found at 1;0, 1;1 and 1;2');
         Winner:=game[1,0];
         block;
        end else
  if (game[2,0]=game[2,1]) and (game[2,0]=game[2,2]) and (game[2,0]<>null) then
       begin
        Form2.Memo1.Lines.Add('Line found at 2;0, 2;1 and 2;2');
         Winner:=game[2,0];
         block;
        end else
  if (game[0,0]=game[1,0]) and (game[0,0]=game[2,0]) and (game[0,0]<>null) then
        begin
         Form2.Memo1.Lines.Add('Line found at 0;0, 1;0 and 2;0');
         Winner:=game[0,0];
         block;
        end else
  if (game[0,1]=game[1,1]) and (game[0,1]=game[2,1]) and (game[0,1]<>null) then
         begin
          Form2.Memo1.Lines.Add('Line found at 0;1, 1;1 and 2;1');
         Winner:=game[0,1];
         block;
        end else
  if (game[0,2]=game[1,2]) and (game[0,2]=game[2,2]) and (game[0,2]<>null) then
        begin
        Form2.Memo1.Lines.Add('Line found at 0;2, 1;2 and 2;2');
         Winner:=game[0,2];
         block;
        end else
  if (game[0,0]=game[1,1]) and (game[0,0]=game[2,2]) and (game[0,0]<>null) then
        begin
         Form2.Memo1.Lines.Add('Line found at 0;0, 1;1 and 2;2');
         Winner:=game[0,0];
         block;
        end else
  if (game[2,0]=game[1,1]) and (game[2,0]=game[0,2]) and (game[2,0]<>null) then
        begin
         Form2.Memo1.Lines.Add('Line found at 2;0, 1;1 and 0;2');
         Winner:=game[2,0];
         block;
        end else Form2.Memo1.Lines.Add('Lines are not found');
        Form2.Memo1.Lines.Add('Looking for a winner complete.');
        Form2.Memo1.Lines.Add('---------');

end;

end.

