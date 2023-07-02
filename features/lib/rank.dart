sealed class Rank {
  const Rank();
  int get value;

  @override
  String toString() => "$value"; 
}

class Two extends Rank {
  const Two();
  @override
  int get value => 2;
}

class Three extends Rank {
  const Three();
  @override
  int get value => 3;}

class Four extends Rank {
  const Four();
  @override
  int get value => 4;}

class Five extends Rank {
  const Five();
  @override
  int get value => 5;}

class Six extends Rank {
  const Six();
  @override
  int get value => 6;}

class Seven extends Rank {
  const Seven();
  @override
  int get value => 7;}

class Eight extends Rank {
  const Eight();
  @override
  int get value => 8;}

class Nine extends Rank {
  const Nine();
  @override
  int get value => 9;}

class Ten extends Rank {
  const Ten();
  @override
  int get value => 10;}

class Jack extends Rank {
  const Jack();
  @override
  int get value => 11;}

class Queen extends Rank {
  const Queen();
  @override
  int get value => 12;}

class King extends Rank {
  const King();
  @override
  int get value => 13;}

  class Ace extends Rank {
  const Ace();
  @override
  int get value => 14;
}
