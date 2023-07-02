sealed class Suit {
  const Suit();
  String get symbol;

  @override
  String toString() => symbol;
}

class Club extends Suit {
  const Club();
  @override
  String get symbol => "♣";
}

class Hearts extends Suit {
  const Hearts();
  @override
  String get symbol => "♥";
}

class Diamond extends Suit {
  const Diamond();
  @override
  String get symbol => "♦";
}

class Spade extends Suit {
  const Spade();
  @override
  String get symbol => "♠";
}
