import 'dart:math';

import 'package:features/card.dart';
import 'package:features/hand.dart';
import 'package:features/rank.dart';
import 'package:features/suit.dart';

List<Card> deck = [
  (Club(), Ace()),
  (Club(), Two()),
  (Club(), Three()),
  (Club(), Four()),
  (Club(), Five()),
  (Club(), Six()),
  (Club(), Seven()),
  (Club(), Eight()),
  (Club(), Nine()),
  (Club(), Ten()),
  (Club(), Jack()),
  (Club(), Queen()),
  (Club(), King()),
//
  (Hearts(), Ace()),
  (Hearts(), Two()),
  (Hearts(), Three()),
  (Hearts(), Four()),
  (Hearts(), Five()),
  (Hearts(), Six()),
  (Hearts(), Seven()),
  (Hearts(), Eight()),
  (Hearts(), Nine()),
  (Hearts(), Ten()),
  (Hearts(), Jack()),
  (Hearts(), Queen()),
  (Hearts(), King()),
  //
  (Diamond(), Ace()),
  (Diamond(), Two()),
  (Diamond(), Three()),
  (Diamond(), Four()),
  (Diamond(), Five()),
  (Diamond(), Six()),
  (Diamond(), Seven()),
  (Diamond(), Eight()),
  (Diamond(), Nine()),
  (Diamond(), Ten()),
  (Diamond(), Jack()),
  (Diamond(), Queen()),
  (Diamond(), King()),
//
  (Spade(), Ace()),
  (Spade(), Two()),
  (Spade(), Three()),
  (Spade(), Four()),
  (Spade(), Five()),
  (Spade(), Six()),
  (Spade(), Seven()),
  (Spade(), Eight()),
  (Spade(), Nine()),
  (Spade(), Ten()),
  (Spade(), Jack()),
  (Spade(), Queen()),
  (Spade(), King()),
];
List<BattleCard> battleDeck = [
  BattleCard(Club(), Ace()),
  BattleCard(Club(), Two()),
  BattleCard(Club(), Three()),
  BattleCard(Club(), Four()),
  BattleCard(Club(), Five()),
  BattleCard(Club(), Six()),
  BattleCard(Club(), Seven()),
  BattleCard(Club(), Eight()),
  BattleCard(Club(), Nine()),
  BattleCard(Club(), Ten()),
  BattleCard(Club(), Jack()),
  BattleCard(Club(), Queen()),
  BattleCard(Club(), King()),
//
  BattleCard(Hearts(), Ace()),
  BattleCard(Hearts(), Two()),
  BattleCard(Hearts(), Three()),
  BattleCard(Hearts(), Four()),
  BattleCard(Hearts(), Five()),
  BattleCard(Hearts(), Six()),
  BattleCard(Hearts(), Seven()),
  BattleCard(Hearts(), Eight()),
  BattleCard(Hearts(), Nine()),
  BattleCard(Hearts(), Ten()),
  BattleCard(Hearts(), Jack()),
  BattleCard(Hearts(), Queen()),
  BattleCard(Hearts(), King()),
  //
  BattleCard(Diamond(), Ace()),
  BattleCard(Diamond(), Two()),
  BattleCard(Diamond(), Three()),
  BattleCard(Diamond(), Four()),
  BattleCard(Diamond(), Five()),
  BattleCard(Diamond(), Six()),
  BattleCard(Diamond(), Seven()),
  BattleCard(Diamond(), Eight()),
  BattleCard(Diamond(), Nine()),
  BattleCard(Diamond(), Ten()),
  BattleCard(Diamond(), Jack()),
  BattleCard(Diamond(), Queen()),
  BattleCard(Diamond(), King()),
//
  BattleCard(Spade(), Ace()),
  BattleCard(Spade(), Two()),
  BattleCard(Spade(), Three()),
  BattleCard(Spade(), Four()),
  BattleCard(Spade(), Five()),
  BattleCard(Spade(), Six()),
  BattleCard(Spade(), Seven()),
  BattleCard(Spade(), Eight()),
  BattleCard(Spade(), Nine()),
  BattleCard(Spade(), Ten()),
  BattleCard(Spade(), Jack()),
  BattleCard(Spade(), Queen()),
  BattleCard(Spade(), King()),
];

class Deck {
  final List<Card> cards;
  const Deck._(this.cards);

  factory Deck.init() => Deck._(deck);

  @override
  String toString() => cards.join('\n');

  bool get isEmpty => cards.isEmpty;

  (Card, Deck) get pickCard {
    final cardIndex = Random().nextInt(cards.length);
    return (
      cards[cardIndex],
      Deck._([
        ...cards.sublist(0, cardIndex),
        ...cards.sublist(cardIndex + 1),
      ])
    );
  }

  Deck get shuffle {
    var source = [...cards];
    for (var i = 0; i < source.length; i++) {
      final newIndex = i + (Random().nextInt(1) * (52 - i)).floor();
      final temp = source[i];
      source[i] = source[newIndex];
      source[newIndex] = temp;
    }
    return Deck._(source);
  }

  (Hand, Deck) get assignHand {
    final (card1, deck1) = pickCard;
    if (deck1.isEmpty) return (OneCard(card1), deck1);
    final (card2, deck2) = pickCard;
    if (deck2.isEmpty) return (TwoCards((card1, card2)), deck2);
    final (card3, deck3) = pickCard;
    return (ThreeCards((card1, card2, card3)), deck3);
  }
}

class BattleDeck {
  final List<BattleCard> battleCards;

  const BattleDeck._(this.battleCards);
  factory BattleDeck.init() => BattleDeck._(battleDeck);

  @override
  String toString() => battleCards.join("\n");
  bool get isEmpty => battleCards.isEmpty;

  BattleDeck get shuffle {
    var source = [...battleCards];
    for (var i = 0; i < source.length; i++) {
      final newIndex = i + (Random().nextInt(52 - i)).floor();
      final temp = source[i];
      source[i] = source[newIndex];
      source[newIndex] = temp;
    }
    return BattleDeck._(source);
  }

  (BattleCard, BattleDeck) get battlingCard {
    return (battleCards[0], BattleDeck._(battleCards.sublist(1)));
  }
}

void battle(BattleCard card1, BattleCard card2, List<int> scores,
    BattleDeck p1Deck, BattleDeck p2Deck) {
  print("PLayer1 Card: ${card1.rank} : ${card1.suit}");
  print("PLayer2 Card: ${card2.rank} : ${card2.suit}");

  if (card1.rank.value > card2.rank.value) {
    scores[0]++;
  } else if (card1.rank.value == card2.rank.value &&
      p1Deck.battleCards.length > 2) {
    print("War!");
    BattleCard p1Card = card1;
    BattleCard p2Card = card2;
    BattleDeck playerOneDeck = p1Deck;
    BattleDeck playerTwoDeck = p2Deck;

    for (int i = 0; i < 3; i++) {
      (p1Card, playerOneDeck) = p1Deck.battlingCard;
      (p2Card, playerTwoDeck) = p2Deck.battlingCard;
    }

    if (p2Card.rank.value < p1Card.rank.value) {
      print("Player 1: ${p1Card.rank.value} Player 2: ${p2Card.rank.value}");
      print("Player 1 wins the war!");
      scores[0]++;
    } else if (p2Card.rank.value > p1Card.rank.value) {
      print("Player 2: ${p2Card.rank.value} Player 1: ${p1Card.rank.value}");
      print("Player 2 wins the war!");
      scores[1]++;
    } else {
      print("Player 2: ${p2Card.rank.value} Player 1: ${p1Card.rank.value}");
      scores[0]++;
      scores[1]++;
      print("Tied!");
    }
  } else if (card1.rank.value < card2.rank.value) {
    scores[1]++;
  }
}
