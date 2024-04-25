class Person {
  
  String? _name;
  int? _age;

  // Getters:
  String get name => _name!;
  int get age => _age!;

  // Setters:
  set name (String name) => _name = name;
  set age (int age) => _age = age;

  // Constructors
  Person (String name, int age) {
    _name = name;
    _age = age;
  }

  void display () {
    print("Name : $_name");
    print("Age : $_age");
  }

}