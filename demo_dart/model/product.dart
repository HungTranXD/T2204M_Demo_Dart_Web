import 'dart:convert';

class Product {
  String? name;
  int? price;
  String? category;

  Product(this.name, this.price, this.category);

  // named constructor Create a Product object from a JSON string
  Product.fromJson(String jsonString) {
    Map<String, dynamic> json = jsonDecode(jsonString);
    name = json["name"];
    price = json["price"];
    category = json["category"];
  }

  // Create a JSON string from a Product object
  String toJson() {
    return jsonEncode({"name": name, "price": price, "category": category});
  }

}