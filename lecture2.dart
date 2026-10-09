void main() {
  // --- Task 1: Variable Declarations ---
   (void main() {

  String name = "Ahmed";

  int age = 20;

  String country = "Egypt";

  String favoriteColor = "Blue";

  print("My name is $name.");

  print("I am $age years old.");

  print("I live in $country.");

  print("My favorite color is $favoriteColor.");
})

  // --- Task 2: Simple Calculator ---
   (void main() {

  int num1 = 15;

  int num2 = 4;

  double divisionResult = num1 / num2;

  print("Sum = ${num1 + num2}");

  print("Difference = ${num1 - num2}");

  print("Product = ${num1 * num2}");

  print("Division = $divisionResult");
})

  // --- Task 3: Student Grade ---
  
   (void main() {
  double math = 90;

  double science = 80;

  double english = 95;

  double total = math + science + english;

  double average = total / 3;

  print("Math: ${math.toInt()}");

  print("Science: ${science.toInt()}");

  print("English: ${english.toInt()}");

  print("Total = ${total.toInt()}");
  
  print("Average = ${average.toStringAsFixed(2)}");
})

  //--- Task 4: Rectangle Calculator ---
  
   (void main() {

  double width = 8;

  double height = 5;

  double area = width * height;

  double perimeter = 2 * (width + height);

  print("Width = ${width.toInt()}");

  print("Height = ${height.toInt()}");

  print("Area = ${area.toInt()}");

  print("Perimeter = ${perimeter.toInt()}");
})

  // --- Task 5: Temperature Converter ---
  
   (void main() {

  double celsius = 30;

  double fahrenheit = (celsius * 9 / 5) + 32;

  print("Celsius = ${celsius.toInt()}");

  print("Fahrenheit = ${fahrenheit.toInt()}");
}
  // --- Task 6: Shopping Receipt ---
    
   (void main() {

  double laptop = 25000;

  double mouse = 500;

  double keyboard = 1200;

  double total = laptop + mouse + keyboard;

  double discount = total * 0.10;

  double finalPrice = total - discount;

  print("Laptop = ${laptop.toInt()}");

  print("Mouse = ${mouse.toInt()}");

  print("Keyboard = ${keyboard.toInt()}");

  print("Total = ${total.toInt()}");

  print("Discount = ${discount.toInt()}");

  print("Final Price = ${finalPrice.toInt()}");
})
}
