// ==================== Task 1 — Calculate Total Price ====================
double calculateTotal(double price, int quantity) {
  return price * quantity;
}

// ==================== Task 2 — Customize a Greeting ====================
String greetUser(String name, [String greeting = "Hello"]) {
  return "$greeting, $name!";
}

// ==================== Task 3 — Calculate an Order ====================
double calculateOrder({
  required double price,
  required int quantity,
  double discount = 0,
  double deliveryFee = 0,
}) {
  double subtotal = (price * quantity) - discount;
  return subtotal + deliveryFee;
}

// ==================== Task 4 — Filter Numbers ====================
List<int> filterNumbers(
    List<int> numbers, {
      int min = 0,
      int max = 100,
      bool includeEven = true,
    }) {
  List<int> result = [];
  for (int num in numbers) {
    bool inRange = num >= min && num <= max;
    if (!inRange) continue;
    if (includeEven) {
      if (num % 2 == 0) {
        result.add(num);
      }
    } else {

      result.add(num);
    }
  }
  return result;
}

// ==================== Task 5 — Shopping Cart Calculator ====================
double calculateCartTotal({
  required List<double> prices,
  double discountPercent = 0,
  double taxPercent = 14,
  double deliveryFee = 0,
  bool isMember = false,
  double maxDiscount = 100,
})
{
  double subtotal = 0;
  for (double price in prices) {
    subtotal += price;
  }

  double totalDiscountPercent = discountPercent;
  if (isMember) {
    totalDiscountPercent += 5;
  }

  if (totalDiscountPercent > maxDiscount) {
    totalDiscountPercent = maxDiscount;
  }

  double discountAmount = subtotal * (totalDiscountPercent / 100);
  double discountedSubtotal = subtotal - discountAmount;

  double taxAmount = discountedSubtotal * (taxPercent / 100);

  double finalTotal = discountedSubtotal + taxAmount + deliveryFee;

  return finalTotal;
}

// ==================== تجربة الدوال (Main Function) ====================

void main() {
  // تجربة Task 1
  print("Task 1 Result: ${calculateTotal(50.0, 3)}");

  // تجربة Task 2
  print("Task 2 Result: ${greetUser("Ahmed", "Welcome")}");

  // تجربة Task 3
  print("Task 3 Result: ${calculateOrder(price: 100, quantity: 2, discount: 10, deliveryFee: 15)}");

  // تجربة Task 4
  print("Task 4 Result 1: ${filterNumbers([1, 2, 5, 8, 12, 15], min: 2, max: 12)}");
  print("Task 4 Result 2: ${filterNumbers([1, 2, 5, 8, 12, 15], min: 2, max: 12, includeEven: false)}");

  // تجربة Task 5
  print("Task 5 Result 1: ${calculateCartTotal(prices: [100, 200, 50])}");
  print("Task 5 Result 2: ${calculateCartTotal(prices: [100, 200, 50], discountPercent: 10, taxPercent: 14, deliveryFee: 25)}");
  print("Task 5 Result 3: ${calculateCartTotal(prices: [100, 200, 50], discountPercent: 10, isMember: true, maxDiscount: 12)}");
}
