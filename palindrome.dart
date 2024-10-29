bool isPalindrome(String str) {
  //This line defines a function named isPalindrome that takes a single parameter, str, which is of type String.
  // Step 1: Remove all non-alphanumeric characters and convert the string to lowercase
  String cleanedStr = str.replaceAll(RegExp(r'[^0-9a-zA-Z]'), '').toLowerCase();
  //This uses a regular expression (RegExp) to match all non-alphanumeric characters (anything that is not a digit 0-9 or a letter a-zA-Z) in the string str.

  // Step 2: Reverse the cleaned string
  String reversedStr = cleanedStr.split('').reversed.join('');
  //cleanedStr.split(''): This splits the cleaned string
//.reversed: This property creates an iterable that contains the characters in reverse order.
//.join:This joins the reversed characters back into a single string.
  // Step 3: Compare the cleaned string with the reversed string.

  return cleanedStr == reversedStr;
  //this line compares the cleaned string (cleanedStr) with its reversed version (reversedStr).
}

void main() {
  // Test cases
  print(isPalindrome("eye")); // Expected output: true
  print(isPalindrome("Race car!")); // Expected output: true
  print(isPalindrome("not a palindrome")); // Expected output: false
}
