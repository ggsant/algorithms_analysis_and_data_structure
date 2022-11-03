// Idea: Go through the vector, analyzing each position i. If A[i].key equals K, then it found the
// position and returns i. If you went through the entire vector and no element equal to K exists,
// then return -1.

// Linear search is an algorithm which finds the position of a target value within an array (Usually
// unsorted)

// Worst-case performance O(n) Best-case performance O(1) Average performance O(n) Worst-case space
// complexity O(1)

void main() {
  final vector = [3, -10, 30, 7, 100, 27, 3, 7, 52];
  var k1 = 7;
  var k2 = 2;
  final n = vector.length;
  print('Result for k1 ${orderedLinearSearch(vector, n, k1)}');
  print('Result for k2 ${orderedLinearSearch(vector, n, k2)}');
}

/// [array] is the list of data on which the linear search will perform the operation.
///
/// [n] is the size of the array.
///
/// [k] is the key that must be fetched in the array.
int orderedLinearSearch(List<int> vector, int n, int k) {
  for (var i = 0; i <= n && k >= vector[i]; i++) {
    if (vector[i] == k) {
      return i;
    }
    print('iteração $i');
  }
  return -1;
}
