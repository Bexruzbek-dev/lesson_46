
import 'package:lesson_46/homework/models/category.dart';
import 'package:lesson_46/homework/services/categories_http_services.dart';

class CategoriesController {
  final categoriesHttpServices = CategoriesHttpServices();
  // ignore: prefer_final_fields
  List<Category> _list = [
    
  ];

  Future<List<Category>> get list async{
    categoriesHttpServices.getCategory();
    _list = await categoriesHttpServices.getCategory();
    return [..._list];
  }                                                                                                                                                                                                                                                                                                                                                                             
}
