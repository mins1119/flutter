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
  var variable = text;
  print('$strLen, $text, $check, $variable');

//  variable = chk;
//  print('$variable');
}