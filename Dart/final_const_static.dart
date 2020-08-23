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