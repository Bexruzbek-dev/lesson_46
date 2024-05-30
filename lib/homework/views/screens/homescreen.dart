import 'package:flutter/material.dart';
import 'package:lesson_46/homework/controllers/products_controller.dart';
import 'package:lesson_46/homework/views/widgets/custom_drawer.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final productsController = ProductsController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Products"),
        centerTitle: true,
        backgroundColor: Colors.amber,
      ),
      drawer: CustomDrawer(),
      body: FutureBuilder(
          future: productsController.list,
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
                      final product = snapshot.data![index];
                      return Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.network(product.images[0]),
                            Text(
                              "\$${product.price}",
                              style:const TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            Text(
                              product.title,
                              style:const TextStyle(
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
