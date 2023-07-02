import 'dart:io';
import 'package:helloworld/helloworld.dart' as helloworld;

void main(List<String> arguments) {
  // String? name = stdin.readLineSync();
  // int year = int.parse('$name');

  String word = stdin.readLineSync()!;
  Map<String, int?> scores = {
    'A': 1,
    'E': 1,
    'I': 1,
    'O': 1,
    'U': 1,
    'L': 1,
    'N': 1,
    'R': 1,
    'S': 1,
    'T': 1,
    'D': 2,
    'G': 2,
    'B': 3,
    'C': 3,
    'M': 3,
    'P': 3,
    'F': 4,
    'H': 4,
    'V': 4,
    'W': 4,
    'Y': 4,
    'K': 5,
    'J': 8,
    'X': 8,
    'Q': 10,
    'Z': 10
  };

  int option = int.parse(word);

  List<int> highScores = [1200, 2000, 1290, 3000];
  highScores.add(2100);
  highScores.add(3050);
  highScores.add(1500);

  final (latitude:hello,longitude:bye) = helloworld.location();
  print((hello, bye));
}
