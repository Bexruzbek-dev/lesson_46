import 'package:flutter/material.dart';
import 'package:lesson_46/homework/controllers/categories_controller.dart';
import 'package:lesson_46/homework/views/widgets/custom_drawer.dart';

class CategoryScreen extends StatelessWidget {
  CategoryScreen({super.key});

  final categoriesController = CategoriesController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      drawer: CustomDrawer(),
      body: FutureBuilder(
          future: categoriesController.list,
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
                      final category = snapshot.data![index];
                      return Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(category.image),
                            Text(
                              category.name,
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
