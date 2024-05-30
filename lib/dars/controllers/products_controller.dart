import 'package:lesson_46/dars/models/product.dart';
import 'package:lesson_46/dars/services/products_http_services.dart';

class ProductsController {
  final productsHttpServices = ProductsHttpServices();
  // ignore: prefer_final_fields
  List<Product> _list = [
    Product(
      id: "1",
      title: "iPhone 15",
      price: 823.34,
    ),
  ];

  Future<List<Product>> get list async{
    productsHttpServices.getProducts();
    _list = await productsHttpServices.getProducts();
    return [..._list];
  }                                                                                                                                                                                                                                                                                                                                                                             
}
