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
