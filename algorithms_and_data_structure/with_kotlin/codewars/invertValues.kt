fun main() {
    invert(intArrayOf(1,2,3,4,5,6)).forEach {
        print(it)
    }
}

fun invert(arr: IntArray): IntArray {

    return arr.map { num -> num * -1 }.toIntArray()
}

