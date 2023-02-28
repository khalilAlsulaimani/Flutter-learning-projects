void main(){
  var a1 = [1,2.4,3.2,4,5,6];
  print(a1);
  var b1 = a1.where((element) => element < 4);
  print(b1);
}