// Given an array of integers nums which is sorted in ascending order, and an integer target, write a function to search target in nums. If target exists, then return its index. Otherwise, return -1.

// You must write an algorithm with O(log n) runtime complexity.

 

// Example 1:

// Input: nums = [-1,0,3,5,9,12], target = 9
// Output: 4
// Explanation: 9 exists in nums and its index is 4
// Example 2:

// Input: nums = [-1,0,3,5,9,12], target = 2
// Output: -1
// Explanation: 2 does not exist in nums so return -1
 

// Constraints:

// 1 <= nums.length <= 104
// -104 < nums[i], target < 104
// All the integers in nums are unique.
// nums is sorted in ascending order.

// Binary Search

// 1. Specifies the index in the middle of the array

// 2. Checks whether or not the value of the middle index is greater or less than the value we’re looking for

// 3. Isolates the part of the array that has the value

// 4. Repeats steps 1–3 until the value is found
class BinarySearch

fun main(){
    print(binarySearch(23, arrayOf(12, 3, 24, 5, 10, 23, 9)))

}

fun binarySearch(target: Int, array: Array<Int>): Int {
    array.sort();

    var index: Int = 0
    var end = array.size - 1

    while(index <= end){

        val middle: Int = (index + end) / 2

            
        if (target < array[middle]){
            end = middle - 1
        } else if(target > array[middle]){
            index = middle + 1
        } else {
            return middle
        }
    }
    return -1
}