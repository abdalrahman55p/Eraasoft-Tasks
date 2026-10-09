void main() {
  // --- Task 1: Variable Declarations ---
  String name = "Ahmed";
  int age = 20;
  String country = "Egypt";
  String favoriteColor = "Blue";

  print("My name is $name.");
  print("I am $age years old.");
  print("I live in $country.");
  print("My favorite color is $favoriteColor.");

  print("-------------------"); 

  // --- Task 2: Simple Calculator ---
  int num1 = 15;
  int num2 = 4;
  double divisionResult = num1 / num2;

  print("Sum = ${num1 + num2}");
  print("Difference = ${num1 - num2}");
  print("Product = ${num1 * num2}");
  print("Division = $divisionResult");

  print("-------------------");

  // --- Task 3: Student Grade ---
  double math = 90;
  double science = 80;
  double english = 95;
  double totalGrade = math + science + english;
  double average = totalGrade / 3;

  print("Math: ${math.toInt()}");
  print("Science: ${science.toInt()}");
  print("English: ${english.toInt()}");
  print("Total = ${totalGrade.toInt()}");
  print("Average = ${average.toStringAsFixed(2)}");

  print("-------------------");

  // --- Task 4: Rectangle Calculator ---
  double width = 8;
  double height = 5;
  double area = width * height;
  double perimeter = 2 * (width + height);

  print("Width = ${width.toInt()}");
  print("Height = ${height.toInt()}");
  print("Area = ${area.toInt()}");
  print("Perimeter = ${perimeter.toInt()}");

  print("-------------------");

  // --- Task 5: Temperature Converter ---
  double celsius = 30;
  double fahrenheit = (celsius * 9 / 5) + 32;

  print("Celsius = ${celsius.toInt()}");
  print("Fahrenheit = ${fahrenheit.toInt()}");

  print("-------------------");

  // --- Task 6: Shopping Receipt ---
  double laptop = 25000;
  double mouse = 500;
  double keyboard = 1200;

  double totalShopping = laptop + mouse + keyboard;
  double discount = totalShopping * 0.10;
  double finalPrice = totalShopping - discount;

  print("Laptop = ${laptop.toInt()}");
  print("Mouse = ${mouse.toInt()}");
  print("Keyboard = ${keyboard.toInt()}");
  print("");
  print("Total = ${totalShopping.toInt()}");
  print("Discount = ${discount.toInt()}");
  print("Final Price = ${finalPrice.toInt()}");
}
