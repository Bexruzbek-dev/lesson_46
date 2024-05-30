import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lesson_46/homework/models/product.dart';

class ProductsHttpServices {
  Future<List<Product>> getProducts() async {
    Uri url = Uri.parse(
      "https://api.escuelajs.co/api/v1/products",
    );

    final response = await http.get(url);
    final data = jsonDecode(response.body);
    List<dynamic> loadedProducts0 = data;
    List<Product> loadedProducts = [];
    for (var i = 0; i < loadedProducts0.length; i++) {
      if (data[i] != null) {
        loadedProducts.add(Product.fromJson(data[i]));
      }
    }
    return loadedProducts;
  }
}
