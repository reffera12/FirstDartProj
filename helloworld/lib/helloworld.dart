import 'dart:math';

int calculate() {
  return 6 * 7;
}

String displayName() {
  return 'Iliyan';
}

String? twoFer(String? name) {
  if (name != '') {
    return name;
  } else {
    name = 'you';
    return name;
  }
}

bool leapYear(int year) {
  if (year % 4 == 0 && year % 100 != 0 || year % 400 == 0) {
    return true;
  } else if (year % 100 == 0) {
    return false;
  }
  return false;
}

int calculateScore(Map<String, int?> scores, String word) {
  int sum = 0;
  word.toUpperCase().split('').forEach((element) {
    sum = sum + (scores[element] ?? 0);
  });
  return sum;
}

bool armstrongNumber(String number) {
  var digits = number.split('');
  var convertedNumber = 0;
  for (var element in digits) {
    convertedNumber += pow(int.parse(element), digits.length).toInt();
  }

  if (number == convertedNumber.toString()) return true;
  return false;
}

highestScore(List<int> scores, int entry) {
  switch (entry) {
    case 1:
      {
        scores.sort();
        return scores.elementAt(scores.length - 1);
      }
    case 2:
      {
        return scores.last;
      }
    case 3:
      {
        scores.sort();
        List<int> result = [];
        for (int i = 1; i < 4; i++) {
          result.add(scores.elementAt(scores.length - i));
        }
        return result;
      }
  }
}

double squaresDifference(int elementCount) {
  int sum = 0;
  double sqrSum =
      (elementCount * (elementCount + 1) * (2 * elementCount + 1)) / 6;
  for (int i = 1; i <= elementCount; i++) {
    sum += i;
  }
  return pow(sum, 2) - sqrSum;
}

({double latitude, double longitude}) location() {
  return (latitude: 32.23, longitude: 12.32);
}
