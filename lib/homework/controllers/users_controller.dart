import 'package:lesson_46/homework/models/user.dart';
import 'package:lesson_46/homework/services/users_http_services.dart';

class UsersController {
  final usersHttpServices = UsersHttpServices();
  // ignore: prefer_final_fields
  List<User> _list = [];

  Future<List<User>> get list async {
    usersHttpServices.getUsers();
    _list = await usersHttpServices.getUsers();
    return [..._list];
  }
}
