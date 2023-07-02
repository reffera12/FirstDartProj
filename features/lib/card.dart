import 'package:features/rank.dart';
import 'package:features/suit.dart';

typedef Card = (Suit, Rank);

class BattleCard{
  final Suit suit;
  final Rank rank;

  BattleCard(this.suit, this.rank);
}
