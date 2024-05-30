import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lesson_46/dars/models/product.dart';

class ProductsHttpServices {
  Future<List<Product>> getProducts() async {
    Uri url = Uri.parse(
      "https://lesson46-6bca9-default-rtdb.firebaseio.com/products.json",
    );

    final response = await http.get(url);
    final data = jsonDecode(response.body);

    List<Product> loadedProducts = [];
    if (data != null) {
      data.forEach(
        (key, value) {
          value["id"] = key;
          loadedProducts.add(
            Product.fromJson(value),
          );
        },
      );
    }
    return loadedProducts;
  }
}
