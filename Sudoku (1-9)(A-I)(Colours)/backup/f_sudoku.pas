unit f_sudoku;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, StdCtrls,
  Math, Grids, LazStringUtils, Types, Windows, UITypes;

type

  { TForm_Sudoku }

  TForm_Sudoku = class(TForm)
    But_New_Puzzle: TButton;
    CheBox_Show_Solution: TCheckBox;
    ComBox_BMA: TComboBox;
    Label4: TLabel;
    Lab_DifficultyRating: TLabel;
  { -----------------------------------------}
    MainMenu_Sudoku : TMainMenu;
    Memo1: TMemo;
    Memo_Ratings: TMemo;
    MenuItem1: TMenuItem;
    MenuItem_Select_Colours: TMenuItem;
    MenuItem_Settings_Colours: TMenuItem;
    MenuItem_Settings_New_Grid: TMenuItem;
    MenuItem_New_Grid: TMenuItem;
    MenuItem_Settings_Char: TMenuItem;
    MenuItem_Settings_Medium: TMenuItem;
    MenuItem_Settings_Separator_1: TMenuItem;
    MenuItem_Settings_Advanced: TMenuItem;
    MenuItem_Settings_Separator_2: TMenuItem;
    MenuItem_Settings_Show_Solution: TMenuItem;
    MenuItem_Settings: TMenuItem;
    MenuItem_Ratings_Separator: TMenuItem;
    MenuItem_Ratings_Show_Solution: TMenuItem;
    MenuItem_Ratings_Beginner: TMenuItem;
    MenuItem_Ratings_Medium: TMenuItem;
    MenuItem_Ratings_Advanced: TMenuItem;
    MenuItem_Ratings: TMenuItem;
  { -----------------------------------------}

      MenuItem_File            :   TMenuItem;
        MenuItem_File_Save     :   TMenuItem;
          SaveDial_SudokuGrids : TSaveDialog;
        MenuItem_File_Load     : TMenuItem  ;
          OpenDial_SudokuGrids : TOpenDialog;

  { -----------------------------------------}

      MenuItem_Select          : TMenuItem;
        MenuItem_Select_1To9   : TMenuItem;
        MenuItem_Select_Char   : TMenuItem;

  { -----------------------------------------}

      MenuItem_Settings1       : TMenuItem;

    { ---------------------------------------}


    { ---------------------------------------}

      MenuItem_Close           : TMenuItem;

    { ---------------------------------------}

      GroBox_SudokuPuzzle      :   TGroupBox;
      StrGri_Ratings: TStringGrid;
      StrGri_NineCharacters: TStringGrid;
        StrGri_SudokuPuzzle    : TStringGrid;


      GroBox_SelectCharacter   :   TGroupBox;
        StrGri_SelectCharacter : TStringGrid;

    { ---------------------------------------}

      GroBox_SudokuGrid        : TGroupBox  ;
        StrGri_SudokuGrid      : TStringGrid;

      GroBox_SudokuSolution    : TGroupBox  ;
        StrGri_SudokuSolution  : TStringGrid;

      GroBox_Ratings           : TGroupBox  ;
      TaskDia_Information: TTaskDialog;

     { --------------------------------------------------------}
     {                     MenuItem_File                       }
     { --------------------------------------------------------}


       procedure But_New_PuzzleClick(Sender: TObject);
       procedure CheBox_Show_SolutionClick(Sender: TObject);
       procedure ComBox_BMAChange(Sender: TObject);

       procedure MenuItem_New_GridClick(Sender: TObject);
       procedure MenuItem_Select_ColoursClick(Sender: TObject);
       procedure MenuItem_Settings_AdvancedClick(Sender: TObject);
       procedure MenuItem_Settings_CharClick(Sender: TObject);
       procedure MenuItem_Settings_ColoursClick(Sender: TObject);
       procedure MenuItem_Settings_MediumClick(Sender: TObject);



       procedure MenuItem_File_SaveClick ( Sender : TObject )  ;
       procedure MenuItem_File_LoadClick ( Sender : TObject )  ;

       procedure MenuItem_Ratings_AdvancedClick(Sender: TObject);
       procedure MenuItem_Ratings_BeginnerClick(Sender: TObject);
       procedure MenuItem_Ratings_MediumClick(Sender: TObject);
       procedure MenuItem_Ratings_Show_SolutionClick(Sender: TObject);
       procedure MenuItem_Settings_Show_SolutionClick(Sender: TObject);
       procedure MenuItem_Settings_New_GridClick(Sender: TObject);


         procedure P_Save_Grids_Directory;

     { ----------------------------------------------------------------}
     {                             MenuItem_Select                     }
     { ----------------------------------------------------------------}

        procedure MenuItem_Select_1To9Click ( Sender    : TObject );
        procedure MenuItem_Select_CharClick ( Sender    : TObject );

          procedure P_RandomizeGrid ( PCha_Grid         : Char;
                                      PStrGri_Random    : TStringGrid );

          procedure P_Ratings;
          procedure P_RandomRatings;

     { --------------------------------------------------------}
     {                     MenuItem_Close                      }
     { --------------------------------------------------------}

        procedure MenuItem_CloseClick ( Sender : TObject  );
        procedure StrGri_SelectCharacterDrawCell(Sender: TObject; aCol,
          aRow: Integer; aRect: TRect; aState: TGridDrawState);
        procedure StrGri_SudokuGridDrawCell(Sender: TObject; aCol,
          aRow: Integer; aRect: TRect; aState: TGridDrawState);

     { --------------------------------------------------------}
     {                      StrGri_SudokuPuzzle                }
     { --------------------------------------------------------}

       procedure StrGri_SudokuPuzzleDragOver
       ( Sender, Source: TObject; X, Y: Integer;
         State: TDragState; var Accept: Boolean );

       procedure StrGri_SudokuPuzzleDragDrop
       ( Sender, Source: TObject; X, Y: Integer );
       procedure StrGri_SudokuPuzzleDrawCell(Sender: TObject; aCol,
         aRow: Integer; aRect: TRect; aState: TGridDrawState);

       procedure StrGri_SudokuPuzzleMouseDown
       ( Sender: TObject; Button: TMouseButton;
         Shift: TShiftState; X, Y: Integer      );

     { --------------------------------------------------------}
     {                     ComBox_Ratings                      }
     { --------------------------------------------------------}

   //     procedure ComBox_RatingsChange ( Sender : TObject );

     { --------------------------------------------------------}
     {                      StrGri_SelectCharacter             }
     { --------------------------------------------------------}

       procedure StrGri_SelectCharacterDragOver
       ( Sender, Source: TObject; X,  Y:  Integer;
         State: TDragState; var Accept: Boolean );

       procedure StrGri_SelectCharacterMouseDown
       ( Sender: TObject;   Button: TMouseButton;
         Shift: TShiftState; X, Y: Integer     );

     { --------------------------------------------------------}

       procedure FormActivate         ( Sender : TObject );
       procedure TaskDia_InformationButtonClicked(Sender: TObject;
         AModalResult: TModalResult; var ACanClose: Boolean);

     { --------------------------------------------------------}

  private

      procedure P_DisplayPuzzle    ( PByt_Rating : Byte );
      procedure P_DifficultyRating ( PByt_Rating : Byte );

      procedure P_EmptyGrid        ( PStrGri_EmptyGrid : TStringGrid );

      procedure P_ReadFromTextFile ( PStr_FileName : string;
                                      var PStr_FirstAndLastCharacters: String );

      procedure P_CheckPuzzleGrid ( PInt_DestCol,PInt_DestRow : integer);

      procedure P_ReadFromSettings ( PStr_FileName : string;
                                 var PStr_Settings: String );

      procedure P_WriteToSettings ( PStr_FileName : string;
                                    PStr_Settings: String );

    public

  end;
   const

   G_ARRAY_COLOR_CELLS : array  [1..9] of TColor =
                                ( clBlack, clMaroon, clGreen ,
                                  clOlive, clNavy  , clPurple,
                                  clTeal , clGray  , clSilver );

   G_NUMBER_GRID  = '1'; G_CHARACTER_GRID = '2'; G_COLOUR_GRID = '3';

   G_EASY_PUZZLE = 1; G_MEDIUM_PUZZLE = 2;
   G_HARD_PUZZLE = 3; G_EXPERT_PUZZLE = 4;

   G_BEGINNER_RATING = 1; G_MEDIUM_RATING = 2; G_ADVANCED_RATING = 3;

   G_RANDOM_RATINGS_PATH_TO_EASY             = '\Ratings\1_Easy\Random_Ratings\Easy.txt';
   G_RANDOM_RATINGS_PATH_TO_MEDIUM           = '\Ratings\2_Medium\Random_Ratings\Medium.txt';
   G_RANDOM_RATINGS_PATH_TO_HARD             = '\Ratings\3_Hard\Random_Ratings\Hard.txt';
   G_RANDOM_RATINGS_PATH_TO_EXPERT           = '\Ratings\4_Expert\Random_Ratings\Expert.txt';

   G_SAVE_PATH_TO_EASY                       = '\Save_Grids\1_Easy';
   G_SAVE_PATH_TO_MEDIUM                     = '\Save_Grids\2_Medium';
   G_SAVE_PATH_TO_HARD                       = '\Save_Grids\3_Hard';
   G_SAVE_PATH_TO_EXPERT                     = '\Save_Grids\4_Expert';


var
  Form_Sudoku: TForm_Sudoku;

  GArrBoo_Settings : array [1..5] of boolean;

  GByt_SelectRating        ,
  GByt_RatingsAcross       , GByt_RatingsDown ,
  GByt_Puzzle              ,
  GByt_Across              , GByt_Down ,
  GByt_FirstTimeRound      , GByt_ButtonSelected : Byte;

  GCha_FirstCharacter, GCha_Grid : Char;

  GInt_SourceCol , GInt_SourceRow : integer;

  GStr_RatingsDir             , GStr_RandomRatings ,
  GStr_SaveGridsDir ,
  GStr_FirstCharacter         , GStr_LastCharacter,
  GStr_FirstAndLastCharacters , GStr_RandomLine   ,

  GStr_NineCharacters         , GStr_Settings : string;

implementation
uses f_alternative_grid;
{$R *.lfm}

{ -------------------------------------------------------------}
{                  MenuItem_File_Save_And_Load                 }
{ -------------------------------------------------------------}



procedure TForm_Sudoku.MenuItem_Ratings_BeginnerClick(Sender: TObject);
begin
  MenuItem_Settings_Medium  .Enabled := True;
  MenuItem_Settings_Advanced.Enabled := True;

  P_DisplayPuzzle    ( G_BEGINNER_RATING );

  MenuItem_Ratings_Beginner.Checked := True;
  MenuItem_Ratings_Medium  .Checked := False;
  MenuItem_Ratings_Advanced.Checked := False;

  if MenuItem_Ratings_Show_Solution.Checked = True
    then
      MenuItem_Ratings_Show_SolutionClick(Sender);

 end;

procedure TForm_Sudoku.MenuItem_Ratings_MediumClick(Sender: TObject);
begin
  MenuItem_Settings_Medium   .Enabled := False;
  MenuItem_Settings_Advanced. Enabled := True;

  P_DisplayPuzzle    ( G_MEDIUM_RATING );

  MenuItem_Ratings_Beginner.Checked := False;
  MenuItem_Ratings_Medium  .Checked := True;
  MenuItem_Ratings_Advanced.Checked := False;



  if MenuItem_Ratings_Show_Solution.Checked = True
    then
      MenuItem_Ratings_Show_SolutionClick(Sender);

end;

procedure TForm_Sudoku.MenuItem_Ratings_AdvancedClick(Sender: TObject);
begin
   MenuItem_Settings_Medium  . Enabled := True;
   MenuItem_Settings_Advanced. Enabled := False;

  P_DisplayPuzzle    ( G_ADVANCED_RATING );

  MenuItem_Ratings_Beginner.Checked := False;
  MenuItem_Ratings_Medium  .Checked := False;
  MenuItem_Ratings_Advanced.Checked := True;

  if MenuItem_Ratings_Show_Solution.Checked = True
    then
      MenuItem_Ratings_Show_SolutionClick(Sender);
end;

procedure TForm_Sudoku.MenuItem_Ratings_Show_SolutionClick(Sender: TObject);
begin


  MenuItem_Settings_Show_Solution.Enabled := false;


  if MenuItem_Ratings_Show_Solution.Tag = 0
    then
      begin
        MenuItem_Settings_Show_Solution.Enabled:=False;
        MenuItem_Ratings_Show_Solution.Caption := 'Hide Solution';
        MenuItem_Ratings_Show_Solution.Checked := true;
        Form_Sudoku.Height := 515;
        MenuItem_Ratings_Show_Solution.Tag := 1;
      end
    else
      begin
        MenuItem_Settings_Show_Solution.Enabled:=True;
        MenuItem_Ratings_Show_Solution.Caption := 'Show Solution';
        MenuItem_Ratings_Show_Solution.Checked := false;
        Form_Sudoku.Height := 455;
        MenuItem_Ratings_Show_Solution.Tag := 0;
      end;

 end; // MenuItem_Ratings_Show_Solution //

procedure TForm_Sudoku.MenuItem_Settings_Show_SolutionClick(Sender: TObject);
begin
 if MenuItem_Settings_Show_Solution.Tag = 1
    then
      begin
        MenuItem_Settings_Show_Solution.Checked := True;
        MenuItem_Ratings_Show_Solution .Visible := True;

        P_WriteToSettings ( 'Show_solution_Boolean.txt','1'); // True //

        with TaskDia_Information do
          begin
            Title := 'Show Solution is now under Ratings';
            if Execute
              then
          end; // with TaskDia_Information //

         MenuItem_Settings_Show_Solution.Tag     := 0;
      end
    else
      begin
        MenuItem_Settings_Show_Solution.Checked := False;
        MenuItem_Ratings_Show_Solution .Visible := False;

        P_WriteToSettings ( 'Show_solution_Boolean.txt','0'); // False //

        with TaskDia_Information do
          begin
            Title := 'Show Solution has been removed from Ratings';
            if Execute
              then
          end; // with TaskDia_Information //

        //  GByt_ButtonSelected := MessageDlg ('Show Solution has now been removed from Ratings',mtInformation,[mbOK],0);


        MenuItem_Settings_Show_Solution.Tag     := 1;
      end;
end;

procedure TForm_Sudoku.MenuItem_Settings_New_GridClick(Sender: TObject);
begin
   if MenuItem_Settings_New_Grid.Tag = 1
    then
      begin
        MenuItem_Settings_New_Grid.Checked := True;
        MenuItem_New_Grid.Visible := True;

        P_WriteToSettings ( 'New_Grid_Boolean.txt','1'); // True //

        with TaskDia_Information do
          begin
            Title := 'New Grid is between Ratings and Settings';
            if Execute
              then
          end; // with TaskDia_Information //

        MenuItem_Settings_New_Grid.Tag     := 0;
      end
    else
      begin
        MenuItem_Settings_New_Grid.Checked := False;
        MenuItem_New_Grid.Visible := False;

        P_WriteToSettings ( 'New_Grid_Boolean.txt','0'); // False //

         with TaskDia_Information do
          begin
            Title := 'New Grid has been removed from between Ratings and Settings';
            if Execute
              then
          end; // with TaskDia_Information //

        MenuItem_Settings_New_Grid.Tag     := 1;
      end;
end;



procedure TForm_Sudoku.But_New_PuzzleClick(Sender: TObject);
begin

  if ComBox_BMA.Text = 'Easy'
    then
      GByt_SelectRating := G_EASY_PUZZLE;

  if ComBox_BMA.Text = 'Medium'
     then
       GByt_SelectRating := G_MEDIUM_PUZZLE;

   if ComBox_BMA.Text = 'Hard'
     then
      GByt_SelectRating := G_HARD_PUZZLE;

  if  ComBox_BMA.Text = 'Expert'
    then
      GByt_SelectRating :=  G_EXPERT_PUZZLE;

  P_RandomizeGrid ( GCha_Grid, StrGri_SudokuSolution );
  P_Ratings;
end;

procedure TForm_Sudoku.CheBox_Show_SolutionClick(Sender: TObject);
begin




  if CheBox_Show_Solution.Checked = True
    then
      begin

        GCha_Grid := G_COLOUR_GRID;
        P_RandomizeGrid ( GCha_Grid, StrGri_SudokuSolution );
        P_Ratings;

        GroBox_SudokuGrid.Visible:=True;
        Form_Sudoku.Width := 603
      end
    else
      begin
        GroBox_SudokuGrid.Visible:=False;
        Form_Sudoku.Width  := 421;
      end;

end;

procedure TForm_Sudoku.ComBox_BMAChange(Sender: TObject);
begin

    if ComBox_BMA.Text = 'Easy'
    then
      GByt_SelectRating := G_EASY_PUZZLE;

  if ComBox_BMA.Text = 'Medium'
     then
       GByt_SelectRating := G_MEDIUM_PUZZLE;

   if ComBox_BMA.Text = 'Hard'
     then
      GByt_SelectRating := G_HARD_PUZZLE;

  if  ComBox_BMA.Text = 'Expert'
    then
      GByt_SelectRating :=  G_EXPERT_PUZZLE;

  P_RandomizeGrid ( GCha_Grid, StrGri_SudokuSolution );
  P_Ratings;


end;

procedure TForm_Sudoku.MenuItem_New_GridClick(Sender: TObject);
begin
  f_alternative_grid.Form_AlternativeGrid.Show;
end;

procedure TForm_Sudoku.MenuItem_Select_ColoursClick(Sender: TObject);
begin


  MenuItem_Settings_Char   .Enabled:=true;
  MenuItem_Settings_Colours.Enabled:=false;

  MenuItem_Settings1.Caption:= 'Settings :- ' + MenuItem_Select_Colours.Caption;

  MenuItem_Select_1To9   .Checked:=false;
  MenuItem_Select_Char   .Checked:=false;
  MenuItem_Select_Colours.Checked:=true;

  GCha_Grid := G_COLOUR_GRID ;

  P_RandomizeGrid ( GCha_Grid, StrGri_SudokuSolution );
  P_Ratings;
end;



procedure TForm_Sudoku.MenuItem_Settings_AdvancedClick(Sender: TObject);
begin
 if MenuItem_Settings_Advanced.Tag = 1
    then
      begin
        MenuItem_Settings_Advanced.Checked := True;
        MenuItem_Ratings_Advanced .Visible := True;

        P_WriteToSettings ( 'Ratings_Advanced_Boolean.txt','1');  // True //

          with TaskDia_Information do
          begin
            Title := 'Advanced is now under Ratings';
            if Execute
              then
          end; // with TaskDia_Information //

        P_WriteToSettings ( 'Ratings_Advanced_Boolean.txt','1' );// True //

        MenuItem_Settings_Advanced.Tag     := 0;
      end
    else
      begin
        MenuItem_Settings_Advanced.Checked := False;
        MenuItem_Ratings_Advanced .Visible := False;

        P_WriteToSettings ( 'Ratings_Advanced_Boolean.txt','0'); // False //

         with TaskDia_Information do
          begin
            Title := 'Advanced has been removed from Ratings';
            if Execute
              then
          end; // with TaskDia_Information //

        MenuItem_Settings_Advanced.Tag     := 1;
      end;
end;

procedure TForm_Sudoku.MenuItem_Settings_CharClick(Sender: TObject);
begin
  if MenuItem_Settings_Char.Tag = 1
    then
      begin
         P_ReadFromTextFile  ( 'FirstAndLastCharacters.txt',
                                GStr_FirstAndLastCharacters);

        MenuItem_Settings_Char.Checked := True;
        MenuItem_Select_Char  .Visible := True;

        P_WriteToSettings ( 'FirstAndLastChar_Boolean.txt','1');  // True //

        with TaskDia_Information do
          begin
            Title :='The Nine Characters ( ' +
                     GStr_FirstAndLastCharacters[1] + ' to ' +
                     GStr_FirstAndLastCharacters[2] + ' ) are now under Select';
            if Execute
              then
          end; // with TaskDia_Information //

        MenuItem_Select_1To9.Checked:=true;
        MenuItem_Settings_Char.Tag := 0;

      end
    else
      begin
        MenuItem_Settings_Char.Checked := false;
        MenuItem_Select_Char  .Visible := false;

        P_WriteToSettings ( 'FirstAndLastChar_Boolean.txt','0');  // False //

        with TaskDia_Information do
          begin
            Title :='The Nine Characters ( ' +
                     GStr_FirstAndLastCharacters[1] + ' to ' +
                     GStr_FirstAndLastCharacters[2] + '  ) has been removed from Select';
            if Execute
              then
          end; // with TaskDia_Information //

         MenuItem_Settings_Char.Tag := 1;
      end;


end;

procedure TForm_Sudoku.MenuItem_Settings_ColoursClick(Sender: TObject);
begin
    if MenuItem_Settings_Colours.Tag = 1
    then
      begin
        MenuItem_Settings_Colours.Checked := True;
        MenuItem_Select_Colours  .Visible := True;

        P_WriteToSettings ( 'Colours_Boolean.txt','1');  // True //

        with TaskDia_Information do
          begin
            Title := 'Colours is now under Select';
            if Execute
              then
          end; // with TaskDia_Information //


        MenuItem_Settings_Colours.Tag     := 0;
      end
    else
      begin
        MenuItem_Settings_Colours.Checked := False;
        MenuItem_Select_Colours  .Visible := False;

        P_WriteToSettings ( 'Colours_Boolean.txt','0');  // False //
        with TaskDia_Information do
          begin
            Title :=  'Colours has been removed from Select';
            if Execute
              then
          end; // with TaskDia_Information //


        MenuItem_Settings_Colours.Tag     := 1;
      end;


end; // MenuItem_Settings_Colours //

procedure TForm_Sudoku.MenuItem_Settings_MediumClick(Sender: TObject);
begin

  if MenuItem_Settings_Medium.Tag = 1
    then
      begin
        MenuItem_Settings_Medium.Checked := True;
        MenuItem_Ratings_Medium .Visible := True;

        P_WriteToSettings ( 'Ratings_Medium_Boolean.txt','1');  // True //

        with TaskDia_Information do
          begin
            Title := 'Medium is now under Ratings';
            if Execute
              then
          end; // with TaskDia_Information //

        MenuItem_Settings_Medium.Tag     := 0;
      end
    else
      begin
        MenuItem_Settings_Medium.Checked := False;
        MenuItem_Ratings_Medium .Visible := False;

        P_WriteToSettings ( 'Ratings_Medium_Boolean.txt','0');  // False //

        with TaskDia_Information do
          begin
            Title := 'Medium has been removed from Ratings';
            if Execute
              then
          end; // with TaskDia_Information //

        MenuItem_Settings_Medium.Tag     := 1;
      end;



end;


procedure TForm_Sudoku.MenuItem_File_SaveClick(Sender: TObject);
var
  LStr_SaveFolder , LStr_PathAndFilename: String;
begin
  P_Save_Grids_Directory;

  if GCha_Grid = G_NUMBER_GRID
    then
       LStr_SaveFolder := '\Number_Grids\'
    else
      if GCha_Grid = G_CHARACTER_GRID
        then
          LStr_SaveFolder :=  '\Character_Grids\'
        else
          if GCha_Grid = G_COLOUR_GRID
            then
              LStr_SaveFolder := '\Colour_Grids\';

   with SaveDial_SudokuGrids do
    begin
      InitialDir:= GStr_SaveGridsDir +  LStr_SaveFolder;

      Filter := 'Text files (*.txt)|*.txt';

      if Execute // Show Save Dialog //
        then
          begin
            LStr_PathAndFilename := Filename;
            StrGri_SudokuPuzzle.SaveToFile( LStr_PathAndFilename)
          end // if Execute // Show Save Dialog //
    end; // with SaveDial_SudokuGrids do //
end; // MenuItem_File_Save //





procedure TForm_Sudoku.MenuItem_File_LoadClick(Sender: TObject);
var
  LStr_SaveFolder , LStr_PathAndFilename: String;
begin
   P_Save_Grids_Directory;

   if GCha_Grid = G_NUMBER_GRID
    then
       LStr_SaveFolder := '\Number_Grids\'
    else
      if GCha_Grid = G_CHARACTER_GRID
        then
          LStr_SaveFolder :=  '\Character_Grids\'
        else
          if GCha_Grid = G_COLOUR_GRID
            then
              LStr_SaveFolder := '\Colour_Grids\';


  with OpenDial_SudokuGrids do
    begin
      Options := Options + [ofPathMustExist,ofFileMustExist];

      InitialDir := GStr_SaveGridsDir +  LStr_SaveFolder;
      Filter := 'Text files (*.txt)|*.txt';

      if Execute // Show Open Dialog //
        then
          begin
            LStr_PathAndFilename := FileName;

            P_EmptyGrid ( StrGri_SudokuPuzzle );
            StrGri_SudokuPuzzle.LoadFromFile(LStr_PathAndFilename);
          end; //  if Execute // Show Open Dialog //
    end; //  with OpenDial_SudokuGrids do  //
end; // MenuItem_File_Load //





procedure TForm_Sudoku.P_Save_Grids_Directory;
begin
  case GByt_SelectRating of

    1 : GStr_SaveGridsDir := GetCurrentDir + G_SAVE_PATH_TO_EASY;
    2 : GStr_SaveGridsDir := GetCurrentDir + G_SAVE_PATH_TO_MEDIUM;
    3 : GStr_SaveGridsDir := GetCurrentDir + G_SAVE_PATH_TO_HARD;
    4 : GStr_SaveGridsDir := GetCurrentDir + G_SAVE_PATH_TO_EXPERT;

  end; // case GByt_SelectRating //
end; // P_Save_Grids_Directory //

procedure TForm_Sudoku.MenuItem_Select_1To9Click(Sender: TObject);
begin

  MenuItem_Settings_Char   .Enabled:=true;
  MenuItem_Settings_Colours.Enabled:=true;
  MenuItem_Settings1.Caption:= 'Settings :- ' + MenuItem_Select_1To9.Caption;

  MenuItem_Select_1To9   .Checked:=true;
  MenuItem_Select_Char   .Checked:=false;
  MenuItem_Select_Colours.Checked:=false;

  GCha_Grid := G_NUMBER_GRID;

  P_RandomizeGrid ( GCha_Grid, StrGri_SudokuSolution );
  P_Ratings;

end; // MenuItem_Select_1To9 //

procedure TForm_Sudoku.MenuItem_Select_CharClick(Sender: TObject);
begin

 MenuItem_Settings_Char.Enabled:=false;

 MenuItem_Settings1.Caption:= 'Settings :- ' + MenuItem_Select_Char.Caption;
 GStr_FirstAndLastCharacters := 'AI';

 MenuItem_Select_1To9   .Checked:=false;
 MenuItem_Select_Char   .Checked:=true;
 MenuItem_Select_Colours.Checked:=false;

 GCha_Grid :=G_CHARACTER_GRID;

 P_RandomizeGrid ( GCha_Grid, StrGri_SudokuSolution );
 P_Ratings;

end; // MenuItem_Select_Char //

{ -----------------------------------------------------------------}
{              Used in MenuItem_File_Save_And_Load ( see above )   }
{ -----------------------------------------------------------------}
procedure TForm_Sudoku.P_RandomizeGrid ( PCha_Grid       : Char;
                                        PStrGri_Random  : TStringGrid );
var

  LByt_ColumnLoop  , LByt_RandomRow        , LByt_FoundColNo ,
  LByt_Across      , LByt_Down             , LByt_Found      ,
  LByt_FirstCharacter , LByt_FirstChar : Byte;

  LCha_FirstCharacter , LCha_FirstCharacterFromGrid : char;

  LStr_FindNumbers   , LStr_ReplaceNumbers , LStr_FirstCharacterFromGrid : string;
begin
{ ---------------------------------------------------------------------------  }
  for LByt_ColumnLoop := 1 to 9 do
    LStr_FindNumbers := LStr_FindNumbers + StrGri_SudokuSolution.Cells
                                                            [LByt_ColumnLoop,1];
{ ---------------------------------------------------------------------------  }
  Randomize;
  LByt_RandomRow := RandomRange(1,9);

  for LByt_ColumnLoop := 1 to 9 do
    LStr_ReplaceNumbers :=  LStr_ReplaceNumbers + PStrGri_Random.Cells
                                               [LByt_ColumnLoop,LByt_RandomRow];
{ ---------------------------------------------------------------------------  }
  for LByt_Across := 1 to 9 do
    StrGri_SudokuGrid.Cells[LByt_Across,1] :=
      LStr_ReplaceNumbers[LByt_Across];

  for LByt_Across := 1 to 9 do
    for LByt_Down := 1 to 9 do
      for LByt_Found := 1 to 9 do
        if StrGri_SudokuSolution.Cells[LByt_Found,1] =
          StrGri_SudokuSolution.Cells[LByt_Across,LByt_Down]
            then
              begin
                LByt_FoundColNo := LByt_Across;
                StrGri_SudokuGrid.Cells[LByt_FoundColNo,LByt_Down] := LStr_ReplaceNumbers[LByt_Found];
              end;

      for LByt_Across := 1 to 9 do
        StrGri_SelectCharacter.Cells[LByt_Across,1] := inttostr(LByt_Across);


  if PCha_Grid = G_CHARACTER_GRID
     then
       begin
         P_ReadFromTextFile  ( 'FirstAndLastCharacters.txt',
                                GStr_FirstAndLastCharacters);

         with f_alternative_grid.Form_AlternativeGrid do
           P_PutCharactersInToStringGrid ( StrGri_NineCharacters,
                                           GStr_FirstAndLastCharacters[1] );
         GStr_NineCharacters := '';

         for LByt_Across := 1 to 9 do
           GStr_NineCharacters := GStr_NineCharacters + StrGri_NineCharacters.Cells[LByt_Across,1];



         Form_Sudoku.Caption:= ' Sudoku - Character Settings [ ' + GStr_NineCharacters + ' ]';

        Form_Sudoku.Width := 421;

         MenuItem_Settings_Char.Caption := '( ' +
               GStr_FirstAndLastCharacters[1] + ' to ' +
               GStr_FirstAndLastCharacters[2] + ' )';

         MenuItem_Select_Char.Caption := '( ' +
               GStr_FirstAndLastCharacters[1] + ' to ' +
               GStr_FirstAndLastCharacters[2] + ' )';

         LCha_FirstCharacter := GStr_FirstAndLastCharacters[1];
         LByt_FirstChar := ord( LCha_FirstCharacter)-49;

         for LByt_Across := 1 to 9 do
           for LByt_Down := 1 to 9 do
             StrGri_SudokuGrid.Cells[LByt_Across,LByt_Down] :=
               chr(ord(StrGri_SudokuGrid.Cells[LByt_Across,LByt_Down][1])+LByt_FirstChar);

         LByt_FirstCharacter := ord( LCha_FirstCharacter)-1;

         for LByt_Across := 1 to 9 do
           StrGri_SelectCharacter.Cells[LByt_Across,1] :=
             chr(ord(LByt_FirstCharacter+LByt_Across));

       end;






end; // P_RandomizeGrid //
procedure TForm_Sudoku.P_DisplayPuzzle    ( PByt_Rating : Byte );
begin
  P_DifficultyRating ( PByt_Rating );

end; // P_DisplayPuzzle //

procedure TForm_Sudoku.P_DifficultyRating ( PByt_Rating : Byte );
begin
  case  PByt_Rating of

    G_BEGINNER_RATING :  begin

                           Form_Sudoku.Height := 455;
                           Form_Sudoku.Width  := 421;

                           GroBox_SudokuPuzzle.Caption := '';
                           GroBox_SudokuPuzzle.Caption :=  'Sudoku Puzzle :- '
                           + '( Beginner )';

                           Lab_DifficultyRating.Caption := '';
                           Lab_DifficultyRating.Caption := 'Difficuly Rating :- '
                           + '( Easy Only )';

                           ComBox_BMA.Clear;

                           ComBox_BMA.Items.Add('Easy');


                           ComBox_BMA.ItemIndex := 0;

                         end;

    G_MEDIUM_RATING   :  begin

                            Form_Sudoku.Height := 455;
                            Form_Sudoku.Width  := 421;

                            GroBox_SudokuPuzzle.Caption := '';
                            GroBox_SudokuPuzzle.Caption :=  'Sudoku Puzzle :- '
                            + '( Medium )';

                            Lab_DifficultyRating.Caption := '';
                            Lab_DifficultyRating.Caption := 'Difficuly Rating :- '
                            + '( Easy and Medium )';

                            ComBox_BMA.Clear;

                            ComBox_BMA.Items.Add('Easy');
                            ComBox_BMA.Items.Add('Medium');

                            ComBox_BMA.ItemIndex :=0;

                         end;

    G_ADVANCED_RATING :  begin

                            Form_Sudoku.Height := 455;
                            Form_Sudoku.Width  := 421;

                            GroBox_SudokuPuzzle.Caption := '';
                            GroBox_SudokuPuzzle.Caption :=  'Sudoku Puzzle :- '
                            + '( Advanced )';

                            Lab_DifficultyRating.Caption := '';
                            Lab_DifficultyRating.Caption := 'Difficuly Rating :- '
                            + '( Hard and Expert )';

                            ComBox_BMA.Clear;

                            ComBox_BMA.Items.Add('Hard');
                            ComBox_BMA.Items.Add('Expert');

                            ComBox_BMA.ItemIndex := 0;
                         end;

  end; // case  PByt_Rating of  //

end; // P_DisplayPuzzle //

procedure  TForm_Sudoku.P_ReadFromTextFile ( PStr_FileName : string;
                                            var PStr_FirstAndLastCharacters: String );
var
  LStr_FileName    : string;
  LTexFil_FileName : TextFile;
begin
  LStr_FileName := GetCurrentDir + '\First_And_Last_Char\' +PStr_FileName;

  AssignFile(LTexFil_FileName,LStr_FileName);
  Reset(LTexFil_FileName);

  while not Eof(LTexFil_FileName) do
    ReadLn(LTexFil_FileName,PStr_FirstAndLastCharacters);

   CloseFile (LTexFil_FileName);



end; // P_ReadFromTextFile  //

{ -----------------------------------------------------------------}
{              Used in MenuItem_File_Save_And_Load ( see above )   }
{ -----------------------------------------------------------------}

procedure TForm_Sudoku.P_Ratings;
var
 LByt_Row , LByt_Col , LByt_RandomLineLoop , LByt_RandomLineLength : Byte;
 LStr_RandomLine     : TStrings;
begin
  P_EmptyGrid(StrGri_SudokuPuzzle);
  P_RandomRatings;

  LStr_RandomLine:=  SplitString( GStr_RandomLine,',');

  for LByt_Row := 1 to 9 do
    begin
      LByt_RandomLineLength := length(LStr_RandomLine[ LByt_Row-1]);
      for LByt_RandomLineLoop := 1 to  LByt_RandomLineLength do
        StrGri_SudokuPuzzle  .Cells[strtoint(LStr_RandomLine[LByt_Row-1][LByt_RandomLineLoop ]),LByt_Row] :=
        StrGri_SudokuGrid.Cells[strtoint(LStr_RandomLine[LByt_Row-1][LByt_RandomLineLoop ]),LByt_Row];
    end; // for LByt_Row //


end; // P_Ratings //


procedure TForm_Sudoku.P_RandomRatings;
var
  LByt_RandomLine :byte;

begin

  case GByt_SelectRating of
    1 : GStr_RandomRatings := GetCurrentDir + G_RANDOM_RATINGS_PATH_TO_EASY;
    2 : GStr_RandomRatings := GetCurrentDir + G_RANDOM_RATINGS_PATH_TO_MEDIUM;
    3 : GStr_RandomRatings := GetCurrentDir + G_RANDOM_RATINGS_PATH_TO_HARD;
    4 : GStr_RandomRatings := GetCurrentDir + G_RANDOM_RATINGS_PATH_TO_EXPERT;
  end;

  Memo_Ratings.Lines.LoadFromFile( GStr_RandomRatings );

  LByt_RandomLine := RandomRange(1,9);
  GStr_RandomLine := Memo_Ratings.Lines[LByt_RandomLine];

end;

procedure TForm_Sudoku.P_EmptyGrid ( PStrGri_EmptyGrid : TStringGrid );
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

{ ----------------------------------------------------------}
{                     MenuItem_Close                        }
{ ----------------------------------------------------------}
procedure TForm_Sudoku.MenuItem_CloseClick(Sender: TObject);
begin

  Close;
end; // MenIte_CloseClick //

procedure TForm_Sudoku.StrGri_SelectCharacterDrawCell(Sender: TObject; aCol,
  aRow: Integer; aRect: TRect; aState: TGridDrawState);
var
  LByt_Row , LByt_Col : byte;
  LStr_ColoredCell : string;
begin

  if  GCha_Grid <> G_COLOUR_GRID
    then
      Exit
  else

  if (aCol = 0) or (aRow = 0)
    then
      Exit;

  LStr_ColoredCell := StrGri_SelectCharacter.Cells[ aCol,aRow ];

  for LByt_Col:= 1 to 9 do
    for LByt_Row := 1 to 9 do
      if LStr_ColoredCell =inttostr(LByt_Row)
         then
           begin
             StrGri_SelectCharacter.Canvas.Brush.Color :=  G_ARRAY_COLOR_CELLS [LByt_Row];
             StrGri_SelectCharacter.Canvas.FillRect(aRect);
           end;
end;

procedure TForm_Sudoku.StrGri_SudokuGridDrawCell(Sender: TObject; aCol,
  aRow: Integer; aRect: TRect; aState: TGridDrawState);
var
  LByt_Row , LByt_Col : byte;
  LStr_ColoredCell: string;
  LWor_SavedAlign: word;
begin
  {  if  GCha_Grid <> G_COLOUR_GRID
    then
      Exit
    else
         }
  if (aCol = 0) or (aRow = 0)
    then
      Exit;

  LStr_ColoredCell := StrGri_SudokuPuzzle.Cells[ aCol,aRow ];

  for LByt_Col:= 1 to 9 do
    for LByt_Row := 1 to 9 do
      if LStr_ColoredCell =inttostr(LByt_Row)
         then
           begin
             StrGri_SudokuPuzzle.Canvas.Brush.Color:=G_ARRAY_COLOR_CELLS [LByt_Row ];
             StrGri_SudokuPuzzle.Canvas.FillRect(aRect);

             StrGri_SudokuPuzzle.Canvas.Font.Color:=clWhite;

             LWor_SavedAlign:= SetTextAlign(StrGri_SudokuPuzzle.Canvas.Handle, TA_CENTER);
             StrGri_SudokuPuzzle.Canvas.TextRect(aRect, aRect.Left + (aRect.Right - aRect.Left) div 2, aRect.Top + 2, LStr_ColoredCell);

             SetTextAlign(StrGri_SudokuPuzzle.Canvas.Handle, LWor_SavedAlign);
             end;

end;

{ --------------------------------------------------------------------------}
{                      StrGri_SudokuPuzzle                                  }
{ --------------------------------------------------------------------------}

procedure TForm_Sudoku.StrGri_SudokuPuzzleDragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
 begin
   Accept := (Source is TStringGrid);
 end; // StrGri_SudokuPuzzleDragOver //

procedure TForm_Sudoku.StrGri_SudokuPuzzleDragDrop(Sender, Source: TObject; X,
  Y: Integer);
var
  LInt_DestCol, LInt_DestRow : integer;

begin
  LInt_DestCol := 0; LInt_DestRow := 0;

  StrGri_SudokuPuzzle.MouseToCell(X,Y,LInt_DestCol,LInt_DestRow);


  { ----------------------------------------------------------------- }
  { ---------------------- Ignore Headers --------------------------- }
  { ----------------------------------------------------------------- }
   if ( LInt_DestRow <> 0 ) and (LInt_DestCol <> 0 )
    then
       P_CheckPuzzleGrid ( LInt_DestCol , LInt_DestRow );


end; // StrGri_SudokuPuzzleDragDrop //

procedure TForm_Sudoku.StrGri_SudokuPuzzleDrawCell(Sender: TObject; aCol,
  aRow: Integer; aRect: TRect; aState: TGridDrawState);
var
  LByt_Row , LByt_Col : byte;
  LStr_ColoredCell: string;
  LWor_SavedAlign: word;
begin
    if  GCha_Grid <> G_COLOUR_GRID
    then
      Exit
    else

  if (aCol = 0) or (aRow = 0)
    then
      Exit;

  LStr_ColoredCell := StrGri_SudokuPuzzle.Cells[ aCol,aRow ];

  for LByt_Col:= 1 to 9 do
    for LByt_Row := 1 to 9 do
      if LStr_ColoredCell =inttostr(LByt_Row)
         then
           begin
             StrGri_SudokuPuzzle.Canvas.Brush.Color:=G_ARRAY_COLOR_CELLS [LByt_Row ];
             StrGri_SudokuPuzzle.Canvas.FillRect(aRect);

             StrGri_SudokuPuzzle.Canvas.Font.Color:=clWhite;

             LWor_SavedAlign:= SetTextAlign(StrGri_SudokuPuzzle.Canvas.Handle, TA_CENTER);
             StrGri_SudokuPuzzle.Canvas.TextRect(aRect, aRect.Left + (aRect.Right - aRect.Left) div 2, aRect.Top + 2, LStr_ColoredCell);

             SetTextAlign(StrGri_SudokuPuzzle.Canvas.Handle, LWor_SavedAlign);
             end;

end; // StrGri_SudokuPuzzle //

procedure TForm_Sudoku.P_CheckPuzzleGrid ( PInt_DestCol,PInt_DestRow : integer);
const

   L_EMPTY_CELL = '';
var

  LStr_SelectCharacter             ,
  LStr_PuzzleCellContents          ,
  LStr_SolutionCellContents        : string;

begin

  LStr_PuzzleCellContents          := StrGri_SudokuPuzzle.Cells
                                    [ PInt_DestCol,PInt_DestRow ];
  LStr_SelectCharacter              := StrGri_SelectCharacter.Cells
                                       [ GInt_SourceCol,1 ];
  LStr_SolutionCellContents        := StrGri_SudokuGrid.Cells
                                    [ PInt_DestCol,PInt_DestRow ];




{ ---------------------------------------------------------------------------- }
  if LStr_PuzzleCellContents <> L_EMPTY_CELL
    then
      showmessage ('Cannot Delete');

  if LStr_PuzzleCellContents = L_EMPTY_CELL
   then
     if  LStr_SelectCharacter = LStr_SolutionCellContents
       then
         StrGri_SudokuPuzzle   .Cells[PInt_DestCol,PInt_DestRow]:=
         StrGri_SelectCharacter.Cells[GInt_SourceCol,GInt_SourceRow]
       else
         showmessage (LStr_SelectCharacter + ' is in the wrong position');

end; // P_CheckPuzzleGrid //

procedure TForm_Sudoku.StrGri_SudokuPuzzleMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
const
  L_SPACE = ' ';
var
  LInt_DestCol,LInt_DestRow : integer;

  LStr_PuzzleCellContents          ,
  LStr_SolutionCellContents        : string;

begin
  LInt_DestCol := 0; LInt_DestRow := 0;
  StrGri_SudokuPuzzle.MouseToCell(X,Y,LInt_DestCol,LInt_DestRow);

  LStr_PuzzleCellContents          := StrGri_SudokuPuzzle.Cells
                                    [ LInt_DestCol,LInt_DestRow ];



  LStr_SolutionCellContents        := StrGri_SudokuSolution.Cells
                                    [ LInt_DestCol,LInt_DestRow ];


  if (Button = mbRight)
    then
      begin
       if ( LStr_PuzzleCellContents <> LStr_SolutionCellContents )
          then
            StrGri_SudokuPuzzle.Cells[ LInt_DestCol,LInt_DestRow ] := L_SPACE
          else
            showmessage ('Cannot Delete' + chr(13)
                                         + 'It is in the right position');


      end; // (Button = mbRight) //
end; // StrGri_SudokuPuzzleMouseDown //


{ ---------------------------------------------------------------------------}
{                      StrGri_SelectCharacter                                }
{ ---------------------------------------------------------------------------}
procedure TForm_Sudoku.StrGri_SelectCharacterDragOver(Sender, Source: TObject;
  X, Y: Integer; State: TDragState; var Accept: Boolean);
begin

   Accept := (Source is TStringGrid);

end; // StrGri_SelectCharacterDragOver //

procedure TForm_Sudoku.StrGri_SelectCharacterMouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  StrGri_SelectCharacter.MouseToCell(X,Y,GInt_SourceCol,GInt_SourceRow);

  if (Button = mbLeft)
    then
       { ----------------------------------------------------------------- }
       { ---------------------- Ignore Headers --------------------------- }
       { ----------------------------------------------------------------- }
      if ( GInt_SourceCol = 0 ) or ( GInt_SourceRow = 0 )
       then
     else
       StrGri_SelectCharacter.BeginDrag(False,5)

end; // StrGri_SelectCharacterMouseDown //

procedure TForm_Sudoku.FormActivate(Sender: TObject);
begin

  { -------------------------------------------------------------------- }

 //  P_ReadFromSettings ( 'FirstAndLastChar_Boolean.txt',GStr_Settings);

 //  if  GStr_Settings = '1'

     if GArrBoo_Settings[1] = true
     then
       MenuItem_Settings_CharClick(Sender);


 { -------------------------------------------------------------------- }
    P_ReadFromSettings ( 'Colours_Boolean.txt',GStr_Settings);

   if  GStr_Settings = '1'
     then
       MenuItem_Settings_ColoursClick(Sender);

  { -------------------------------------------------------------------- }
   P_ReadFromSettings ( 'Ratings_Medium_Boolean.txt',GStr_Settings);

   if  GStr_Settings = '1'
    then
      MenuItem_Settings_MediumClick(Sender);


 { --------------------------------------------------------------------  }

   P_ReadFromSettings ( 'Ratings_Advanced_Boolean.txt',GStr_Settings);

   if  GStr_Settings = '1'
    then
      MenuItem_Settings_AdvancedClick(Sender);


 { -------------------------------------------------------------------- }

  P_ReadFromSettings ( 'Show_Solution_Boolean.txt',GStr_Settings);

  if  GStr_Settings = '1'
    then
      MenuItem_Settings_Show_SolutionClick(Sender);


 { -------------------------------------------------------------------- }

  P_ReadFromSettings ( 'New_Grid_Boolean.txt',GStr_Settings);

  if  GStr_Settings = '1'
    then
      MenuItem_Settings_New_GridClick(Sender);


 { -------------------------------------------------------------------- }
  P_DisplayPuzzle    (  G_BEGINNER_RATING );

  MenuItem_Settings1.Caption:='Settings :- ' + MenuItem_Select_1To9.Caption;
  MenuItem_Ratings_Beginner.Checked:=true;

  GByt_Puzzle := G_EASY_PUZZLE;
  GByt_SelectRating := GByt_Puzzle;
  ComBox_BMA.ItemIndex:= GByt_Puzzle-1;

  GCha_Grid := G_NUMBER_GRID;
  P_RandomizeGrid ( GCha_Grid, StrGri_SudokuSolution );

  if GByt_FirstTimeRound = 0
    then
      begin
        GCha_Grid := G_CHARACTER_GRID;
        P_RandomizeGrid ( GCha_Grid, StrGri_SudokuSolution );

        GCha_Grid := G_NUMBER_GRID;
        P_RandomizeGrid ( GCha_Grid, StrGri_SudokuSolution );

        P_Ratings;

      end
    else



end; // FormActivate //

procedure TForm_Sudoku.TaskDia_InformationButtonClicked(Sender: TObject;
  AModalResult: TModalResult; var ACanClose: Boolean);
begin

end;

procedure TForm_Sudoku.P_ReadFromSettings ( PStr_FileName : string;
                                        var PStr_Settings: String );
var
  LStr_FileName    : string;
  LTexFil_FileName : TextFile;
begin
  LStr_FileName := GetCurrentDir + '\Settings\' +PStr_FileName;

  AssignFile(LTexFil_FileName,LStr_FileName);
  Reset(LTexFil_FileName);

  while not Eof(LTexFil_FileName) do
    ReadLn(LTexFil_FileName,PStr_Settings);

   CloseFile (LTexFil_FileName);



end; // P_ReadFromTextFile  //

procedure TForm_Sudoku.P_WriteToSettings ( PStr_FileName : string;
                                           PStr_Settings: String );
var
  LStr_FileName    : string;
  LTexFil_FileName : TextFile;
begin
  LStr_FileName := GetCurrentDir + '\Settings\' +PStr_FileName;

  AssignFile(LTexFil_FileName,LStr_FileName);
  ReWrite (LTexFil_FileName);
  WriteLn (LTexFil_FileName, PStr_Settings);
  CloseFile (LTexFil_FileName);

end; // P_WriteToTextFile //




end.

