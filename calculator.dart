import 'dart:io';
//Imports the dart:io library, which provides input/output capabilities, including reading from the console.

// Basic Calculator Function
double basicCalculator(double num1, double num2, String operator) {
  //This function basicCalculator takes two numbers (num1 and num2) and an arithmetic operator as input and return a double result based on the operation given.
  switch (operator) {
    // switch statement checks the operator value to perform the operation.
    case '+':
      return num1 + num2; //if the operator is positive  it returns the sum.
    case '-':
      return num1 -
          num2; //if the operator is negative it returns the difference.
    case '*':
      return num1 *
          num2; //if the operator is multiplication it returns the product.
    case '/':
      if (num2 == 0) {
        //the operator is '/', it checks if num2 is zero to avoid division by zero, which would throw an exception.

        throw Exception("Error: Division by zero is not allowed.");
      }
      return num1 / num2; //if its non-zero it returns the division result

    case '%':
      if (num2 == 0) {
        //If the operator is '%', it also checks if num2 is zero to avoid a modulo by zero error.
        throw Exception("Error: Division by zero is not allowed.");
      }
      return num1 %
          num2; // If num2 is valid, it returns the remainder of the division.

    default:
      throw Exception("Error: Invalid operator.");
    //If the operator doesn’t match any case, the function throws an exception with an error message indicating an invalid operator.
  }
}

// Function for handling multi-step operations
double multiStepCalculator(List<dynamic> operations) {
  //multiStepCalculator takes a list called operations, which contains numbers and operators in a sequence for multi-step calculations.

  double result = operations[
      0]; // Start with the first number Sets result to the first element of operations, which is assumed to be a number.

  for (int i = 1; i < operations.length; i += 2) {
    String operator = operations[i]; // Operator
    double num = operations[i + 1]; // Next number
    result = basicCalculator(result, num, operator); // Perform calculation
    //This for loop starts from the second element in operations (index 1), assuming it to be an operator.
    //The next element (index i + 1) is assumed to be the next number.
    // The loop increments by 2 on each iteration to handle operator and num pairs.
    //the basiccalculator funtion  is called and the current num and operator to perform operation.
  }
  return result; //returns the result
}

void main() {
  //main function
  // Example of a basic operation
  print('Enter first number: '); //user enters the first number
  double num1 = double.parse(stdin.readLineSync()!);//reads the input as a string, and converts it to a double for num1.

  print('Enter operator (+, -, *, /, %): ');//enter any operator
  String operator = stdin.readLineSync()!;//reads and stores it as an operator

  print('Enter second number: ');//user enters second number
  double num2 = double.parse(stdin.readLineSync()!);//reads the input and stores it as num 2 after passing it to a double

  try {
    //Try Block: This block contains the code that might throw an exception. You "try" to execute this code.
    //Uses a try-catch block to handle potential exceptions from basicCalculator.
    // If no error occurs, it prints the result. If an error occurs (like division by zero), it catches the exception and prints the error message.

    double result = basicCalculator(num1, num2, operator);
    //This line calls the basicCalculator function with three arguments: num1, num2, and operator.
    ////The basicCalculator function performs a mathematical operation (addition, subtraction, multiplication, division, or modulo) based on the specified operator.
    print('Result: $result');//If the operation is valid and no errors occur (like division by zero), this line will execute successfully, and result will contain the calculated value.
  } catch (e) {//This line indicates the beginning of the catch block, which is used to handle exceptions that may arise during the execution of the code in the try block.
    print(e);//This line prints the error message (the exception) to the console.
  }

  // Example of a multi-step operation
  List<dynamic> operations = [5, '+', 3, '*', 2, '/', 4]; //This line defines a list named operations that contains a sequence of calculations to be performed.
  //The list includes numbers and operators in the order they should be processed. The expression 5 + 3 * 2 / 4 will be calculated in sequence.
  try { //This line begins a try block to execute code that may throw an exception during execution.

    double result = multiStepCalculator(operations);//This line calls the multiStepCalculator function with the operations list as its argument
    print('Multi-step result: $result');
  }
  catch (e) { //marks the begining of the block
    print(e);//This line prints the error message related to the multi-step calculation.
  }
}
