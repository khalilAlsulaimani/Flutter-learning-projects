import 'dart:convert';

import 'package:http/http.dart' as http;

Future<dynamic> fetchAlbum() async {
  const url = 'https://jsonplaceholder.typicode.com/albums';

  final res = await http.get(Uri.parse(url));
  if (res.statusCode == 200) {
    var obj = json.decode(res.body);
    return obj;
  } else {
    throw Exception('error 404');
  }
}

void main() async {
  var data = await fetchAlbum();
  for (int i = 0; i < 100; i++) {
    print(data[i]['userId']);
    print(data[i]['id']);
    print(data[i]['title']);
    //print(data[i]["body"]);
    print("------------------");
  }
}
