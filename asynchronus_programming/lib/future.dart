void main() {
  var f1 = Future(info);
  f1
      .then((value) => print(value))
      .catchError((error) => print("$error"));

  print(2);
}

double info() {
  return double.parse("5ff");
}
