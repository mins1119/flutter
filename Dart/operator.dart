void main() {
  int num = 00;
  num += 1;
  print('num = $num');

  const double PIE = 3.14;
  if (PIE >= 3) {
    print('PIE는 3이상이다.');
  }

  var a = 'Alice';
  var b = null;
  a ??= 'test';
  b ??= 'test';
  print('a = $a, b = $b');

  print(5 ~/ 2);

  const String PASSWORD = '1234';
  String _input = '12345';
  if (_input == PASSWORD) {
    print('로그인 성공');
  } else {
    print('비밀번호를 다시 입력하세요');
  }

  String _nextInput = '1234';
  String _loginResult = PASSWORD == _nextInput ? '로그인성공' : '로그인 실패';
  print(_loginResult);
}
