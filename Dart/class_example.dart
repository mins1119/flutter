void main(){
  Game game1 = Game('Star Craft','Strategy');
  Game game2 = ArcadeGame('Strike1945','shooting',true);

  print('game1 is ${game1.name}');
  print('gamw2 is ${game2.name}');

  game1.genre = 'Realtime Strategy';

  game1.play();
  game2.play();
}
class Game{
  String _name;
  String _genre;

  Game(this._name, this._genre);
  String get name => _name;
  set genre(g) => this._genre = g;

  void play(){
    print('play $name game($_genre)');
  }
}
class ArcadeGame extends Game{
  bool _joyStickSupport = false;

  ArcadeGame(String name, String genre, this._joyStickSupport) : super(name,genre);

  @override
  void play(){
    print('$name supports joystick? $_joyStickSupport');
  }
}