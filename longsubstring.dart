lengthOfLongestSubstring(String s) {
  //Declares a function named lengthOfLongestSubstring that takes a String s as input and returns an int which will be the length of the longest substring without repeating characters.
  int maxLength = 0; // To keep track of the maximum length of substring found since we havent move to any character.
  int left = 0; // Left pointer of the window left is the start of the current window.
  Set<String> charSet = {}; // Set to store characters in the current window
  //charSet holds characters in the current substring window to check for duplicates.

  // Loop through each character in the string
  for (int right = 0; right < s.length; right++) {
   //This for loop iterates over each character in the string s using the right pointer, which represents the ending index of the current substring window.
    // If the character at right pointer is a duplicate, move the left pointer
    while (charSet.contains(s[right])) {
      //the while loop ensures that there are no repeating characters in the current window (left to right) if true 
      // it means there’s a duplicate, so we need to adjust the left pointer to create a new substring without this duplicate.

      charSet.remove(s[left]); // Remove the character at left pointer from the set
      left++; // Move the left pointer forward
    }

    // Add the current character at the right pointer to the set
    charSet.add(s[right]);

    // Update maxLength if the current window is longer
    maxLength = maxLength > (right - left + 1) ? maxLength : (right - left + 1);
    //Here, we check if the size of the current substring (from left to right) is larger than maxLength.
    //If it is, we update maxLength to this new length.
  }

  return maxLength; // Return the maximum length of non-repeating substring,which represents the length of the longest substring without repeating characters.

  
}

void main() {
  String input = "abcabcbbabc";//input is the string we want to analyze.
  int result = lengthOfLongestSubstring(input);//We call lengthOfLongestSubstring with input and print the result.
  print("The length of the longest substring without repeating characters is: $result");
}
//For "abcabcbb", the output would be 3 (the substring "abc" is the longest without repeats).
