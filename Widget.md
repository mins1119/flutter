# Widget

| 종류     | 위젯 클래스          | 기능                                       | 위젯 종류 |
| -------- | -------------------- | ------------------------------------------ | --------- |
| 구조     | MaterialApp          | 머티리얼 디자인을 따르는 앱 구성           | Stateful  |
|          | Scaffold             | 머티리얼 디자인을 따르는 기본 레이아웃     | Stateful  |
|          | AppBar               | 머티리얼 디자인을 따르는 앱 바             | Stateful  |
|          | FloatingActionButton | 머티리얼 디자인을  따르는 플로팅 액션 버튼 | Stateless |
| 기초     | Text                 | 텍스트 표시                                | Stateless |
|          | Image                | 이미지 표시                                | Stateful  |
|          | RaisedButton         | 버튼 표시                                  | Stateless |
|          | ListView             | 목록 표시( 동적 / 정적 데이터 )            | Stateless |
| 레이아웃 | Container            | 단일 위젯 표시                             | Widget    |
|          | Row                  | 가로 방향 레이아웃                         | Widget    |
|          | Column               | 세로 방향 레이아웃                         | Widget    |
|          | Center               | 가운데 정렬 레이아웃                       | Widget    |
| 파생     | Hero                 | 히어로 애니메이션을 제공하는 위젯          | Stateful  |
|          | CircleAvatar         | 둥근 모양으로 사용자 표시                  | Stateless |
|          | SizedBox             | 특정 너비/ 높이를 갖는 상자 표시           | Widget    |
|          | TextFormField        | 텍스트 필드를 갖는 폼(form) 표시           | Stateful  |
|          | ListTile             | 고정 높이를 갖는 리스트뷰의 행 표시        | Stateless |
|          | Icon                 | 간단한 이미지 아이콘 표시                  | Stateless |

## Material Component Widget

### MaterialApp

- 화면 이동( Routes )과 테마지정

```dart

```



### Scaffold

화면 표시 

### AppBar



## Basic Widget

### Text

```dart
생성자
```



```dart
import 'package:flutter/material.dart';

void main() => runApp(TextDemo());

class TextDemo extends StatelessWidget {
  static const String _title = "Text 위젯 데모";
  static const String _name = 'Alice';
  static const String _longText = """
앨리스는 강둑에 앉아 책을 읽는 언니를 바라보았다. 혹시나 싶어 책을 뒤적여보았지만 그림이라곤 찾아볼 수 없었다.  """;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _title,
        home: Scaffold(
          appBar: AppBar(title: Text(_title)),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("text test"),
              Text(			//텍스트 스타일을 적용한다.
                'Styled Text with $_name',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0, 
                    background: Paint()
                      ..color = Color(0xFFDCEDC8)
                      ..style = PaintingStyle.fill,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                _longText,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        )
    );
  }
}
```



### Image

```dart
생성자
```



```dart
import 'package:flutter/material.dart';

void main() => runApp(ImageDemo());

class ImageDemo extends StatelessWidget {
  static const String _title = "Image 위젯 데모";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _title,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text(_title)),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/Alice.jpg'),
              Image.asset('assets/Daisy.jpg'),
            ],
          ),
        )
    );
  }
}
```

이미지를 추가할 때는 파일을 프로젝트의 assets 폴더 하위에 위치시키고, pubspec.yaml 에 등록해야한다.

```daet
assets : 
	- assets/Alice.jpg
	- assets/Daisy.jpg
```

### RaisedButton

버튼은 모양이나 텍스트를 표시하고 버튼을 눌렀을때 이벤트를 받아 처리한다.

```dart
import 'package:flutter/material.dart';

void main() => runApp(ButtonDemo());

//ButtonDemo 클래스는 StatelessWidget이 아니라 StatefulWidget클래스를 사용한다.
//버튼을 눌렀을 때 버튼 이벤트에 따라 화면을 갱신해야하기 때문에
class ButtonDemo extends StatefulWidget {
  @override
  State createState() => ButtonDemoState();
}

class ButtonDemoState extends State<ButtonDemo> {
  static const String _title = "Button 위젯 데모";
  String _buttonState = "OFF";

  void onClick() {
    print('onClick()');
    setState(() {
      if (_buttonState == 'OFF') { //
        _buttonState = 'ON';
      } else {
        _buttonState = 'OFF';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: _title,
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(title: Text(_title)),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text('사각 버튼'),
                onPressed: onClick,
              ),
              Text('$_buttonState'),
              RaisedButton(
                  child: Text("둥근 버튼"),
                  onPressed: onClick, //callback 함수 onClick
                  shape: RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)))
            ],
          ),
        ));
  }
}
```

- onPressed 속성은 반드시 있어야하며, 버튼 이벤트를 처리하는 콜백 함수가 없다면 null을 넣는다.

- 버튼에 들어가는 내용은 child속성에 넣는다.



> **리액티브 프로그래밍 ( Reactive Programming )** : 위젯에 연결된 변수의 값이 변경됐을 때 뷰가 함께 변경되는 방식
>
> 플러터에서는 기본적으로 리액티브 뷰를 지원하므로 더 깔끔하게 코딩이 가능하다. 
>
> 어떤 위젯이든 원하는 멤버 변수( 예 : _buttonState )가 변경되면 그와 연관된 뷰가 모두 업데이트 된다.



### ListView



## Layout Widget

화면에 어떤 내용을 표시하기보다 어떤 위젯을 담고서 그 안에 있는 자식위젯의 위치를 잡아주는 역할을 한다.

### Container

- 1개의 자식위젯을 갖는다.

```dart
생성자
```

> **마진과 패딩의 차이**
>
> 마진( margin )은 위젯 외부의 여백을 의미하며, 패딩은 위젯 내부에서 자식위젯을 배치할 때 활용하는 정보이다.

```dart
import 'dart:ui';

import 'package:flutter/material.dart';

void main() => runApp(ContainerDemo());

class ContainerDemo extends StatelessWidget{
  static const String _title = 'Container Widget Demo';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title : _title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar : AppBar(title: Text(_title)),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
                //컨테이너는 하나의 자식 위젯을 가지기 때문에 child속성에 자식위젯을 배치한다.
              child: Text('단순 컨테이너'),
              padding: EdgeInsets.only(left: 10, top:20, bottom: 20), 
                //EdgeInsets.only() 메소드 : 내부 패딩을 설정한다. 좌우상단의 설정이 가능하다.
            ),
            Container(
                //컨테이너의 하위에는 어떠한 위젯도 들어갈 수 있다. 컨테이너안에 컨테이너를 배치할 수 있다.
              color: Colors.lightBlueAccent,
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 50),
              child: Container(
                color: Colors.yellowAccent,
                child:Text('중첩 컨테이너'),
              ),
            ),
          ],
        )
      ),
    );
  }
}
```

###  Row 

```dart
생성자
```

- mainAxisAlignment : 가로방향 정렬로 기본값은 좌측정렬이다.
- crossAxisAlignment : Row위젯이 가로 방향을 정의하므로 반대방향인 세로정렬방식을 지정한다.
- children : 컨테이너, 텍스트, 이미지 등 어떠한 위젯도 넣을 수 있다.

### Cloumn

```dart

```

- mainAxisAlignment : 세로방향 정렬
- crossAxisAlignment : 가로방형 정렬
- children : 컨테이너, 텍스트, 이미지 등 어떠한 위젯도 넣을 수 있다.

```dart
//로그인 폼 화면


```

