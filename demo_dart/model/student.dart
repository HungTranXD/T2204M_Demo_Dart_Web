import 'person.dart';

class Student extends Person {
  String? _schoolName;
  String? _className;

  // Getters and Setters
  String get schoolName => _schoolName!;
  String get className => _className!;
  set schoolName (String schoolName) => _schoolName = schoolName;
  set className (String className) => _className = className;

  // Constructors
  Student(String name, int age, String schoolName, String className) : super(name, age) {
    _schoolName = schoolName;
    _className = className;
  }

  @override
  void display () {
    super.display();
    print("School Name : $_schoolName");
    print("Class Name : $_className");
  }

  void study () {
    print("$name (age $age) is studying in $_schoolName in class $_className");
  }


}