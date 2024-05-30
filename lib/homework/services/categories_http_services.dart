import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lesson_46/homework/models/category.dart';

class CategoriesHttpServices {
  Future<List<Category>> getCategory() async {
    Uri url = Uri.parse(
      "https://api.escuelajs.co/api/v1/categories",
    );

    final response = await http.get(url);
    final data = jsonDecode(response.body);
    List<dynamic> loadedProducts0 = data;

    List<Category> loadedProducts = [];
    for (var i = 0; i < loadedProducts0.length; i++) {
      if (data[i] != null && i != 5) {
        loadedProducts.add(Category.fromJson(data[i]));
      }
    }
    return loadedProducts;
  }
}
