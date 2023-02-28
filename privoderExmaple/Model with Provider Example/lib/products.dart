import 'package:flutter/material.dart';

class Product {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;

  Product({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.imageUrl,
  });
}

class Products with ChangeNotifier {
  List<Product> productsList = [
    Product(
      id: '998',
      title: 'Picture #998',
      description: 'Officia cupidatat excepteur in duis. Nisi aliqua aliquip id dolor mollit anim exercitation non amet consequat occaecat culpa. Minim pariatur incididunt incididunt excepteur Lorem reprehenderit pariatur. Anim non consectetur do quis ut Lorem eu duis veniam magna non nulla. Lorem reprehenderit non dolore officia laborum officia dolore eu pariatur in. Magna ut consectetur cupidatat minim pariatur enim elit nulla voluptate culpa et aliqua aliquip incididunt.',
      price: 11,
      imageUrl:
          'https://i.pinimg.com/736x/0c/08/98/0c0898828f130249ea46b2c6f50ed909.jpg',
    ),
    Product(
      id: '999',
      title: 'Picture #999',
      description: 'Reprehenderit esse mollit pariatur fugiat sit. Pariatur officia amet est nisi qui nostrud fugiat quis exercitation eiusmod qui eiusmod esse est. Pariatur adipisicing dolore nostrud laborum velit commodo sunt occaecat adipisicing. Dolor dolor aute enim ut dolor cupidatat ea Lorem ut exercitation mollit. Velit duis ullamco enim et pariatur veniam. Velit nostrud reprehenderit incididunt enim elit duis elit duis labore.',
      price: 34,
      imageUrl:
          'https://thumbs.dreamstime.com/b/autumn-fall-nature-scene-autumnal-park-beautiful-77869343.jpg',
    ),
  ];
  int i = 0;
  void add(
      {required String title,
      required String description,
      required double price,
      required String imageUrl}) {
    productsList.add(Product(
        id: '${i++}',
        title: title,
        description: description,
        price: price,
        imageUrl: imageUrl));
    notifyListeners();
  }

  void delete(String id) {
    productsList.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
