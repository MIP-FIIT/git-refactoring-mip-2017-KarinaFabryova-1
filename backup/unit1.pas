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

type ziak = record
       meno: string;
       znamky: array[1..7] of integer;
       priemer: real;
       prospech: string;
       end;

var
  Form1: TForm1;
  ziaci: array[1..100] of ziak;
  pocet_znamok: integer;
  i: integer;
  j: integer;
  sucet: integer;
  max: integer;
  t: text;
  riadok: string;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.FormCreate(Sender: TObject);
begin
  AssignFile(t,'znamky.txt');
  Reset(t);
  pocet_znamok:=0;
  while not eof(t) do
        begin
          pocet_znamok:=pocet_znamok+1;
          for i:=1 to 7 do Read(t,ziaci[pocet_znamok].znamky[i]);
          ReadLn(t,ziaci[pocet_znamok].meno);
        end;
  for i:=1 to pocet_znamok do
        begin
          riadok:=ziaci[i].meno;
          sucet:=0;
          max:=ziaci[i].znamky[2];
          for j:=2 to 7 do
                begin
                  sucet:=sucet+ziaci[i].znamky[j];
                  if ziaci[i].znamky[j]>max then max:=ziaci[i].znamky[j];
                  riadok:=riadok+' '+IntToStr(ziaci[i].znamky[j]);
                end;
          ziaci[i].priemer:=sucet/6;
          riadok:=riadok+' priemer: '+FloatToStr(ziaci[i].priemer);
          if (ziaci[i].znamky[1]=1) and (ziaci[i].priemer<=1.5) and (max<3)
             then ziaci[i].prospech:='PV'
             else if (ziaci[i].znamky[1]=1) and (ziaci[i].priemer<=2) and (max<4)
                then ziaci[i].prospech:='PVD'
                else if max<5 then ziaci[i].prospech:='P'
                              else ziaci[i].prospech:='N';
          riadok:=riadok+' prospech: '+ziaci[i].prospech;
          Memo1.Lines.Add(riadok);
        end;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Memo1.Clear;
  for i:=1 to pocet_znamok do if ziaci[i].prospech='PV' then
        begin
          riadok:=ziaci[i].meno;
          for j:=2 to 7 do riadok:=riadok+' '+IntToStr(ziaci[i].znamky[j]);
          riadok:=riadok+' priemer: '+FloatToStr(ziaci[i].priemer);
          riadok:=riadok+' prospech: '+ziaci[i].prospech;
          Memo1.Lines.Add(riadok);
        end;
  for i:=1 to pocet_znamok do if ziaci[i].prospech='PVD' then
        begin
          riadok:=ziaci[i].meno;
          for j:=2 to 7 do riadok:=riadok+' '+IntToStr(ziaci[i].znamky[j]);
          riadok:=riadok+' priemer: '+FloatToStr(ziaci[i].priemer);
          riadok:=riadok+' prospech: '+ziaci[i].prospech;
          Memo1.Lines.Add(riadok);
        end;
  for i:=1 to pocet_znamok do if ziaci[i].prospech='P' then
        begin
          riadok:=ziaci[i].meno;
          for j:=2 to 7 do riadok:=riadok+' '+IntToStr(ziaci[i].znamky[j]);
          riadok:=riadok+' priemer: '+FloatToStr(ziaci[i].priemer);
          riadok:=riadok+' prospech: '+ziaci[i].prospech;
          Memo1.Lines.Add(riadok);
        end;
  for i:=1 to pocet_znamok do if ziaci[i].prospech='N' then
        begin
          riadok:=ziaci[i].meno;
          for j:=2 to 7 do riadok:=riadok+' '+IntToStr(ziaci[i].znamky[j]);
          riadok:=riadok+' priemer: '+FloatToStr(ziaci[i].priemer);
          riadok:=riadok+' prospech: '+ziaci[i].prospech;
          Memo1.Lines.Add(riadok);
        end;
end;

end.

