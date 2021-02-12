unit f_new_grid;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Grids;



type

  { TFor_NewGrid }

  TFor_NewGrid = class(TForm)
    GroBox_CharacterGrid         : TGroupBox;
      GroBox_A_to_I_Characters   : TGroupBox;
        RadBut_A_to_I_Characters : TRadioButton;
        Edi_A_to_I_Characters    : TEdit;
        StrGri_A_to_I_Characters : TStringGrid;
        But_A_to_I_OK            : TButton;

      GroBox_AlternativeCharacter     : TGroupBox;
        RadBut_Alternative_Characters : TRadioButton;
        Edi_Alternative_Characters    : TEdit;
        StrGri_Alternative_Characters : TStringGrid;
        But_Alternative_OK            : TButton;


    procedure RadBut_A_to_I_CharactersClick(Sender: TObject);
    procedure But_A_to_I_OKClick           (Sender: TObject);

    procedure RadBut_Alternative_CharactersClick (Sender: TObject);
    procedure Edi_Alternative_CharactersKeyPress(Sender: TObject; var Key: char
      );

    procedure But_Alternative_OKClick(Sender: TObject);





    procedure P_PutCharactersInToStringGrid ( PStrGri_DefaultCharacters : TStringGrid;
                                              PCha_Character            : char );

    procedure P_EmptyGrid ( PStrGri_EmptyGrid : TStringGrid );

    procedure P_WriteToTextFile ( PStr_FileName : string;
                                  PStr_FirstAndLastCharacters: String );

    procedure P_ReadFromTextFile ( PStr_FileName : string;
                                  var PStr_FirstAndLastCharacters: String );



  private

  public
    GBoo_DefaultCharacter , GBoo_AlterCharacter : Boolean;
    GArrSinStr_Characters : array [1..9] of String;
  end;
const
  G_DEFAULT_CHARACTER = 'A';
  G_BACKSPACE = #8; G_RETURN = #13; G_ESCAPE = #27; G_SPACE = #32;
var
  For_NewGrid: TFor_NewGrid;

  GStr_FirstAndLastCharacters : String;


implementation
uses f_sudoku;
{$R *.lfm}

{ TFor_NewGrid }

procedure TFor_NewGrid.RadBut_A_to_I_CharactersClick(Sender: TObject);
begin

  RadBut_A_to_I_Characters      .Checked := True;
  RadBut_Alternative_Characters .Checked := False;

  P_PutCharactersInToStringGrid ( StrGri_A_to_I_Characters,
                                  G_DEFAULT_CHARACTER ); // 'A' //


  But_A_to_I_OK        .Enabled:=true;

end; // RadBut_A_to_I_Characters //

procedure TFor_NewGrid.But_A_to_I_OKClick(Sender: TObject);
begin
  P_PutCharactersInToStringGrid ( StrGri_A_to_I_Characters,
                                  'A');

  GStr_FirstAndLastCharacters := StrGri_A_to_I_Characters.Cells[1,1] + ' ' +
                                 StrGri_A_to_I_Characters.Cells[9,1];



  P_WriteToTextFile ( 'FirstAndLastCharacters.txt',
                       GStr_FirstAndLastCharacters);



  RadBut_A_to_I_Characters.Checked := false;
  But_A_to_I_OK           .Enabled:=false;

  P_EmptyGrid ( StrGri_A_to_I_Characters);

  Form_Sudoku.Show;

end; // But_A_to_I_OK //

procedure TFor_NewGrid.RadBut_Alternative_CharactersClick(Sender: TObject);
begin

  Edi_Alternative_Characters.Enabled:=true;
  Edi_Alternative_Characters.SetFocus;

end; // RadBut_Alternative_Characters //


procedure TFor_NewGrid.Edi_Alternative_CharactersKeyPress(Sender: TObject;
  var Key: char);
begin
    if key in [G_BACKSPACE,G_RETURN,G_ESCAPE,G_SPACE,'0'..'9','A','a']
     then
       begin
         key := #0;
         P_EmptyGrid ( StrGri_Alternative_Characters );
       end
     else
       P_PutCharactersInToStringGrid ( StrGri_Alternative_Characters, upcase(Key)) ;

   But_Alternative_OK.enabled := true;

end;

procedure TFor_NewGrid.But_Alternative_OKClick(Sender: TObject);
begin

    GStr_FirstAndLastCharacters := StrGri_Alternative_Characters.Cells[1,1] +
                                   StrGri_Alternative_Characters.Cells[9,1];


    P_WriteToTextFile ( 'FirstAndLastCharacters.txt',
                         GStr_FirstAndLastCharacters);

     f_sudoku.Form_Sudoku.MenuItem_Select_Char.Caption := '( ' +
                         GStr_FirstAndLastCharacters[1] + ' - ' +
                         GStr_FirstAndLastCharacters[2] + ' )';


    For_Sudoku.Show;
end; // But_Alternative_OK //

{ ************************************* }
{                  Start                }
{ User Defined Procedures and Functions }
{ ************************************* }

procedure TFor_NewGrid.P_PutCharactersInToStringGrid (
                                       PStrGri_DefaultCharacters : TStringGrid;
                                       PCha_Character            : char );
var
  LArrSinStr_Characters : array [1..9] of string;
  LByt_Ascii,LByt_AsciiLoop : byte;


begin
  with PStrGri_DefaultCharacters do
    begin
      LByt_Ascii := ord( PCha_Character )-1;

      for LByt_AsciiLoop := 1 to 9 do
        begin
          LByt_Ascii := LByt_Ascii + 1;
          LArrSinStr_Characters[LByt_AsciiLoop] := chr(LByt_Ascii);
        end; // LByt_AsciiLoop //

      for LByt_AsciiLoop := 1 to 9 do
        Cells[LByt_AsciiLoop,1] := LArrSinStr_Characters[LByt_AsciiLoop]
    end; // with PStrGri_DefaultCharacters //

  GStr_FirstAndLastCharacters := LArrSinStr_Characters[1] + ' ' +
                                 LArrSinStr_Characters[9];

end; // P_PutCharactersInToStringGrid //

procedure TFor_NewGrid.P_EmptyGrid ( PStrGri_EmptyGrid : TStringGrid );
const
  L_EMPTY_CELL = '';
var
   LByt_Across, LByt_Down : byte;
begin
  with PStrGri_EmptyGrid do
    begin
      if VisibleRowCount = 1
        then
          for LByt_Across := 1 to 9 do
           cells[LByt_Across,1] := L_EMPTY_CELL
        else
           for LByt_Across := 1 to 9 do
             for LByt_Down := 1 to 9 do
               cells[LByt_Down,LByt_Across] := L_EMPTY_CELL;

    end; // with PStrGri_EmptyGrid //

end; // P_EmptyGrid //

procedure TFor_NewGrid.P_WriteToTextFile ( PStr_FileName : string;
                                          PStr_FirstAndLastCharacters: String );
var
  LStr_FileName    : string;
  LTexFil_FileName : TextFile;
begin
  LStr_FileName := GetCurrentDir + '\Data\' +PStr_FileName;

  AssignFile(LTexFil_FileName,LStr_FileName);
  ReWrite (LTexFil_FileName);
  WriteLn (LTexFil_FileName, PStr_FirstAndLastCharacters);
  CloseFile (LTexFil_FileName);

end; // P_WriteToTextFile //

procedure TFor_NewGrid.P_ReadFromTextFile ( PStr_FileName : string;
                                            var PStr_FirstAndLastCharacters: String );
var
  LStr_FileName    : string;
  LTexFil_FileName : TextFile;
begin
  LStr_FileName := GetCurrentDir + '\Data\' +PStr_FileName;

  AssignFile(LTexFil_FileName,LStr_FileName);
  Reset(LTexFil_FileName);

  while not Eof(LTexFil_FileName) do
    ReadLn(LTexFil_FileName,PStr_FirstAndLastCharacters);

   CloseFile (LTexFil_FileName);



end; // P_ReadFromTextFile  //







end.

