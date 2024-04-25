import 'dart:convert';
import '../model/product.dart';

class ProductService {

  Product getProduct(String jsonString) {
    return Product.fromJson(jsonString);
  }

  List<Product> getProducts(String jsonString) {
    List<Product> products = [];
    List<dynamic> json = jsonDecode(jsonString);
    for (var item in json) {
      products.add(Product.fromJson(jsonEncode(item)));
    }
    return products;
  }
  
}