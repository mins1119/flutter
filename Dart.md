# 플러터 									

## 안드로이드 스튜디오 단축키

- [Ctrl] + [B] 메소드 안으로 들어가기
- [Shift] + [Shift] 검색하기
- [Ctrl] + [Crtl] 실행하기
- [Shift] + [F10] 최근 실행파일 재실행
- [Ctrl] + [ <-] 뒤로 돌아가기 (navigate back)
- [Ctrl] + [ -> ] 앞으로 가기 (navigate forward)
- [Ctrl] + [Alt] + [L] 코드 포맷 맞추기

## 다트 Dart

### 특징

- 생산성 : 문법이 깔끔하고 간결하다.  핫로드를 제공하여 개발 주기가 빨라졌다.

- 속도 : 런타임 성능과 시작 시간이 빨라졌다.
- 이식성 : 안드로이드 , IOS, 웹에 이식이 가능하다.
- 리액티브 : 언어 수준에서 리액티브 프로그래밍을 지원한다.

> 들여쓰기는 2칸



### 주석

-------------------------------

```flutter
//1. 한줄 주석

/*
*2. 여러 줄 주석
*/

///
///3. 여러 줄 주석
///
```



### 변수

------------------------------

| 구분      | 데이터 타입 | 비고                                                         |
| --------- | ----------- | ------------------------------------------------------------ |
| 수치형    | int         | -2^63 ~ 2^63-1<br />-2^53 ~ 2^53-1 (자바스크립트로 컴파일 되는 경우) |
|           | double      | IEEE 754 표준                                                |
|           | num         | int 와 double의 상위 타입                                    |
| 부울형    | bool        | true/fase                                                    |
| 문자형    | String      | 문자열은 홑따옴표를 권장한다.                                |
| 동적 타입 | var         | 변수 할당시 타입이 지정된다                                  |
|           | dynamic     | 타입을 특정하지 않는다                                       |
| 리스트    | List        | 다트에 배열은 존재하지 않는다.                               |
| 집합      | Set         |                                                              |
| 맵        | Map         |                                                              |

```dart
void main() {
  int num1 = 100;
  double num2 = 3.14;
  //num 은 실수 정수 모두 가능
  num num3 = 100;
  num num4 = 3.14;

  double sum1 = num1 + num2;
  print(sum1);

  num sum2 = num3 * num4;
  print(sum2);

  String text = 'Alice in wonderland';
  String name = 'Alice';
  String hello = 'Hello, ${name}';
  print(text.substring(0, 5));
  print(hello);
}
/*
103.14
314.0
Alice
Hello, Alice
*/
```

```dart
void main(){
  String str1 = 'Alice';
  String str2 = 'wonderland';
  String plus = str1 + ' in '+str2;
  int len = plus.length;
  print(plus+' => length : $len');

  bool a = true;
  bool b = false;
  bool chk = a&&b;
  print('chk is $chk');

  var strLen = len;
  var text = str1;
  var check = chk;
  var variable = text;	//var 형식으로 선언했기떄문에 알어서 String형식으로 인식한다.
  print('$strLen, $text, $check, $variable');

//  variable = chk;   String 형식으로 인식된 variable에 bool 타입을 할당하려 했기 때문에 오류 발생
//  print('$variable');
}
/*
Alice in wonderland => length : 19
chk is false
19, Alice, false, Alice
*/
```

### 연산자

---------------------

c와 자바에서 제공하는 기본적인 연산자의 대부분을 사용할 수 있다. 

| 구분                    | 연산자                     | 비고                                                         |
| ----------------------- | -------------------------- | ------------------------------------------------------------ |
| 할당 연산자             | =, +=, -=, *=, /=, %=, ??= | ??= : null인 경우에만 우변의 값을 할당                       |
| 산술 연산자             | +, - *, /, %, ++, --, ~/   | ~/ : 몫 반환                                                 |
| 관계 연산자             | <, >, <=, >= , ==, !=      |                                                              |
| 논리 연산자             | &&, \|\|                   |                                                              |
| 삼항 연산자             | ?                          |                                                              |
| 타입 테스트 연산자      | as                         | 타입을 강제로 형변환                                         |
|                         | is                         | 객체가 특정 타입이면 true                                    |
|                         | Is!                        | 객체가 특정 타입이면 false                                   |
| if null 연산자          | 표현식1 ?? 표현식2         | null이 아니면 표현식1, null이면 표현식2 반환                 |
| 캐스케이드 연산자       | ..                         | 동일한 객체로 다수의 메소드 호출이 이뤄지는 경우, 가독성을 위해 사용 |
| 조건적 멤버 접근 연산자 | ?.                         | null값이아니면 멤버가 반환된다. null값이어도 비정상정료되지 않는다. |

```dart
void main() {
  int num = 00;
  num += 1;
  print('num = $num');

  const double PIE = 3.14;
  if (PIE >= 3) {
    print('PIE는 3이상이다.');
  }

  // ??=
  var a = 'Alice';
  var b = null;
  a ??= 'test';
  b ??= 'test';
  print('a = $a, b = $b'); 
  // ~/
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
/*
num = 1
PIE는 3이상이다.
a = Alice, b = test
2
비밀번호를 다시 입력하세요
로그인성공
*/
```

```dart
import 'atm_v1.dart';

void main() {
    //타입테스트 연산자
  var account = Account('111-222-333', 50000);
  if (account is Account) {
    String name = account.accountNumber;
    int amount = (account as Account).balance;
    print('account name is $name, amount is $amount');
  }
    //if null 연산자
  String loginAccount = null;
  String playerName = loginAccount ?? 'Guest';
  print('Login Player is $playerName');
    //캐스케이드 연산자
  Account account2 = Account('111-222-333-1',60000)
  ..deposit(5000)
  ..transfer(account, 10000)
  ..withdraw(15000);
  print('account2 balance is ${account2.balance}');
    //조건적 멤버 접근 연산자
  Account account3 = Account(null, 6000);
  print('account3 is ${account3?.accountNumber}');
}


/*
account name is 111-222-333, amount is 50000
Login Player is Guest
account2 balance is 40000
account3 is null
*/

// atm_v1.dart
//void main() {
//  //1. 계좌 생성
//  Account account1 = new Account("117-123-1", 20000);
//  Account account2 = new Account("117-123-2", 5000);
//
//  //2. 잔고 확인
//  print('account1 has ${account1.balance} won');
//  print('account2 has ${account2.balance} won');
//
//  //3. 금액 인출
//  account1.withdraw(7000);
//  print('account1 has ${account1.balance} won (7000 won is withrawn)');
//
//  //4. 계좌 이체
//  account1.transfer(account2, 5000);
//  print('account2 has ${account2.balance} won (5000 won is deposited)');
//  print('account1 has ${account1.balance} won');
//}
//
//class Account {
//  String accountNumber;
//  int balance;
//
//  Account(this.accountNumber, this.balance);
//
//  bool withdraw(int amount) {
//    if(balance > amount) {
//      balance -= amount;
//      return true;
//    }
//
//    return false;
//  }
//
//  bool deposit(int amount) {
//    balance += amount;
//    return true;
//  }
//
//  bool transfer(Account dest, int amount) {
//    if (balance > amount) {
//      balance -= amount;
//      dest.deposit(amount);
//      return true;
//    }
//
//    return false;
//  }
//}
```

### 조건문과 제어문

--------------------------

#### if ( expression )

```dart
if ( 조건식 ){
    //
} else if ( 조건식 ){
    //
}else{
    //
}
```

조건식을 검사하여 참, 거짓을 판별한다.

#### for

```dart
for ( 초기화식; 조건식; 반복식)
```

```dart
for ( var x in List or Set)
```

조건식을 만족할 때까지 반복한다.

List나 Set형에서 foreach와 같은 기능을 수행하도록 사용할 수 있다.

#### while

```dart
while (조건식)

	반복 실행할 코드
```

조건식을 만족할때까지 반복한다.

#### do ~ while

```dart
do{
	//반복 실행할 코드 블록
}
while( 조건식 );
```

조건 판별 전 do문을 실행한다.

#### switch /  case

```da
switch ( 조건식 )
{
    case 상수1:	//조건식이 상수 1일때
        //실행할 코드
        break;
    case 상수N:	//조건식이 상수N일때
        //실행할 코드
        break;
}
```

조건에 따라 다른값을 명시하고 싶을 때 사용한다.

```dart
void main() {
  //1. if
  int even = 78;
  int odd = 99;
  if (even % 2 == 0) {
    print('$even is even number');
  }

  if (odd % 2 == 0) {
    print('$odd is not even number');
  } else {
    print('$odd is odd number');
  }

  //2. for
  List<String> fruits = ['Apple', 'Strawberry', "Pineapple"];
  for (String fruit in fruits) {
    print('I like $fruit');
  }

  //3. while
  List<num> numbers = [1, 0, -1];
  int i = 0;
  while (numbers[i] > 0) {
    print('${numbers[i]} is positive');
    i = i + 1;
  }

  //4. do-while
  int j = 5;
  do {
    print(j);
    j--;
  } while (j > 0);

  //5. switch / case
  List<num> httpCodes = [200, 401, 500];
  for (num http in httpCodes) {
    switch (http) {
      case 200:
        print('200 is OK');
        break;
      case 401:
        print('400 is Unautherized');
        break;
      case 500:
        print('500 is Internal Server Error');
        break;
    }
  }
}
/*
78 is even number
99 is odd number
I like Apple
I like Strawberry
I like Pineapple
1 is positive
5
4
3
2
1
200 is OK
400 is Unautherized
500 is Internal Server Error
*/
```

### final, const, static

-----------------------

#### final

변수를 참조하는 값이 설정되면 다른 겂으로 변경할 수 없다.

#### const

상수를 만든다.

#### static

인스턴스를 만들지 않고 겂을 출력할 수 있다.

```dart
void main() {
  //1. final
  final String name = 'Alice';
  //name = 'Lorina'; 할당된 값을 변경할 수 없다.

  //2. const
  const int STUDENTS_MAX = 100;
  const double PIE = 3.141;

  //3. static
  print('Queue initial capacity is ${Queue.initialCapacity}');
}

class Queue {
  static const initialCapacity = 12;
}
/*
Queue initial capacity is 12
*/
```

### 함수

-------------------

![](https://user-images.githubusercontent.com/40557177/90963635-6bcd6f00-e4f4-11ea-838e-549c775490d1.png)

- 중복호출

  함수의 중복 및 연쇄호출이 가능하다. 

- 선택인자 ( positional optional parameter )

  대괄호([])는 선택적 위치 매개변수를 지정하기 위해 사용한다.  설정하지 않은 매개변수의 값은 **null**이지만 기본값을 설정할 수 있다.

- 이름 있는 인자 ( named optional parameter)

  선택적 네임드 매개변수는 {}로 정의한다. 네임드 매개변수를 가진 함수를 호출 할 때는 반드시 "매개변수이름: 값"과 같은 맵형식을 이용한다.

```dart
void main(){
    // 함수 호출
  int a = 100;
  int b = 200;
  int c = _getBigger(a,b);
  print('_getBigger(a,b) = $c');
    
	// 중복 호출
  String str = 'apple';
  String addBrace = addSuffix(addPrefix(str,'('),')');
  print(addBrace);
    
	// 선택 인자 (positional optional parameter)
  int num1 = 100;
  int num2 = addNumber(100);		//inc = 1
  int num3 = addNumber(100,20);		//inc = 20
    
	// 이름있는 인자 (named optional parameter)
  String http1 = getHttp('http://naver.com',port:80);
  String http2 = getHttp('http://localhost');
  print(http1);
  print(http2);
}
String getHttp(String url,{int port = 8080}){
  return 'get http from $url,port =$port';
}
int addNumber(int num,[int inc = 1]) => num + inc;	//선택인자의 기본값 1지정

String addPrefix(String str,String prefix) => '$prefix $str';

String addSuffix(String str, String suffix) => '$str $suffix';

int _getBigger(int a, int b){
  if(a >= b) return a;
  return b;
}
/*
_getBigger(a,b) = 200
( apple )
get http from http://naver.com,port =80
get http from http://localhost,port =8080
*/
```



### 객체와 클래스

------------------

다트는  객체( object )로 이루어져 있다. 기본 데이터 뿐만 아니라 Stateless 위젯과 Stateful 위젯과 같이 UI를 구성하는 위젯 역시 클래스이다.



```dart
void main(){
  Game game1 = Game('Star Craft','Strategy');
  Game game2 = ArcadeGame('Strike1945','shooting',true);

  print('game1 is ${game1.name}');
  print('gamw2 is ${game2.name}');

  game1.genre = 'Realtime Strategy';

  game1.play();
  game2.play();
}
// 부모 클래스
class Game{
  String _name;
  String _genre;
	//생성자 : 멤버변수를 초기화한다.
  Game(this._name, this._genre);
  String get name => _name;
  set genre(g) => this._genre = g;

  void play(){
    print('play $name game($_genre)');
  }
}
// Game을 상속받는 자식 클래스
class ArcadeGame extends Game{
  bool _joyStickSupport = false;
	//생성자 : 멤버 변수를 초기화 한다.
  ArcadeGame(String name, String genre, this._joyStickSupport) : super(name,genre);

  @override
  void play(){
    print('$name supports joystick? $_joyStickSupport');
  }
}
/*
game1 is Star Craft
gamw2 is Strike1945
play Star Craft game(Realtime Strategy)
Strike1945 supports joystick? true
*/
```



### 기본 자료구조

------------

언어 수준에서 기본적인 자료구조를 지원하기 떄문에 소스코드의 가독성이 좋다.



#### List ( 리스트 )

- 타언어의 배열과 같은 역할을 하며 같은 데이터 타입을 여러개 저장할 수 있는 자료구조
- 대괄호 ([])로 선언한다.
- 자동으로 크기를 할당해주기 때문에 크기를 할당해야하는 번거로움이 없다.

```dart
void main(){
  List<int> numbers = [ 1,2,3,4];
  List<int> evens = [2,4,6,8];

  List<String> Disney = ['Alice','Belle','Ariel'];
  List<String> Hasbro = ['Optimus','Bumblebee','Megatron'];

  print('numbers are $numbers');
  print('first number is ${numbers[0]}');
  print('last number is ${numbers[numbers.length -1]}');

  for(int each in evens){
    print('each even number is $each');
    List<int> evenFromZero = [0,...evens];
  }
  List<String> allChar = Disney + Hasbro;
  print(' All Characters are $allChar');
}
/*
numbers are [1, 2, 3, 4]
first number is 1
last number is 4
each even number is 2
each even number is 4
each even number is 6
each even number is 8
All Characters are [Alice, Belle, Ariel, Optimus, Bumblebee, Megatron]
 */
```

#### Set ( 집합 )

-  같은 데이터 타입을 여러개 저장할 수 있는 자료구조

- 중괄호 ({}) 로 선언하며 중복을 허용하지 않는다.

```dart
void main() {
  Set<int> naturalNumbers = {1, 2, 3, 4, 1}; //실제값 {1, 2, 3, 4}
  Set<String> ids = {"X-3", "X-2", "X-1"};
  
  print('numbers are $naturalNumbers');
  print('ids are $ids'); //not sorted
  //print('first number is ${numbers[0]}'); 
  
  for (int each in naturalNumbers) {
    print('each number is $each');
  }

  //Set<int> integers = { 0 } + naturalNumbers; 
  
  Set<int> a = {100, 200, 300};
  Set<int> b = {100, 200, 500, 1000};
//union(합집합), intersection(교집합), differnce(차집합)의 메소드가 있다.
  print('a union b = ${a.union(b)}');
  print('a intersection b = ${a.intersection(b)}');
  print('a difference b = ${a.difference(b)}');
}
/*
numbers are {1, 2, 3, 4}
ids are {X-3, X-2, X-1}
each number is 1
each number is 2
each number is 3
each number is 4
a union b = {100, 200, 300, 500, 1000}
a intersection b = {100, 200}
a difference b = {300}
*/
```

#### Map( 맵 )

- 키와 값의 구조로 이루어진 자료구조
- 중괄호({})로 선언한다.
- 맵의 값을 얻기위해서 키 값을 입력한다.
- 맵에는 데이터 타입뿐만 아니라 어떤 객체도 넣을수 있다.

```dart
void main() {
  Map<int, String> intMap = {0: 'Alice', 50: 'Belle', 100: 'Cinderella'};

  print('intMap is $intMap');
  print('intMap[0] : ${intMap[0]}');
  intMap.update(50, (val) => 'Ariel');
  print('intMap[50] : ${intMap[50]}');

  Map<String, Student> students = {
    'Alice': Student('Alice', 'Liddel', 'wonderland@gmail.com'),
    'Optimus': Student('Optimus', 'Prime', 'cybertron@gmail.com'),
    'Lorina': Student('Lorina', 'Liddel', 'Daisy@gmail.com'),
  };

  String fullName =
      students['Optimus'].firstName + ' ' + students['Optimus'].lastName;
  print('Optimus\'s full name is $fullName');

  String email = students['Alice'].Email;
  print('Alice\'s email is $email');
}

class Student {
  String firstName;
  String lastName;
  String Email;

  Student(this.firstName, this.lastName, this.Email);
}
/*
intMap is {0: Alice, 50: Belle, 100: Cinderella}
intMap[0] : Alice
intMap[50] : Ariel
Optimus's full name is Optimus Prime
Alice's email is wonderland@gmail.com
*/
```



### 표준 라이브러리

------------------------------

- dart : core 패키지
- dart : io 패키지
- dart : math 패키지
- dart : convert 패키지



#### dart:io 패키지

사용자에게 입력을 받거나 파일을 읽고 쓰는 입출력 동작을 제공한다.

- 사용자 입력받기
- 새로운 파일을 생성하고 파일에서 값 읽기
- 파일에 쓰기

```dart
import 'dart.io';	//패키지 임포트
```

```dart
import 'dart:io';

void main() {
  // 새로운 파일 생성
  File newFile = File('temp_file.txt');
  newFile.createSync();
  // 파일읽기 (동기방식)
  File poem = File('poem.txt');
  List<String> lines = poem.readAsLinesSync();
  for (String line in lines) {
    print(line);
  }
  // 파일쓰기 (동기방식)
  File memoFile = File('diary.txt');
  String contents = """
앨리스는 강둑에서 하는 일도 없이 언니 옆에 앉아있는 것이 슬슬 지겨워졌다.
""";
  memoFile.writeAsStringSync(contents);
}
```



#### dart:math 패키지

수학에 관한 내용을 다룬다. 최댓값, 최솟값을 구하거나 난수를 생성하거나 삼각함수와 제곱근 같은 기초적인 수학함수를 포함한다.

```dart
import 'dart:math';

void main() {
  List<int> numbers = [100, 200, 300, 400, 250];

  // 최댓값, 최소값
  int maxValue = max(numbers[0], numbers[1]);
  int minValue = min(numbers[2], numbers[3]);
  print('max(100, 200) is $maxValue');
  print('min(300, 400) is $minValue');
  // 제곱근
  double sqaureRooted = sqrt(numbers[4]);
  print('sqrt(250) is $sqaureRooted');
  // 난수 발생
  List<int> randomNumbers = _makeRandomNumbers(10, 8);
  print('random number(0..9) is $randomNumbers');
  // 반올림은 math 패키지가 아님
  double doubleValue = 500.51;
  int rounded = doubleValue.round();
  print('500.51 rounds $rounded');
}
List<int> _makeRandomNumbers(int max, int counts) {
  Random rand = Random();
  List<int> res = List();
  for (int i=0; i< counts; ++i) {
    res.add(rand.nextInt(max)); //0과 max-1 사이
  }

  return res;
}
/*
max(100, 200) is 200
min(300, 400) is 300
sqrt(250) is 15.811388300841896
random number(0..9) is [8, 5, 7, 6, 2, 7, 6, 3]
500.51 rounds 501
*/
```



#### dart:convert 패키지

JSON ( JavaScript Object Notation) 형식을 다루는데 사용한다. 

- josnDecode() : 문자열을 입력받아 JSON 데이터를 파싱하여 적절한 다트의 자료구조로 변환해준다.
- readAsStringaSync() : File클래스로 파일을 열고각 행의 내용을 저장

```dart
import 'dart:convert';
import 'dart:io';

void main() {
  //1. JSON 문자열 파싱하기
  String jsonStr = """
  {"Disney" : {
    "Alice" : 10,
    "Belle" : 16,
    "Cinderella" : 17
    }  
  }
  """;
  Map json = jsonDecode(jsonStr);
  Map disney = json["Disney"];
  int alice = disney["Alice"];
  int belle = disney["Belle"];
  int cindy = disney["Cinderella"];
  print("ALice is $alice");
  print("Belle is $belle");
  print("Cinderella is $cindy");

  //2. JSON 파일 읽기
  Map disneyMap = _readJson('disney.json');
  print('ALice was ${disneyMap["Alice"]}');

  //3. JSON 파일 쓰기
  disneyMap.update('Alice', (v) => 11);
  File('disney.json').writeAsStringSync(jsonEncode(disneyMap));

  Map updated = _readJson('disney.json');
  int AliceNow = updated["Alice"];
  print('now Alice is $AliceNow');
}

Map _readJson(String fileName) {
  String contents = File(fileName).readAsStringSync();
  print('contents : $contents');
  return jsonDecode(contents);
}
/*
ALice is 10
Belle is 16
Cinderella is 17
contents : {"Alice" : 10,"Belle" : 16,"Cinderella" : 17}
ALice was 10
contents : {"Alice":11,"Belle":16,"Cinderella":17}
now Alice is 11

*/
```

