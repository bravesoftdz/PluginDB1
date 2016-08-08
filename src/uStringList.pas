unit uStringList;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs, StdCtrls;

type
  TfStringList = class(TForm)
    mmValores: TMemo;
    procedure FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
  private
    procedure SetTextoLista(Value: string);
  public
    property TextoLista: string write SetTextoLista;
  end;

var
  fStringList: TfStringList;

implementation

{$R *.DFM}

procedure TfStringList.FormKeyDown(Sender: TObject; var Key: word; Shift: TShiftState);
begin
  if Key = VK_ESCAPE then
  begin
    Close;
  end;
end;

procedure TfStringList.SetTextoLista(Value: string);
var
  sTextoFormatado: string;
begin
  sTextoFormatado := StringReplace(Value, '#$D#$A', #13, [rfReplaceAll]);
  sTextoFormatado := StringReplace(sTextoFormatado, #39, EmptyStr, [rfReplaceAll]);
  mmValores.Lines.Text := sTextoFormatado;
end;

end.

