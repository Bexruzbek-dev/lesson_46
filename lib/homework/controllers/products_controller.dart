


import 'package:lesson_46/homework/models/product.dart';
import 'package:lesson_46/homework/services/products_http_services.dart';

class ProductsController {
  final productsHttpServices = ProductsHttpServices();
  // ignore: prefer_final_fields
  List<Product> _list = [
    
  ];

  Future<List<Product>> get list async{
    productsHttpServices.getProducts();
    _list = await productsHttpServices.getProducts();
    return [..._list];
  }                                                                                                                                                                                                                                                                                                                                                                             
}
