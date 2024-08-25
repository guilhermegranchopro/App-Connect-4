program fourInLine;

uses
  crt;

var
  board: array[1..7, 1..6] of integer;
  turn, piece, X, counter: integer;
  computerTurn: boolean;

  function falling(X: integer): integer;

  var
    counter: integer;
    botton: boolean;

  begin

    counter := 0;
    botton := False;

    repeat
      counter := counter + 1;
      if ((board[X, counter] <> 0) or (counter = 6)) then
        botton := True;
    until botton;

    if counter <> 6 then
      falling := (counter - 1)
    else
      falling := 6;

  end;

  function negativeDiagonalAlgorithm(fictionalX, fictionalY: integer): integer;

  var
    counter, fictionalPiece, counterForTheWin: integer;

  begin

    fictionalPiece := 1;
    counterForTheWin := 0;
    negativeDiagonalAlgorithm := 0;

    for counter := 0 to 3 do
    begin
      if ((fictionalX - counter < 8) and (fictionalX - counter > 0) and
        (fictionalY - counter < 7) and (fictionalY - counter > 0)) then
      begin
        if ((board[fictionalX - counter, fictionalY - counter] = 0) and
          (fictionalPiece = 1) and (falling(fictionalX) = fictionalY)) then
        begin
          counterForTheWin := counterForTheWin + 1;
          fictionalPiece := 0;
          negativeDiagonalAlgorithm := fictionalX;
        end;
        if board[fictionalX - counter, fictionalY - counter] = 2 then
          counterForTheWin := counterForTheWin + 1;
        if counterForTheWin <> 4 then
          negativeDiagonalAlgorithm := 0;
      end;
    end;

    fictionalPiece := 1;
    counterForTheWin := 0;

    if negativeDiagonalAlgorithm = 0 then
    begin
      for counter := 0 to 3 do
      begin
        if ((fictionalX + counter < 8) and (fictionalX + counter > 0) and
          (fictionalY + counter < 7) and (fictionalY + counter > 0)) then
        begin
          if ((board[fictionalX + counter, fictionalY + counter] = 0) and
            (fictionalPiece = 1) and (falling(fictionalX) = fictionalY)) then
          begin
            counterForTheWin := counterForTheWin + 1;
            fictionalPiece := 0;
            negativeDiagonalAlgorithm := fictionalX;
          end;
          if board[fictionalX + counter, fictionalY + counter] = 2 then
            counterForTheWin := counterForTheWin + 1;
          if counterForTheWin <> 4 then
            negativeDiagonalAlgorithm := 0;
        end;
      end;
    end;

  end;

  function positiveDiagonalAlgorithm(fictionalX, fictionalY: integer): integer;

  var
    counter, fictionalPiece, counterForTheWin: integer;

  begin

    fictionalPiece := 1;
    counterForTheWin := 0;
    positiveDiagonalAlgorithm := 0;

    for counter := 0 to 3 do
    begin
      if ((fictionalX + counter < 8) and (fictionalX + counter > 0) and
        (fictionalY - counter < 7) and (fictionalY - counter > 0)) then
      begin
        if ((board[fictionalX + counter, fictionalY - counter] = 0) and
          (fictionalPiece = 1) and (falling(fictionalX) = fictionalY)) then
        begin
          counterForTheWin := counterForTheWin + 1;
          fictionalPiece := 0;
          positiveDiagonalAlgorithm := fictionalX;
        end;
        if board[fictionalX + counter, fictionalY - counter] = 2 then
          counterForTheWin := counterForTheWin + 1;
        if counterForTheWin <> 4 then
          positiveDiagonalAlgorithm := 0;
      end;
    end;

    fictionalPiece := 1;
    counterForTheWin := 0;

    if positiveDiagonalAlgorithm = 0 then
    begin
      for counter := 0 to 3 do
      begin
        if ((fictionalX - counter < 8) and (fictionalX - counter > 0) and
          (fictionalY + counter < 7) and (fictionalY + counter > 0)) then
        begin
          if ((board[fictionalX - counter, fictionalY + counter] = 0) and
            (fictionalPiece = 1) and (falling(fictionalX) = fictionalY)) then
          begin
            counterForTheWin := counterForTheWin + 1;
            fictionalPiece := 0;
            positiveDiagonalAlgorithm := fictionalX;
          end;
          if board[fictionalX - counter, fictionalY + counter] = 2 then
            counterForTheWin := counterForTheWin + 1;
          if counterForTheWin <> 4 then
            positiveDiagonalAlgorithm := 0;
        end;
      end;
    end;

  end;

  function horizontalAlgorithm(fictionalX, fictionalY: integer): integer;

  var
    counter, fictionalPiece, counterForTheWin: integer;

  begin

    fictionalPiece := 1;
    counterForTheWin := 0;
    horizontalAlgorithm := 0;

    for counter := 0 to 3 do
    begin
      if ((fictionalX - counter < 8) and (fictionalX - counter > 0)) then
      begin
        if ((board[fictionalX - counter, fictionalY] = 0) and
          (fictionalPiece = 1) and (falling(fictionalX) = fictionalY)) then
        begin
          counterForTheWin := counterForTheWin + 1;
          fictionalPiece := 0;
          horizontalAlgorithm := fictionalX;
        end;
        if board[fictionalX - counter, fictionalY] = 2 then
          counterForTheWin := counterForTheWin + 1;
        if counterForTheWin <> 4 then
          horizontalAlgorithm := 0;
      end;
    end;

    fictionalPiece := 1;
    counterForTheWin := 0;

    if horizontalAlgorithm = 0 then
    begin
      for counter := 0 to 3 do
      begin
        if ((fictionalX + counter < 8) and (fictionalX + counter > 0)) then
        begin
          if ((board[fictionalX + counter, fictionalY] = 0) and
            (fictionalPiece = 1) and (falling(fictionalX) = fictionalY)) then
          begin
            counterForTheWin := counterForTheWin + 1;
            fictionalPiece := 0;
            horizontalAlgorithm := fictionalX;
          end;
          if board[fictionalX + counter, fictionalY] = 2 then
            counterForTheWin := counterForTheWin + 1;
          if counterForTheWin <> 4 then
            horizontalAlgorithm := 0;
        end;
      end;
    end;

  end;

  function verticalAlgorithm(fictionalX, fictionalY: integer): integer;

  var
    counter, fictionalPiece, counterForTheWin: integer;

  begin

    fictionalPiece := 1;
    counterForTheWin := 0;
    verticalAlgorithm := 0;

    for counter := 0 to 3 do
    begin
      if ((fictionalY - counter < 7) and (fictionalY - counter > 0)) then
      begin
        if ((board[fictionalX, fictionalY - counter] = 0) and
          (fictionalPiece = 1) and (falling(fictionalX) = fictionalY)) then
        begin
          counterForTheWin := counterForTheWin + 1;
          fictionalPiece := 0;
          verticalAlgorithm := fictionalX;
        end;
        if board[fictionalX, fictionalY - counter] = 2 then
          counterForTheWin := counterForTheWin + 1;
        if counterForTheWin <> 4 then
          verticalAlgorithm := 0;
      end;
    end;

    fictionalPiece := 1;
    counterForTheWin := 0;

    if verticalAlgorithm = 0 then
    begin
      for counter := 0 to 3 do
      begin
        if ((fictionalY + counter < 7) and (fictionalY + counter > 0)) then
        begin
          if ((board[fictionalX, fictionalY + counter] = 0) and
            (fictionalPiece = 1) and (falling(fictionalX) = fictionalY)) then
          begin
            counterForTheWin := counterForTheWin + 1;
            fictionalPiece := 0;
            verticalAlgorithm := fictionalX;
          end;
          if board[fictionalX, fictionalY + counter] = 2 then
            counterForTheWin := counterForTheWin + 1;
          if counterForTheWin <> 4 then
            verticalAlgorithm := 0;
        end;
      end;
    end;

  end;

  function computerPlayingAlgorithm(turn: integer): integer;

  var
    counter1, counter2: integer;

  begin

    computerPlayingAlgorithm := 0;

    if turn = 1 then
      computerPlayingAlgorithm := 4
    else
    begin

      for counter1 := 1 to 7 do
        for counter2 := 1 to 6 do
          if (board[counter1, counter2] <> 1) then
          begin
            computerPlayingAlgorithm := verticalAlgorithm(counter1, counter2);
            computerPlayingAlgorithm := horizontalAlgorithm(counter1, counter2);
            computerPlayingAlgorithm := positiveDiagonalAlgorithm(counter1, counter2);
            computerPlayingAlgorithm := negativeDiagonalAlgorithm(counter1, counter2);
          end;

      if computerPlayingAlgorithm = 0 then
      begin
        randomize;
        computerPlayingAlgorithm := (random(7) + 1);
      end;

    end;

  end;

  procedure inicializeVariables;

  var
    counter1, counter2: integer;

  begin

    for counter1 := 1 to 7 do
      for counter2 := 1 to 6 do
        Board[counter1, counter2] := 0;

    turn := 1;
    computerTurn := True;
    piece := 1;

  end;

  procedure turns;

  begin

    if (turn mod 2 <> 0) then
      computerTurn := True
    else
      computerTurn := False;

  end;

  procedure play;

  begin

    if computerTurn then
    begin
      piece := 1;
      board[computerPlayingAlgorithm(turn), falling(computerPlayingAlgorithm(turn))] :=
        piece;
      writeln(computerPlayingAlgorithm(turn));
    end
    else
    begin
      piece := 2;
      repeat
        readln(X);
      until (X > 0) and (X < 8);
      board[X, falling(x)] := piece;
    end;

    turn := turn + 1;

  end;


begin
  inicializeVariables;
  for counter := 1 to 40 do
  begin
    turns;
    play;
  end;
end.
