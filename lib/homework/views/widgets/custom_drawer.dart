import 'package:flutter/material.dart';
import 'package:lesson_46/homework/controllers/categories_controller.dart';
import 'package:lesson_46/homework/views/screens/category_screen.dart';
import 'package:lesson_46/homework/views/screens/homescreen.dart';
import 'package:lesson_46/homework/views/screens/user_screen.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            centerTitle: true,
            title: const Text("MENYU"),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (ctx) {
                return HomeScreen();
              }));
            },
            title: const Text("Products"),
            trailing: const Icon(Icons.chevron_right_rounded),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (ctx) {
                return CategoryScreen();
              }));
            },
            title: const Text("Categories"),
            trailing: const Icon(Icons.chevron_right_rounded),
          ),
          ListTile(
            onTap: () {
              Navigator.of(context)
                  .pushReplacement(MaterialPageRoute(builder: (ctx) {
                return UserScreen();
              }));
            },
            title: const Text("Users"),
            trailing: const Icon(Icons.chevron_right_rounded),
          ),
        ],
      ),
    );
  }
}
