/// Idea: Go through the vector, analyzing each position i.
/// If A[i].key equals K, then it found the position and returns i.
/// If you went through the entire vector and no element equal to K exists,
/// then return -1.

void main() {
  final array = [3, -10, 30, 7, 100, 27, 3, 7, 52];
  var k1 = 27;
  var k2 = -1;
  var n = array.length;
  print('Result for k1 ${linearSearch(array, n, k1)}');
  print('Result for k2 ${linearSearch(array, n, k2)}');
}

/// [array] is the list of data on which the linear search will perform the operation.
///
/// [n] is the size of the array.
///
/// [k] is the key that must be fetched in the array.
int linearSearch(List<int> array, int n, int k) {
  for (int i = 0; i <= n; i++) {
    if (array[i] == k) {
      return i;
    }
  }
  return -1;
}
