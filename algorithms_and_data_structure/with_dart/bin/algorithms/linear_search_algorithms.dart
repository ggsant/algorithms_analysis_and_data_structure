/// Retorna -1 caso não encontre ou a posição, caso encontre.

void main() {
  final vector = [-6, -1, 3, 7, 10, 27, 35, 37, 52];
  var k1 = 27;
  var k2 = 2;
  final n = vector.length;
  print('Result for k1 ${linearSearch(vector, n, k1)}');
  print('Result for k2 ${linearSearch(vector, n, k2)}');
}

int linearSearch(List<int> vector, int n, int k) {
  for (var i = 0; i < n; i++) {
    if (vector[i] == k) {
      return i;
    }
    print('iteração $i');
  }
  return -1;
}
