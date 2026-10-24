// ==================== Task 1 — Grade Calculator ====================
double calculateTotal(double a, double b, double c) {
  return a + b + c;
}

double calculateAverage(double total) {
  return total / 3;
}

String getResult(double average) {
  if (average >= 50) {
    return "Pass";
  } else {
    return "Fail";
  }
}


// ==================== Task 2 — Student Class ====================
class Student {
  String name;
  int age;
  double grade;

  Student(this.name, this.age, this.grade);


  void displayInfo() {
    print("Student: $name, Age: $age, Grade: $grade");
  }

  bool isPassed() {
    return grade >= 50;
  }
}

Student findTopStudent(List<Student> students) {
  if (students.isEmpty) {
    throw Exception("Student list is empty");
  }

  Student top = students[0];
  for (var student in students) {
    if (student.grade > top.grade) {
      top = student;
    }
  }
  return top;
}


// ==================== Task 3 — BankAccount Class ====================
class BankAccount {
  String accountHolder;
  double _balance;


  BankAccount(this.accountHolder, this._balance);

  double get balance => _balance;

  set balance(double value) {
    if (value >= 0) {
      _balance = value;
    } else {
      print("Error: Balance cannot be negative!");
    }
  }

  void deposit(double amount) {
    if (amount > 0) {
      _balance += amount;
      print("Deposited: $amount, New Balance: $_balance");
    }
  }

  void withdraw(double amount) {
    if (amount > 0 && amount <= _balance) {
      _balance -= amount;
      print("Withdrew: $amount, Remaining Balance: $_balance");
    } else {
      print("Error: Invalid withdrawal amount or exceeds available balance!");
    }
  }
}


// ==================== Task 4 — Product Class ====================
class Product {
  String name;
  int id;
  double _price;
  int _quantity;

  Product(this.name, this.id, double price, int quantity)
      : _price = price >= 0 ? price : 0,
        _quantity = quantity >= 0 ? quantity : 0;

  double get price => _price;
  int get quantity => _quantity;

  set price(double value) {
    if (value >= 0) {
      _price = value;
    } else {
      print("Error: Price cannot be negative.");
    }
  }

  set quantity(int value) {
    if (value >= 0) {
      _quantity = value;
    } else {
      print("Error: Quantity cannot be negative.");
    }
  }

  void updateStock(int amount) {
    if (_quantity + amount >= 0) {
      _quantity += amount;
    } else {
      print("Error: Stock cannot become negative.");
    }
  }

  double calculateTotalValue() {
    return _price * _quantity;
  }
}

Product? findProduct(List<Product> products, int id) {
  for (var product in products) {
    if (product.id == id) {
      return product;
    }
  }
  return null;
}

double calculateAllProductsValue(List<Product> products) {
  double totalValue = 0;
  for (var product in products) {
    totalValue += product.calculateTotalValue();
  }
  return totalValue;
}


// ==================== Main Function (Testing All Tasks) ====================
void main() {
  print("--- Task 1 Test ---");
  double total = calculateTotal(85.5, 90.0, 78.0);
  double avg = calculateAverage(total);
  print("Total: $total, Average: ${avg.toStringAsFixed(2)}, Result: ${getResult(avg)}");

  print("\n--- Task 2 Test ---");
  List<Student> students = [
    Student("Ahmed", 20, 85.0),
    Student("Mona", 22, 95.5),
    Student("Ali", 21, 45.0),
  ];
  for (var s in students) {
    s.displayInfo();
    print("Passed? ${s.isPassed()}");
  }
  Student top = findTopStudent(students);
  print("Top Student: ${top.name} with grade ${top.grade}");

  print("\n--- Task 3 Test ---");
  BankAccount myAccount = BankAccount("Abdalrahman", 1000.0);
  myAccount.deposit(500);
  myAccount.withdraw(300);
  myAccount.withdraw(2000); // Should fail

  print("\n--- Task 4 Test ---");
  List<Product> products = [
    Product("Laptop", 1, 15000, 3),
    Product("Mouse", 2, 500, 10),
  ];

  Product? found = findProduct(products, 2);
  if (found != null) {
    print("Found Product: ${found.name}, Price: ${found.price}");
  }

  print("Total Inventory Value: ${calculateAllProductsValue(products)}");
}
