/**
 * Idea: Go through the vector, analyzing each position i. If A[i].key equals K, then it found the
 * position and returns i. If you went through the entire vector and no element equal to K exists,
 * then return -1.
 *
 * Linear search is an algorithm which finds the position of a target value within an array (Usually
 * unsorted)
 *
 * Worst-case performance O(n) Best-case performance O(1) Average performance O(n) Worst-case space
 * complexity O(1)
 */
fun main() {
    val array = intArrayOf(-6, -1, 3, 7, 10, 27, 35, 37, 52)
    val k1 = 27
    val k2 = 2
    println("Result for k1 ${linearSearch(array,  k1)}")
    println("Result for k2 ${linearSearch(array,  k2)}")
}

/**
 * @param array is an array where the element should be found
 * @param k is an element which should be found
 * @return index of the element
 */
fun linearSearch(array: IntArray, k: Int): Int {
    for (i in array.indices) {
        if (array[i].compareTo(k) == 0) {
            return i
        }
    }

    return -1
}
