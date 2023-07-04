import 'dart:io';

const int ROWS = 3;
const int COLS = 3;
const String delimiter = "-------------";
List<List<int>> winningCombos = [
  // Horizontal lines
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],

  // Vertical lines
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],

  // Diagonal lines
  [0, 4, 8],
  [2, 4, 6],
];

List<List<String>> InitializeBoard() {
  var board =
      List.generate(ROWS, (_) => List.filled(COLS, ''), growable: false);
  return board;
}

void PrintBoard(List<List<String>> board) {
  for (int r = 0; r < ROWS; r++) {
    print(delimiter);
    for (int c = 0; c < COLS; c++) {
      stdout.write("|  ");
      stdout.write(board[r][c]);
      stdout.write(" ");
    }
    print("|");
  }
  print(delimiter);
}

bool MakeMove(int row, int col, List<List<String>> board,
    (String name, String symbol) player) {
  if (row >= 0 &&
      row < ROWS &&
      col < COLS &&
      col >= 0 &&
      board[row][col] == ' ') {
    board[row][col] = player.$2;
    return true;
  }
  return false;
}

bool checkForWin(List<List<String>> board) {
  return isHorizontalLine(board) ||
      isVerticalLine(board) ||
      isDiagonalLine(board);
}

bool isLine(List<List<String>> board, {int index1 = 0, int index2 = 0}) {
  if (board[index1][index2] == board[index1][index2 + 1] &&
      board[index1][index2 + 1] == board[index1][index2 + 2] &&
      board[index1][index2] != ' ') {
    return true;
  }
  return false;
}

bool isHorizontalLine(List<List<String>> board) {
  for (int r = 0; r < ROWS; r++) {
    if (isLine(board, index1: r)) {
      return true;
    }
  }
  return false;
}

bool isVerticalLine(List<List<String>> board) {
  for (int c = 0; c < COLS; c++) {
    if (isLine(board, index2: c)) {
      return true;
    }
  }
  return false;
}

bool isDiagonalLine(List<List<String>> board) {
  // Check for top-left to bottom-right diagonal line
  if (board[0][0] == board[1][1] &&
      board[1][1] == board[2][2] &&
      board[0][0] != ' ') {
    return true;
  }

  // Check for top-right to bottom-left diagonal line
  if (board[0][2] == board[1][1] &&
      board[1][1] == board[2][0] &&
      board[0][2] != ' ') {
    return true;
  }
  return false;
}

bool isBoardFull(List<List<String>> board) {
  for (int r = 0; r < ROWS; r++) {
    for (int c = 0; c < COLS; c++) {
      if (board[r][c] == ' ') {
        return false;
      }
    }
  }
  return true;
}

int getBestMove(List<List<String>> board) {
  // Use a heuristic algorithm to determine the best play

  // Initial rank based on the number of winning combos
  // that go through the cell
  List<int> cellRank = [3, 2, 3, 2, 4, 2, 3, 2, 3];

  // Demote any cells already taken
  for (int i = 0; i < board.length; i++) {
    int row = i ~/ 3;
    int col = i % 3;
    if (board[row][col] != ' ') {
      cellRank[i] -= 99;
    }
  }

  // Look for partially completed combos
  for (List<int> combo in winningCombos) {
    int a = combo[0];
    int b = combo[1];
    int c = combo[2];

    if (board[a ~/ 3][a % 3] == board[b ~/ 3][b % 3]) {
      if (board[a ~/ 3][a % 3] != ' ' && board[c ~/ 3][c % 3] == ' ') {
        cellRank[c] += 10;
      }
    }

    if (board[a ~/ 3][a % 3] == board[c ~/ 3][c % 3]) {
      if (board[a ~/ 3][a % 3] != ' ' && board[b ~/ 3][b % 3] == ' ') {
        cellRank[b] += 10;
      }
    }

    if (board[b ~/ 3][b % 3] == board[c ~/ 3][c % 3]) {
      if (board[b ~/ 3][b % 3] != ' ' && board[a ~/ 3][a % 3] == ' ') {
        cellRank[a] += 10;
      }
    }
  }

  // Determine the best move to make
  int bestCell = -1;
  int highest = -999;

  // Step through cellRank to find the best available score
  for (int j = 0; j < board.length; j++) {
    if (cellRank[j] > highest) {
      highest = cellRank[j];
      bestCell = j;
    }
  }

  return bestCell;
}
