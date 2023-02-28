import 'dart:io';

void main() {
  print(Platform.executable);
  print(Platform.numberOfProcessors);
  //print(Platform.environment);
  print(Platform.script);
  print(Platform.isAndroid);
  print(Platform.isWindows);
  Platform.environment.forEach((key,value){
    print('$key,$value');
  });


}
