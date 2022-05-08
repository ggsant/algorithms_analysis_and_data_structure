class Solution

fun main() {

    print(firstBadVersion(20))
}

fun isBadVersion(version: Int): Boolean {
    when (version) {
        15 -> return true
        10 -> return true
        else -> return false
    }
}

fun firstBadVersion(n: Int): Int = firstBadVersion(n, 1, n)

private tailrec fun firstBadVersion(n: Int, start: Int, end: Int): Int =
        when {
            start > end -> 0
            else -> {
                val middle = start + (end - start) / 2
                when {
                    !isBadVersion(middle) -> firstBadVersion(n, middle + 1, end)
                    middle > 1 && isBadVersion(middle - 1) -> firstBadVersion(n, start, middle - 1)
                    else -> middle
                }
            }
        }
