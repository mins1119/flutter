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