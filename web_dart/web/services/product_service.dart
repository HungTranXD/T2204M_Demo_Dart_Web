import 'dart:convert';
// import 'dart:html';
// import 'dart:io';

import '../model/product.dart';



class ProductService {

  static String content = '''
  [
    {"id":1,"name":"Product 1","price":100.0,"description":"Description 1"},
    {"id":2,"name":"Product 2","price":200.0,"description":"Description 2"}
  ]
  ''';

  // final String filePath = "resources/products.json";
  
  Future<List<Product>> getAllProducts() async {
    try {
      // String content = await HttpRequest.getString(filePath);
      // String content = '[{"id":1,"name":"Product 1","price":100.0,"description":"Description 1"},{"id":2,"name":"Product 2","price":200.0,"description":"Description 2"}]';
      // String content = await File(filePath).readAsString();
      List<dynamic> productsJson = jsonDecode(content);
      return productsJson.map((json) => Product.fromJson(json)).toList();
    } catch (e) {
      return [];
    }
  }

  Future<Product?> getProductById(int id) async {
    try {
      List<Product> products = await getAllProducts();
      return products.firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<void> createProduct(Product product) async {
    try {
      List<Product> products = await getAllProducts();
      int id = products.isEmpty ? 1 : products.last.id + 1;
      product.id = id;
      products.add(product);
      content = jsonEncode(products);
    } catch (e) {
      print(e);
    }
  }

  Future<void> updateProduct(Product product) async {
    try {
      List<Product> products = await getAllProducts();
      int index = products.indexWhere((p) => p.id == product.id);
      if (index != -1) {
        products[index] = product;
        content = jsonEncode(products);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> deleteProduct(int id) async {
    try {
      List<Product> products = await getAllProducts();
      products.removeWhere((product) => product.id == id);
      content = jsonEncode(products);
    } catch (e) {
      print(e);
    }
  }

  


}