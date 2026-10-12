-----task1----

  void main() {
  int n = -4;

  if (n % 2 == 0) {

    print("Even");

  }
  else {
    print("Odd");
  }

  if (n < 0) {
    print("Negative number");
  }


---task2-----

  int n = 15;

  for (int i = 1; i <= n; i++) {

    if (i % 3 == 0 && i % 5 == 0) {
      print("FizzBuzz");
    }

    else if (i % 3 == 0) {
      print("Fizz");
    }

    else if (i % 5 == 0) {
      print("Buzz");
    }

    else {
      print(i);
    }
  }


---task3---

  List<int> numbers = [12, 5, 8, 21, 4, 15, 10];

  int sum = 0;
  for (int i = 0; i < numbers.length; i++) {
    sum += numbers[i];
  }

  int largest = numbers[0];
  int smallest = numbers[0];
  for (int i = 1; i < numbers.length; i++) {
    if (numbers[i] > largest) {
      largest = numbers[i];
    }
    if (numbers[i] < smallest) {
      smallest = numbers[i];
    }
  }

  int evenCount = 0;
  for (int i = 0; i < numbers.length; i++) {
    if (numbers[i] % 2 == 0) {
      evenCount++;
    }
  }

  List<int> greaterThanTen = [];
  for (int i = 0; i < numbers.length; i++) {
    if (numbers[i] > 10) {
      greaterThanTen.add(numbers[i]);
    }
  }

  print("Sum = $sum");
  print("Largest number = $largest");
  print("Smallest number = $smallest");
  print("Number of even elements = $evenCount");
  print("Numbers > 10 = $greaterThanTen");


----task4----
  
  Map<String, double> studentGrades = {
    "Ahmed": 85,
    "Mohamed": 45,
    "Ali": 92,
    "Abdalrahman": 60,
    "Omar": 38
  };

  double totalGrades = 0;
  String topStudent = "";
  double highestGrade = -1;
  int passedCount = 0;

  print("--- Student Grades Report ---");

  studentGrades.forEach((name, grade) {

    String status = (grade >= 50) ? "Pass" : "Fail";

    print("Student: $name, Grade: $grade -> $status");

    totalGrades += grade;

    if (grade >= 50) {
      passedCount++;
    }

    if (grade > highestGrade) {
      highestGrade = grade;
      topStudent = name;
    }
  });

  double classAverage = totalGrades / studentGrades.length;

  print("--- Statistics ---");
  print("Class Average = ${classAverage.toStringAsFixed(2)}");
  print("Highest Grade Student: $topStudent with grade $highestGrade");
  print("Number of students passed = $passedCount");


----task5----

  double num1 = 20;
  double num2 = 0;
  String operation = "/";

  switch (operation) {
    case "+":
      print("Result = ${num1 + num2}");
      break;

    case "-":
      print("Result = ${num1 - num2}");
      break;

    case "*":
      print("Result = ${num1 * num2}");
      break;

    case "/":
      if (num2 == 0) {
        print("Error: Cannot divide by zero.");
      } else {
        print("Result = ${num1 / num2}");
      }
      break;

    case "%":
      if (num2 == 0) {
        print("Error: Cannot find remainder by zero.");
      } else {
        print("Result = ${num1 % num2}");
      }
      break;

    default:
      print("Invalid operation");
  }


----task6---

  List<Map<String, dynamic>> cart = [
    {"name": "Phone", "price": 10000.0, "quantity": 2},
    {"name": "Tv", "price": 20000.0, "quantity": 3},
    {"name": "Scooter", "price": 15000.0, "quantity": 2},
    {"name": "Mouse", "price": 200.0, "quantity": 3},
    {"name": "Keyboard", "price": 750.0, "quantity": 1},
  ];

  double totalCartCost = 0;
  int totalItemsCount = 0;

  print("--- Shopping Cart Details ---");

  for (var item in cart) {
    String name = item["name"];
    double price = item["price"];
    int quantity = item["quantity"];

    double itemTotal = price * quantity;
    totalCartCost += itemTotal;

    totalItemsCount += quantity;

    print("Product: $name | Price: $price | Quantity: $quantity | Total: $itemTotal");
  }

  print("\n---------------------------------");

  print("Total Cart Cost = $totalCartCost");

  double finalTotal = totalCartCost;
  if (totalCartCost >= 25000) {
    double discount = totalCartCost * 0.10;
    finalTotal = totalCartCost - discount;
    print("Discount Applied (10%) = -$discount");
  } else {
    print("No discount applied (Total is less than 25,000)");
  }

  print("Final Total After Discount = $finalTotal");

  print("Total number of items in cart = $totalItemsCount");


---task7---

  List<Map<String, dynamic>> students = [
    {
      "name": "Ahmed",
      "grades": [90, 85, 88]
    },
    {
      "name": "Mohamed",
      "grades": [70, 75, 68]
    },
    {
      "name": "Ali",
      "grades": [45, 45, 50]
    },
    {
      "name": "Abdalrahman",
      "grades": [95, 92, 98]
    },
  ];

  print("'''' Part A & B: System Reports ''''");

  double totalClassSum = 0;
  String topStudent = "";
  double highestAverage = -1;

  String lowestStudent = "";
  double lowestAverage = 999;

  int passedCount = 0;
  List<String> excellentStudents = [];

  for (var student in students) {
    String name = student["name"];
    List<int> grades = student["grades"];

    double sum = 0;
    bool allAbove80 = true;

    for (int grade in grades) {
      sum += grade;
      if (grade < 80) {
        allAbove80 = false;
      }
    }

    double average = sum / grades.length;
    totalClassSum += average;


    String status = "";
    if (average >= 85) {
      status = "Excellent";
    } else if (average >= 70) {
      status = "Good";
    } else if (average >= 50) {
      status = "Pass";
    } else {
      status = "Fail";
    }

    print("Student: $name | Average: ${average.toStringAsFixed(2)} | Status: $status");

    if (average > highestAverage) {
      highestAverage = average;
      topStudent = name;
    }

    if (average < lowestAverage) {
      lowestAverage = average;
      lowestStudent = name;
    }

    if (average >= 50) {
      passedCount++;
    }

    if (allAbove80) {
      excellentStudents.add(name);
    }
  }

  double classAverage = totalClassSum / students.length;

  print("\n--- Additional Statistics ---");
  print("Class Average = ${classAverage.toStringAsFixed(2)}");
  print("Top Student: $topStudent with average $highestAverage");
  print("Lowest Student: $lowestStudent with average $lowestAverage");
  print("Number of students passed = $passedCount");
  print("Students with >= 80 in every subject = $excellentStudents");

  // ==================== Part C: Search Feature ====================
  print("\n=== Part C: Search Feature ===");
  String searchName = "Mona";
  bool found = false;

  for (var student in students) {
    if (student["name"].toLowerCase() == searchName.toLowerCase()) {
      found = true;
      List<int> grades = student["grades"];
      double sum = 0;
      for (int g in grades) sum += g;
      double avg = sum / grades.length;

      print("Found! Student: ${student["name"]} | Grades: $grades | Average: ${avg.toStringAsFixed(2)}");
      break;
    }
  }

  if (!found) {
    print("Student not found");
  }

  // ==================== Part D: Menu using Switch ====================
  print("\n=== Part D: Menu System ===");
  int choice = 1;

  switch (choice) {
    case 1:
      print("Action: Print all students.");
      break;
    case 2:
      print("Action: Show class average (${classAverage.toStringAsFixed(2)}).");
      break;
    case 3:
      print("Action: Show top student ($topStudent).");
      break;
    case 4:
      print("Action: Search for a student ($searchName).");
      break;
    case 5:
      print("Action: Exit system.");
      break;
    default:
      print("Invalid choice");
  }
}
