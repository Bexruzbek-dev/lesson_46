import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lesson_46/homework/models/user.dart';

class UsersHttpServices {
  Future<List<User>> getUsers() async {
    Uri url = Uri.parse(
      "https://api.escuelajs.co/api/v1/users",
    );

    final response = await http.get(url);
    final data = jsonDecode(response.body);

    List<dynamic> loadedProducts0 = data;
    List<User> loadedProducts = [];
    for (var i = 0; i < loadedProducts0.length; i++) {
      if (data[i] != null) {
        loadedProducts.add(User.fromJson(data[i]));
      }
    }
    return loadedProducts;
  }
}
