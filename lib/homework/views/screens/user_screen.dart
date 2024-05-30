import 'package:flutter/material.dart';
import 'package:lesson_46/homework/controllers/users_controller.dart';
import 'package:lesson_46/homework/views/widgets/custom_drawer.dart';

class UserScreen extends StatelessWidget {
  UserScreen({super.key});

  final usersController = UsersController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      drawer: CustomDrawer(),
      body: FutureBuilder(
          future: usersController.list,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                ),
              );
            }

            return !snapshot.hasData || snapshot.data!.isEmpty
                ? const Center(
                    child: Text("Mahsulotlar mavjud emas"),
                  )
                : ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (ctx, index) {
                      final user = snapshot.data![index];
                      return Card(
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.network(
                              user.avatar,
                            ),
                            Text(
                              user.email,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
          }),
    );
  }
}
