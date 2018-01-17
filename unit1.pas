unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private

  public

  end;

type z = record
       name: string;
       znamky: array[1..7] of integer;
       priemer: real;
       prospech: string;
       end;

var
  Form1: TForm1;
  ziaci: array[1..100] of z;
  pz, i, j, s, m: integer;
  t: text;
  r: string;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  AssignFile(t,'znamky.txt');
  Reset(t);
  pz:=0;
  while not eof(t) do
        begin
          pz:=pz+1;
          for i:=1 to 7 do Read(t,ziaci[pz].znamky[i]);
          ReadLn(t,ziaci[pz].name);
        end;
  for i:=1 to pz do
        begin
          r:=ziaci[i].name;
          s:=0;
          m:=ziaci[i].znamky[2];
          for j:=2 to 7 do
                begin
                  s:=s+ziaci[i].znamky[j];
                  if ziaci[i].znamky[j]>m then m:=ziaci[i].znamky[j];
                  r:=r+' '+IntToStr(ziaci[i].znamky[j]);
                end;
          ziaci[i].priemer:=s/6;
          r:=r+' priemer: '+FloatToStr(ziaci[i].priemer);
          if (ziaci[i].znamky[1]=1) and (ziaci[i].priemer<=1.5) and (m<3)
             then ziaci[i].prospech:='PV'
             else if (ziaci[i].znamky[1]=1) and (ziaci[i].priemer<=2) and (m<4)
                then ziaci[i].prospech:='PVD'
                else if m<5 then ziaci[i].prospech:='P'
                              else ziaci[i].prospech:='N';
          r:=r+' prospech: '+ziaci[i].prospech;
          Memo1.Lines.Add(r);
        end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Memo1.Clear;
  for i:=1 to pz do if ziaci[i].prospech='PV' then
        begin
          r:=ziaci[i].name;
          for j:=2 to 7 do r:=r+' '+IntToStr(ziaci[i].znamky[j]);
          r:=r+' priemer: '+FloatToStr(ziaci[i].priemer);
          r:=r+' prospech: '+ziaci[i].prospech;
          Memo1.Lines.Add(r);
        end;
  for i:=1 to pz do if ziaci[i].prospech='PVD' then
        begin
          r:=ziaci[i].name;
          for j:=2 to 7 do r:=r+' '+IntToStr(ziaci[i].znamky[j]);
          r:=r+' priemer: '+FloatToStr(ziaci[i].priemer);
          r:=r+' prospech: '+ziaci[i].prospech;
          Memo1.Lines.Add(r);
        end;
  for i:=1 to pz do if ziaci[i].prospech='P' then
        begin
          r:=ziaci[i].name;
          for j:=2 to 7 do r:=r+' '+IntToStr(ziaci[i].znamky[j]);
          r:=r+' priemer: '+FloatToStr(ziaci[i].priemer);
          r:=r+' prospech: '+ziaci[i].prospech;
          Memo1.Lines.Add(r);
        end;
  for i:=1 to pz do if ziaci[i].prospech='N' then
        begin
          r:=ziaci[i].name;
          for j:=2 to 7 do r:=r+' '+IntToStr(ziaci[i].znamky[j]);
          r:=r+' priemer: '+FloatToStr(ziaci[i].priemer);
          r:=r+' prospech: '+ziaci[i].prospech;
          Memo1.Lines.Add(r);
        end;
end;

end.

