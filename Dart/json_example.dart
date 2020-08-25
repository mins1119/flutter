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