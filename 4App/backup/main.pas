unit Main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    PaintBox1: TPaintBox;
    procedure PaintBox1Paint(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.PaintBox1Paint(Sender: TObject);

var
  counter1, counter2, EllipseHeight, EllipseWidth: integer;

begin

  PaintBox1.Canvas.Brush.Color := clBlack;
  PaintBox1.Canvas.Rectangle(1, 1, PaintBox1.Width, PaintBox1.Height);
  PaintBox1.Canvas.Brush.Color := clWhite;
  EllipseHeight := PaintBox1.Height div 5;
  EllipseWidth := PaintBox1.Width div 6;
  for counter1 := 1 to 6 do
    for counter2 := 1 to 5 do
      PaintBox1.Canvas.Ellipse(EllipseWidth * (counter1 - 1) + 5,
        EllipseHeight * (counter2 - 1) + 5,
        EllipseWidth * counter1, EllipseHeight * counter2);
  //Coordenadas do ponto do canto superior esq (1,1) e do canto inf direito(50,50)

end;

end.
