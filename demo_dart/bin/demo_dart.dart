import 'package:demo_dart/demo_dart.dart' as demo_dart;

import '../model/Person.dart';
import '../model/product.dart';
import '../model/student.dart';
import '../service/productService.dart';


void main(List<String> arguments) {
  // print('Hello world: ${demo_dart.calculate()}!');
  // print("--------------------");

  // // Create a Person object
  // Person person = Person("John", 30);
  // person.display();
  // print("--------------------");

  // // Create a Student object
  // Student student = Student("John", 30, "XYZ School", "10th");
  // student.display();
  // student.study();
  // print("--------------------");

  // // Test the Product class
  // String jsonString = '{"name": "iPhone 13", "price": 999, "category": "Smartphone"}';
  // ProductService productService = ProductService();
  // Product product = productService.getProduct(jsonString);
  // print("Product Name : ${product.name}");
  // print("Product Price : ${product.price}");
  // print("Product Category : ${product.category}");
  // print("--------------------");

  // // Convert the Product object to a JSON string
  // Product product2 = Product("Samsung Galaxy S21", 799, "Smartphone");
  // String jsonString2 = product2.toJson();
  // print("Product JSON : $jsonString2");
  // print("--------------------");

  // // Convert JSON string of product list to a list of Product objects
  // String jsonString3 = '[{"name": "iPhone 13", "price": 999, "category": "Smartphone"}, {"name": "Samsung Galaxy S21", "price": 799, "category": "Smartphone"}]';
  // List<Product> products = productService.getProducts(jsonString3);
  // for (int i = 0; i < products.length; i++) {
  //   print("Product ${i+1} Name : ${products[i].name}");
  //   print("Product ${i+1} Price : ${products[i].price}");
  //   print("Product ${i+1} Category : ${products[i].category}");
  //   print("--------------------");
  // }

  // I want to test async and await

Future<String> fetchUserOrder() =>
    // Imagine that this function is
    // more complex and slow.
    Future.delayed(
      const Duration(seconds: 2),
      () => 'Large Latte',
    );
    
  Future<String> createOrderMessage() async {
  var order = await fetchUserOrder();
  print('Awaiting user order...');
  return 'Your order is: $order';
}

Future<void> main_2() async {
  print('Fetching user order...');
  print(await createOrderMessage());
}



  main_2();

  
  
}
