int searchInRotatedArray(List<int> arr, int target) {
  // Initialize the left and right pointers to the start and end of the array
  int left = 0;
  int right = arr.length - 1;

  // Continue the search until the left pointer is greater than the right pointer
  while (left <= right) {
    // Calculate the middle index of the current search range
    int mid = left + (right - left) ~/ 2;

    // Check if the middle element is the target
    if (arr[mid] == target) {
      return mid; // Target found at index mid, so return mid
    }

    // Determine which part of the array is sorted
    if (arr[left] <= arr[mid]) {
      // If the left side from arr[left] to arr[mid] is sorted
      
      // Check if the target lies within the sorted left part
      if (target >= arr[left] && target < arr[mid]) {
        // If true, narrow search to the left part by moving right pointer to mid - 1
        right = mid - 1;
      } else {
        // Otherwise, search the right part by moving left pointer to mid + 1
        left = mid + 1;
      }
    } else {
      // If the right side from arr[mid] to arr[right] is sorted
      
      // Check if the target lies within the sorted right part
      if (target > arr[mid] && target <= arr[right]) {
        // If true, narrow search to the right part by moving left pointer to mid + 1
        left = mid + 1;
      } else {
        // Otherwise, search the left part by moving right pointer to mid - 1
        right = mid - 1;
      }
    }
  }

  // Target was not found in the array, so return -1
  return -1;
}

void main() {
  // Define a rotated sorted array
  List<int> arr = [15, 18, 2, 3, 6, 12];
  int target = 18; // The target element we want to find in the array

  // Call the searchInRotatedArray function to find the target
  int result = searchInRotatedArray(arr, target);

  // Check if the target was found
  if (result != -1) {
    // If found, print the index where the target was found
    print("Target $target found at index $result.");
  } else {
    // If not found, print a message indicating the target was not in the array
    print("Target $target not found in array.");
  }
}

