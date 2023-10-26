import 'package:flutter/material.dart';
import 'package:uts_2022130034/cart_screen.dart';

void main() {
  runApp(const ProductApp());
}

class ProductApp extends StatelessWidget {
  const ProductApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ProductPage(),
    );
  }
}

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Product> products = [
    Product('Pisang', 'Pisang Manis', 10.0, 'images/pisang.jpg'),
    Product('Alpukat', 'Alpukat Mentega', 20.0, 'images/alpukat.png'),
    Product('Anggur', 'Anggur hitam manis', 30.0, 'images/anggur.jpg'),
  ];

  List<Product> cart = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Produk'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: ((context) => CartPage(cart: cart)),
                  ));
            },
          )
        ],
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return ListTile(
            leading: Image.asset(
              products[index].imagePath,
              width: 100,
              height: 100,
            ),
            title: Text(products[index].name),
            subtitle: Text(products[index].description),
            trailing: Text('\$${products[index].price.toStringAsFixed(2)}'),
            onTap: () {
              addToCart(product);
            },
          );
        },
      ),
    );
  }
}

void addToCart(Product product) {
  setState(() {
    var cart;
    cart.add(product);
  });
}

void setState(Null Function() param0) {}

class Product {
  final String name;
  final String description;
  final double price;
  final String imagePath;

  Product(this.name, this.description, this.price, this.imagePath);
}
