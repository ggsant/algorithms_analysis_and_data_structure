// Replace all vowel to exclamation mark in the sentence. aeiouAEIOU is vowel.

// Examples
// replace("Hi!") === "H!!"
// replace("!Hi! Hi!") === "!H!! H!!"
// replace("aeiou") === "!!!!!"
// replace("ABCDE") === "!BCD!"


fun main() {
    val inputString0 = "HI"
    println(replace(inputString0))
}

fun replace(s: String): String = Regex("[aeiouAEIOU]").replace(s, "!")
