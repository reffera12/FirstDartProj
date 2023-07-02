import 'package:features/card.dart';

sealed class Hand {
  const Hand();

  Hand extractHand(Card card) => switch (this) {
        ThreeCards(cards: final cards) => switch (cards) {
            (final card1, final card2, final card3) when card1 == card =>
              TwoCards((card2, card3)),
            (final card1, final card2, final card3) when card2 == card =>
              TwoCards((card1, card3)),
            (final card1, final card2, final card3) when card3 == card =>
              TwoCards((card1, card2)),
            _ => throw "No matching card! ($card in $cards)",
          },
        TwoCards(cards: final cards) => switch (cards) {
            (final card1, final card2) when card1 == card => OneCard(card2),
            (final card1, final card2) when card2 == card => OneCard(card1),
            _ => throw "No matching card! ($card in $cards)",
          },
        OneCard(card: final singleCard) when singleCard == card => NoCard(),
        _ => throw "No matching card! ($card in $this)",
      };
}

class ThreeCards extends Hand {
  final (Card, Card, Card) cards;
  const ThreeCards(this.cards);
}

class TwoCards extends Hand {
  final (Card, Card) cards;
  const TwoCards(this.cards);
}

class OneCard extends Hand {
  final Card card;
  const OneCard(this.card);
}

class NoCard extends Hand {}
