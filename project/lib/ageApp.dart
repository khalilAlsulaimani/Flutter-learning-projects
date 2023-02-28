import 'dart:io';
void main(){
  print("enter your birth year ");
  var birth_year = stdin.readLineSync();
  var age = DateTime.now().year - num.parse(birth_year!);
  print("your age is $age years old");
}