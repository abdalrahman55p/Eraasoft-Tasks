class BankAccount {
  final String _accountNumber;
  double _balance;

  BankAccount({
    required String accountNumber,
    double initialBalance = 0.0,
  })  : _accountNumber = accountNumber,
        _balance = initialBalance >= 0 ? initialBalance : 0.0;

  String get accountNumber => _accountNumber;
  double get balance => _balance;

  void deposit(double amount) {
    if (amount <= 0) {
      print('Deposit failed: Amount must be greater than 0.');
      return;
    }
    _balance += amount;
    print('Successfully deposited \$${amount.toStringAsFixed(2)}. New balance: \$${_balance.toStringAsFixed(2)}');
  }

  void withdraw(double amount) {
    if (amount <= 0) {
      print('Withdrawal failed: Amount must be greater than 0.');
      return;
    }
    if (amount > _balance) {
      print('Withdrawal failed: Insufficient funds. Available balance: \$${_balance.toStringAsFixed(2)}');
      return;
    }
    _balance -= amount;
    print('Successfully withdrew \$${amount.toStringAsFixed(2)}. Remaining balance: \$${_balance.toStringAsFixed(2)}');
  }
}

class Employee {
  final String name;
  final double salary;

  Employee({
    required this.name,
    required this.salary,
  });

  void displayInfo() {
    print('Name: $name');
    print('Salary: \$${salary.toStringAsFixed(2)}');
  }
}

class Developer extends Employee {
  final String programmingLanguage;

  Developer({
    required String name,
    required double salary,
    required this.programmingLanguage,
  }) : super(name: name, salary: salary); 

  @override
  void displayInfo() {
    super.displayInfo();
    print('Role: Developer');
    print('Programming Language: $programmingLanguage');
  }
}

class Designer extends Employee {
  final String designTool;

  Designer({
    required String name,
    required double salary,
    required this.designTool,
  }) : super(name: name, salary: salary); 

  @override
  void displayInfo() {
    super.displayInfo();
    print('Role: Designer');
    print('Design Tool: $designTool');
  }
}

abstract class PaymentMethod {
  void pay(double amount);
}

class CreditCardPayment extends PaymentMethod {
  final String cardNumber;
  final String cardHolderName;

  CreditCardPayment({
    required this.cardNumber,
    required this.cardHolderName,
  });

  @override
  void pay(double amount) {
    String maskedCard = '****-****-****-${cardNumber.substring(cardNumber.length - 4)}';
    print('Processing Credit Card payment of \$${amount.toStringAsFixed(2)}...');
    print('Charged to card: $maskedCard (Holder: $cardHolderName)');
    print('Payment successful via Credit Card!\n');
  }
}

class CashPayment extends PaymentMethod {
  final double cashTendered;

  CashPayment({required this.cashTendered});

  @override
  void pay(double amount) {
    print('Processing Cash payment of \$${amount.toStringAsFixed(2)}...');
    if (cashTendered < amount) {
      print('Payment failed: Insufficient cash tendered (\$${cashTendered.toStringAsFixed(2)} provided).\n');
      return;
    }
    double change = cashTendered - amount;
    print('Cash tendered: \$${cashTendered.toStringAsFixed(2)}');
    print('Change to return: \$${change.toStringAsFixed(2)}');
    print('Payment successful via Cash!\n');
  }
}

class NotificationService {
  void sendNotification(String message) {
    print('Sending general notification: $message');
  }
}

class EmailNotification extends NotificationService {
  final String emailAddress;

  EmailNotification({required this.emailAddress});

  @override
  void sendNotification(String message) {
    print('📧 Sending Email to $emailAddress...');
    print('Content: "$message"');
    print('Email sent successfully!\n');
  }
}

class SmsNotification extends NotificationService {
  final String phoneNumber;

  SmsNotification({required this.phoneNumber});

  @override
  void sendNotification(String message) {
    print('📱 Sending SMS to $phoneNumber...');
    print('Content: "$message"');
    print('SMS sent successfully!\n');
  }
}

class PushNotification extends NotificationService {
  final String deviceToken;

  PushNotification({required this.deviceToken});

  @override
  void sendNotification(String message) {
    print('🔔 Sending Push Notification to device token (${deviceToken.substring(0, 6)}...)...');
    print('Content: "$message"');
    print('Push notification sent successfully!\n');
  }
}

abstract class Product {
  final String name;
  final double price;

  Product({
    required this.name,
    required this.price,
  });

  double calculateDiscount();
}

class Electronics extends Product {
  final int warrantyMonths;

  Electronics({
    required String name,
    required double price,
    required this.warrantyMonths,
  }) : super(name: name, price: price);

  @override
  double calculateDiscount() {
    return price * 0.10;
  }
}

class Clothing extends Product {
  final String size;

  Clothing({
    required String name,
    required double price,
    required this.size,
  }) : super(name: name, price: price);

  @override
  double calculateDiscount() {
    return price * 0.20;
  }
}

class ShoppingCart {
  final List<Product> _products = [];

  List<Product> get products => List.unmodifiable(_products);

  void addProduct(Product product) {
    _products.add(product);
    print('✅ Added "${product.name}" to cart.');
  }

  void removeProduct(Product product) {
    if (_products.contains(product)) {
      _products.remove(product);
      print('❌ Removed "${product.name}" from cart.');
    } else {
      print('⚠️ Product not found in cart.');
    }
  }

  double calculateTotal() {
    double total = 0.0;
    for (var product in _products) {
      double discount = product.calculateDiscount();
      double finalPrice = product.price - discount;
      total += finalPrice;
    }
    return total;
  }

  void displayCart() {
    print('\n--- Your Shopping Cart ---');
    if (_products.isEmpty) {
      print('Your cart is currently empty.');
      print('---------------------------\n');
      return;
    }

    for (var product in _products) {
      double discount = product.calculateDiscount();
      double finalPrice = product.price - discount;
      print('• ${product.name}');
      print('  Original: \$${product.price.toStringAsFixed(2)} | Discount: -\$${discount.toStringAsFixed(2)} | Final: \$${finalPrice.toStringAsFixed(2)}');
    }
    print('---------------------------');
    print('Final Total: \$${calculateTotal().toStringAsFixed(2)}\n');
  }
}

void main() {
  print('--- Testing BankAccount ---');
  BankAccount account = BankAccount(accountNumber: 'ACC-100203', initialBalance: 500.0);
  print('Account Number: ${account.accountNumber}');
  print('Initial Balance: \$${account.balance}');

  print('\n-- Deposit Operations --');
  account.deposit(250.0);
  account.deposit(-50.0);

  print('\n-- Withdrawal Operations --');
  account.withdraw(150.0);
  account.withdraw(700.0);

  print('\nFinal Balance: \$${account.balance}');

  print('\n----------------------------------------\n');
  print('--- Testing Employee Inheritance ---');
  Developer dev = Developer(
    name: 'Abdulrahman',
    salary: 1500.0,
    programmingLanguage: 'Dart / Flutter',
  );

  Designer designer = Designer(
    name: 'Ahmed',
    salary: 6800.0,
    designTool: 'django',
  );

  print('\n[Developer Details]');
  dev.displayInfo();

  print('\n[Designer Details]');
  designer.displayInfo();

  print('\n----------------------------------------\n');
  print('--- Testing Payment System Abstraction ---\n');
  List<PaymentMethod> payments = [
    CreditCardPayment(
      cardNumber: '4532123456789012',
      cardHolderName: 'Abdulrahman',
    ),
    CashPayment(
      cashTendered: 100.0,
    ),
  ];

  double billAmount = 75.50;

  for (var paymentMethod in payments) {
    paymentMethod.pay(billAmount);
  }

  print('\n----------------------------------------\n');
  print('--- Testing Polymorphism: Notifications ---\n');
  List<NotificationService> notifications = [
    EmailNotification(emailAddress: 'Abdo@example.com'),
    SmsNotification(phoneNumber: '010969069960'),
    PushNotification(deviceToken: 'token_90909090'),
  ];

  String alertMessage = 'Your system password has been successfully updated!';

  for (var notification in notifications) {
    notification.sendNotification(alertMessage);
  }

  print('\n----------------------------------------\n');
  print('--- Testing Task 5: Flutter Shopping Cart & Polymorphism ---\n');
  Product laptop = Electronics(name: 'Gaming Laptop', price: 10000.0, warrantyMonths: 24);
  Product headphones = Electronics(name: 'Wireless Headphones', price: 750.0, warrantyMonths: 12);
  Product tShirt = Clothing(name: 'Cotton T-Shirt', price: 100.0, size: 'L');
  Product jacket = Clothing(name: 'Jacket', price: 500.0, size: 'XL');

  ShoppingCart cart = ShoppingCart();

  cart.addProduct(laptop);
  cart.addProduct(headphones);
  cart.addProduct(tShirt);
  cart.addProduct(jacket);

  cart.displayCart();

  print('-- Action: Removing T-Shirt --');
  cart.removeProduct(tShirt);

  cart.displayCart();
}
