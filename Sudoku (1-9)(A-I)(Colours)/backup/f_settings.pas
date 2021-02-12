unit f_settings;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids;

type

  { TForm_Settings }

  TForm_Settings = class(TForm)
    But_Both_Grids: TButton;
    CheBox_Both_Grids: TCheckBox;
    CheBox_Menu_Grids: TCheckBox;
    GroBox_Number_Or_Character_Grid: TGroupBox;
    GroBox_Settings_Menu: TGroupBox;
    Lab_Both_Grids: TLabel;
    StrGri_1_to_9_Grid: TStringGrid;
    StrGri_Character_Grid: TStringGrid;
    StrGri_Select_1_to_9_Grid: TStringGrid;
    StrGri_Select_Character_Grid: TStringGrid;



  private

  public
    procedure P_ReadFromMenuItems_Characters_Or_Alternative_Grid
            ( PStr_FileName : string;  var PStr_Characters_Or_Alternative_Grid : string );

    procedure P_Alter_Setting_Grids (
                                           PStr_Menu_Item_Characters : string );
  end;

var
  Form_Settings: TForm_Settings;

   GStr_Menu_Item_Characters   ,  GStr_Menu_Item_Alternative_Grid: string;
implementation
uses f_sudoku;
{$R *.lfm}

procedure  TForm_Settings.P_ReadFromMenuItems_Characters_Or_Alternative_Grid
            ( PStr_FileName : string;  var PStr_Characters_Or_Alternative_Grid : string );
var
  LStr_FileName    : string;
  LTexFil_FileName : TextFile;
begin
  LStr_FileName := GetCurrentDir + '\Menu_Items\' + PStr_FileName;

  AssignFile(LTexFil_FileName,LStr_FileName);
  Reset(LTexFil_FileName);

  while not Eof(LTexFil_FileName) do
    ReadLn(LTexFil_FileName,PStr_Characters_Or_Alternative_Grid  );

   CloseFile (LTexFil_FileName);


end; // P_ReadFromMenuItems_Characters_Or_New_Grid   //

procedure TForm_Settings.P_Alter_Setting_Grids (
                                           PStr_Menu_Item_Characters : string );
begin
  if ( PStr_Menu_Item_Characters = booltostr(False) )
    then
      begin
        Form_Settings                  .Height  := 449;
        Form_Settings                  .Width   := 319;

        GroBox_Settings_Menu           .Width   := 256;
        GroBox_Number_Or_Character_Grid.Width   := 256;

        StrGri_1_to_9_Grid             .Top     := 32;
        StrGri_Select_1_to_9_Grid      .Top     := 248;

        CheBox_Both_Grids              .Checked := False;
        Lab_Both_Grids                 .Caption := 'Numbers Only';

        But_Both_Grids                 .Top     := 304;
        But_Both_Grids                 .Left    := 95;

      end // PStr_Menu_Item_Characters = booltostr(False) //
    else
      begin
        Form_Settings                  .Height  := 449;
        Form_Settings                  .Width   := 548;

        GroBox_Settings_Menu           .Width   := 490;
        GroBox_Number_Or_Character_Grid.Width   := 490;

        CheBox_Menu_Grids              .Caption := 'Number Grid';

        CheBox_Both_Grids              .Checked := True;
        Lab_Both_Grids                 .Caption := 'Both Number and Character Grids';
        But_Both_Grids                 .Left    := 208;

      end; // PStr_Menu_Item_Characters = booltostr(True) //

end; // P_Alter_Setting_Grids //
end.

