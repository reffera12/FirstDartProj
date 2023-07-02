import 'dart:convert';
import 'dart:io';

import 'package:features/card.dart';
import 'package:features/decks.dart';
import 'package:features/hand.dart';

void main() {
  //final deck = Deck.init();
  //var gameDeck = deck.shuffle;
  //Hand hand = NoCard();
  final battleDeck = BattleDeck.init();

  var gameDeck1 = battleDeck.shuffle;
  var gameDeck2 = battleDeck.shuffle;

  int firstPlayerScore = 0;
  int secondPlayerScore = 0;
  List<int> scores = [firstPlayerScore, secondPlayerScore];

  BattleCard battleCard1;
  BattleCard battleCard2;

  assert(
      gameDeck1.battleCards.length == 52 && gameDeck2.battleCards.length == 52);

  while (!gameDeck1.isEmpty || !gameDeck2.isEmpty) {
    (battleCard1, gameDeck1) = gameDeck1.battlingCard;
    (battleCard2, gameDeck2) = gameDeck2.battlingCard;

    battle(battleCard1, battleCard2, scores);

    /* switch (hand) {
      case NoCard():
        print("There are no cards, drawing new cards");
        (hand, gameDeck) = deck.assignHand;
        break;
      case OneCard(card: final pickedCard):
        print("Card: $pickedCard");
        hand = hand.extractHand(pickedCard);
        break;

      case TwoCards(cards: (final card1, final card2)):
        print("Pick a card: 1:$card1, 2: $card2");
        var pickedCard = stdin.readLineSync(encoding: utf8);
        if (pickedCard == "1") {
          hand = hand.extractHand(card1);
          print("Card : $card1");
          break;
        } else if (pickedCard == "2") {
          hand = hand.extractHand(card2);
          print("Card : $card2");
          break;
        } else {
          print("Please type the number of the card you picked");
          break;
        }

      case ThreeCards(cards: (final card1, final card2, final card3)):
        print("Pick a card: 1:$card1, 2: $card2, 3: $card3");
        var pickedCard = stdin.readLineSync(encoding: utf8);
        switch (pickedCard) {
          case '1':
            hand = hand.extractHand(card1);
            print("Card : $card1");
            break;
          case '2':
            hand = hand.extractHand(card2);
            print("Card : $card2");
            break;
          case '3':
            hand = hand.extractHand(card3);
            print("Card : $card3");
            break;
          default:
            print("Please type the number of the card you picked");
        }
    } */
  }
  print(scores[0]);
  print(scores[1]);
  if (scores[0] > scores[1]) {
    print("First player is the winner");
  } else if (scores[1] > scores[0]) {
    print("Second player is the winner");
  } else {
    print("There is no winner");
  }

  print("End");
}
