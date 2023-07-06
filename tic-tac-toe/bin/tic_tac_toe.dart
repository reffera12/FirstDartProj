import 'dart:io';
import 'dart:math';

import 'package:tic_tac_toe/tic_tac_toe.dart' as game_logic;

void main(List<String> arguments) {
  var board = game_logic.InitializeBoard();
  print("Enter your name: ");
  String name = stdin.readLineSync()!;

  int currentPlayer = Random().nextInt(2);
  String firstPlayer = currentPlayer == 0 ? name : "AI";
  String playerSymbol = firstPlayer == name ? "X" : "O";
  String aiSymbol = firstPlayer == "AI" ? "X" : "O";
  print("$firstPlayer starts");

  while (true) {
    game_logic.PrintBoard(board);
    if (currentPlayer == 0) {
      print("$name, enter your move (row column): ");
      int row = int.parse(stdin.readLineSync()!);
      int col = int.parse(stdin.readLineSync()!);
      if (game_logic.MakeMove(row, col, board, playerSymbol)) {
        if (game_logic.checkForWin(board)) {
          game_logic.PrintBoard(board);
          print("You are the winner!");
          break;
        } else if (game_logic.isBoardFull(board)) {
          game_logic.PrintBoard(board);
          print("It's a draw!");
          break;
        }
        currentPlayer = game_logic.togglePlayer(currentPlayer);
      } else {
        print("Invalid move, try again.");
      }
    } else if (currentPlayer == 1) {
      print("AI's move");
      int bestCell = game_logic.getBestMove(board);
      if (game_logic.MakeAiMove(board, bestCell, aiSymbol)) {
        if (game_logic.checkForWin(board)) {
          game_logic.PrintBoard(board);
          print("The computer beat you :(");
          break;
        } else if (game_logic.isBoardFull(board)) {
          game_logic.PrintBoard(board);
          print("It's a draw!");
          break;
        }
        currentPlayer = game_logic.togglePlayer(currentPlayer);
      } else {
        print("Invalid move, try again.");
      }
    }
  }
}
