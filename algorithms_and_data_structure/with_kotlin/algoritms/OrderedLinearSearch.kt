
/** 
* Idea: Do as in linear search, but stop as soon as A[i].key > k, 
* as it is not possible for the element to be on the right
*/

fun main() {
    val array = intArrayOf(-6, -1, 3, 7, 10, 27, 35, 37, 52)
    val k1 = 27
    val k2 = 2
    val n = array.size
    println("Result for k1 ${orderedLinearSearch(array, n, k1)}")
    println("Result for k2 ${orderedLinearSearch(array,  n, k2)}")
}

/**
 * @param array is an array where the element should be found
 * @param k is an element which should be found
 * @return index of the element
 */
fun orderedLinearSearch(array: IntArray, n: Int, k: Int): Int {
    var i = 0
    while (i <= n && k >= array.get(i)) {
        i++
        if (array[i].compareTo(k) == 0) {
            return i
        }
    }
    return -1
}
