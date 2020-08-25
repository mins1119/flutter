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

  print('a union b = ${a.union(b)}');
  print('a intersection b = ${a.intersection(b)}');
  print('a difference b = ${a.difference(b)}');
}