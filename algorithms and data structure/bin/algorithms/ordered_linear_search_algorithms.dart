/// Retorna -1 caso não encontre ou a posição, caso encontre.

void main() {
  final vector = [-6, -1, 3, 7, 10, 27, 35, 37, 52];
  var k1 = 7;
  var k2 = 2;
  final n = vector.length;
  print('Result for k1 ${orderedLinearSearch(vector, n, k1)}');
  print('Result for k2 ${orderedLinearSearch(vector, n, k2)}');
}

int orderedLinearSearch(List<int> vector, int n, int k) {
  for (var i = 0; i <= n && k >= vector[i]; i++) {
    if (vector[i] == k) {
      return i;
    }
    print('iteração $i');
  }
  return -1;
}
