class Product {
  int id;
  String name;
  double price;
  String description;

  Product(this.id, this.name, this.price, this.description);

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      json['id'],
      json['name'],
      json['price'],
      json['description'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
    };
  }
  
}