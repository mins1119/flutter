import 'atm_v1.dart';

void main() {
  var account = Account('111-222-333', 50000);
  if (account is Account) {
    String name = account.accountNumber;
    int amount = (account as Account).balance;
    print('account name is $name, amount is $amount');
  }
  String loginAccount = null;
  String playerName = loginAccount ?? 'Guest';
  print('Login Player is $playerName');

  Account account2 = Account('111-222-333-1',60000)
  ..deposit(5000)
  ..transfer(account, 10000)
  ..withdraw(15000);
  print('account2 balance is ${account2.balance}');

  Account account3 = Account(null, 6000);
  print('account3 is ${account3?.accountNumber}');
}
