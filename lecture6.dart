// ==================== Task 1: Student Class (Encapsulation) ====================
class StudentTask1 {
  String _name;
  int _age;
  double _grade;

  StudentTask1(this._name, this._age, this._grade);

  // Getters
  String get name => _name;
  int get age => _age;
  double get grade => _grade;

  // Setters with validation
  set name(String value) => _name = value;

  set age(int value) {
    if (value > 0) {
      _age = value;
    } else {
      print("Error: Age must be positive.");
    }
  }

  set grade(double value) {
    if (value >= 0 && value <= 100) {
      _grade = value;
    } else {
      print("Error: Grade must be between 0 and 100.");
    }
  }

  void display() {
    print("Student: $_name, Age: $_age, Grade: $_grade");
  }
}


// ==================== Task 2: Bank Account ====================
class BankAccount {
  String _accountHolder;
  double _balance;

  BankAccount(this._accountHolder, this._balance);

  String get accountHolder => _accountHolder;
  double get balance => _balance;

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print("Deposited: $amount. New Balance: $_balance");
    } else {
      print("Error: Deposit amount must be positive.");
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print("Withdrew: $amount. Remaining Balance: $_balance");
    } else {
      print("Error: Invalid withdrawal amount or exceeds balance.");
    }
  }
}


// ==================== Task 3: Person and Student (Inheritance) ====================
class Person {
  String _name;
  int _age;

  Person(this._name, this._age);

  String get name => _name;
  int get age => _age;

  void displayInfo() {
    print("Name: $_name, Age: $_age");
  }
}

class StudentTask3 extends Person {
  String studentId;
  double grade;

  StudentTask3(String name, int age, this.studentId, this.grade) : super(name, age);

  @override
  void displayInfo() {
    super.displayInfo();
    print("Student ID: $studentId, Grade: $grade");
  }
}


// ==================== Task 4: Employee Salary System (Polymorphism) ====================
abstract class Employee {
  String name;
  String employeeId;

  Employee(this.name, this.employeeId);

  double calculateSalary();
}

class FullTimeEmployee extends Employee {
  double monthlySalary;

  FullTimeEmployee(String name, String employeeId, this.monthlySalary) : super(name, employeeId);

  @override
  double calculateSalary() {
    return monthlySalary;
  }
}

class PartTimeEmployee extends Employee {
  double hourlyRate;
  int hoursWorked;

  PartTimeEmployee(String name, String employeeId, this.hourlyRate, this.hoursWorked) : super(name, employeeId);

  @override
  double calculateSalary() {
    return hourlyRate * hoursWorked;
  }
}


// ==================== Task 5: Library Management System ====================
class LibraryItem {
  String id;
  String title;
  bool _isBorrowed = false;

  LibraryItem(this.id, this.title);

  bool get isBorrowed => _isBorrowed;

  void borrowItem() {
    if (!_isBorrowed) {
      _isBorrowed = true;
      print("Item '$title' has been borrowed.");
    } else {
      print("Error: Item '$title' is already borrowed!");
    }
  }

  void returnItem() {
    if (_isBorrowed) {
      _isBorrowed = false;
      print("Item '$title' has been returned.");
    } else {
      print("Error: Item '$title' was not borrowed!");
    }
  }

  void displayDetails() {
    print("ID: $id, Title: $title, Borrowed: $_isBorrowed");
  }
}

class Book extends LibraryItem {
  String author;

  Book(String id, String title, this.author) : super(id, title);

  @override
  void displayDetails() {
    super.displayDetails();
    print("Author: $author (Book)");
  }
}

class Magazine extends LibraryItem {
  int issueNumber;

  Magazine(String id, String title, this.issueNumber) : super(id, title);

  @override
  void displayDetails() {
    super.displayDetails();
    print("Issue Number: $issueNumber (Magazine)");
  }
}

class Member {
  String memberName;
  List<LibraryItem> borrowedItems = [];

  Member(this.memberName);

  void borrow(LibraryItem item) {
    if (borrowedItems.length >= 3) {
      print("Error: $memberName cannot borrow more than 3 items!");
      return;
    }
    if (item.isBorrowed) {
      print("Error: Item '${item.title}' is already borrowed by someone else.");
      return;
    }
    item.borrowItem();
    borrowedItems.add(item);
  }

  void returnBook(LibraryItem item) {
    if (borrowedItems.contains(item)) {
      item.returnItem();
      borrowedItems.remove(item);
    } else {
      print("Error: $memberName has not borrowed this item!");
    }
  }
}


// ==================== Main Testing Function ====================
void main() {
  print("=== Task 1 Test ===");
  var s1 = StudentTask1("Ahmed", 20, 85.5);
  s1.display();
  s1.grade = 95.0;
  s1.grade = 150;
  s1.display();

  print("\n=== Task 2 Test ===");
  var account = BankAccount("Mohamed", 1000.0);
  account.deposit(500);
  account.withdraw(200);
  account.withdraw(2000);

  print("\n=== Task 3 Test ===");
  var st3 = StudentTask3("Ali", 22, "S101", 88.0);
  st3.displayInfo();

  print("\n=== Task 4 Test ===");
  List<Employee> employees = [
    FullTimeEmployee("Omar", "E1", 5000.0),
    PartTimeEmployee("Sara", "E2", 50.0, 60),
  ];
  for (var emp in employees) {
    print("Employee: ${emp.name}, Salary: ${emp.calculateSalary()}");
  }

  print("\n=== Task 5 Test ===");
  var book1 = Book("B1", "Dart Programming", "John Doe");
  var book2 = Book("B2", "Flutter Guide", "Jane Smith");
  var mag1 = Magazine("M1", "Tech Monthly", 45);
  var mag2 = Magazine("M2", "Science Weekly", 12);

  var member = Member("Abdalrahman");

  member.borrow(book1);
  member.borrow(book2);
  member.borrow(mag1);


  member.borrow(mag2);

  member.returnBook(book1);

  member.borrow(mag2);

  mag2.displayDetails();
}
