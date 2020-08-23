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