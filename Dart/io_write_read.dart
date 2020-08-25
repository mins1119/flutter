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