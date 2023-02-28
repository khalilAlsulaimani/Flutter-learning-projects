import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'add_products.dart';
import 'product_details.dart';
import 'products.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    List<Product> prodList =
        Provider.of<Products>(context, listen: true).productsList;

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Products'),
      ),
      body: SafeArea(
        child: prodList.isEmpty
            ? const Center(
                child: Text(
                  'No Products Added.',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              )
            : ListView(
                children: prodList
                    .map(
                      (item) => Builder(
                        builder: (ctx) => detailCard(
                            item.id,
                            item.title,
                            item.description,
                            item.price,
                            item.imageUrl,
                            ctx,
                            isLandscape),
                      ),
                    )
                    .toList(),
              ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        onPressed: () =>
            MaterialPageRoute(builder: (ctx) => const AddProduct()),
        label: const Text('Add Product'),
        backgroundColor: Colors.lightBlue[900],
      ),
    );
  }

  Widget detailCard(String id, tile, desc, price, imageUrl, ctx, isLandscape) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          ctx,
          MaterialPageRoute(builder: (_) => ProductDetails(id)),
        ).then((id) =>
            Provider.of<Products>(ctx, listen: false).delete(id.toString()));
      },
      child: Column(
        children: [
          const SizedBox(height: 5),
          Card(
            elevation: 10,
            color: Theme.of(ctx).cardColor,
            child: Row(
              children: <Widget>[
                Expanded(
                  flex: 7,
                  child: Container(
                    padding: const EdgeInsets.only(right: 10),
                    width: 130,
                    child: Hero(
                      tag: id,
                      child: Image.network(imageUrl, fit: BoxFit.fill),
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Column(
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const SizedBox(height: 10),
                      Text(
                        tile,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const Divider(color: Colors.white),
                      SizedBox(
                        child: Text(
                          desc,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 14),
                          softWrap: true,
                          overflow: TextOverflow.fade,
                          textAlign: TextAlign.justify,
                          maxLines: isLandscape ? null : 3,
                        ),
                      ),
                      const Divider(color: Colors.white),
                      Text(
                        '\$$price',
                        style:
                            const TextStyle(color: Colors.black, fontSize: 18),
                      ),
                      const SizedBox(height: 13),
                    ],
                  ),
                ),
                const Expanded(flex: 1, child: Icon(Icons.arrow_forward_ios)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
