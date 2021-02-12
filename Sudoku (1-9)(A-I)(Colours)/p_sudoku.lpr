program p_sudoku;

{$mode objfpc}{$H+}

uses
  {$IFDEF UNIX}{$IFDEF UseCThreads}
  cthreads,
  {$ENDIF}{$ENDIF}
  Interfaces, // this includes the LCL widgetset
  Forms, f_sudoku, f_alternative_grid;

{$R *.res}

begin
  RequireDerivedFormResource:=True;
  Application.Scaled:=True;
  Application.Initialize;
  Application.CreateForm(TForm_Sudoku, Form_Sudoku);
  Application.CreateForm(TForm_AlternativeGrid, Form_AlternativeGrid);
  Application.Run;
end.

