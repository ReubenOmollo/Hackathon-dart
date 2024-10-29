import 'dart:io';

// Basic Calculator Function
double basicCalculator(double num1, double num2, String operator) {
  switch (operator) {
    case '+':
      return num1 + num2;//if the operator is  positive it retirns the sum.
    case '-':
      return num1 - num2;//if the operator is negative it returns the difference.
    case '*':
      return num1 * num2;//if the operator is multiplication it returns the product.
    case '/':
      if (num2 == 0) {//the operator is '/', it checks if num2 is zero to avoid division by zero, which would throw an exception.
        throw Exception("Error: Division by zero is not allowed.");
      }
      return num1 / num2;////if its non-zero it returns the division result
    case '%':
      if (num2 == 0) {// //If the operator is '%', it also checks if num2 is zero to avoid a modulo by zero error.
        throw Exception("Error: Division by zero is not allowed.");
      }
      return num1 % num2;// If num2 is valid, it returns the remainder of the division.
    default:
      throw Exception("Error: Invalid operator.");
  }
}

// Function for handling multi-step operations
double multiStepCalculator(List<dynamic> operations) {
  double result = operations[0]; // Start with the first number
  for (int i = 1; i < operations.length; i += 2) {
    String operator = operations[i]; // Operator
    double num = operations[i + 1]; // Next number
    result = basicCalculator(result, num, operator); // Perform calculation
  }
  return result;//returns the result
}

void main() {//the main 
  // Example of a basic operation
  print('Enter first number: ');
  double num1 = double.parse(stdin.readLineSync()!);

  print('Enter operator (+, -, *, /, %): ');
  String operator = stdin.readLineSync()!;

  print('Enter second number: ');
  double num2 = double.parse(stdin.readLineSync()!);

  try {
    double result = basicCalculator(num1, num2, operator);
    print('Result: $result');
  } catch (e) {
    print(e);
  }

  // Example of a multi-step operation
  List<dynamic> operations = [5, '+', 3, '*', 2, '/', 4]; // 5 + 3 * 2 / 4
  try {
    double result = multiStepCalculator(operations);
    print('Multi-step result: $result');
  } catch (e) {
    print(e);
  }
}
