/**
 * Retorna -1 caso não encontre ou a posição, caso encontre.
 */

void main() {
  final vector = [-6, -1, 3, 7, 10, 27, 35, 37, 52];
  var k1 = 7;
  var k2 = 2;
  final n = vector.length;
  print('Result for k1 ${orderedLinearSearch(vector, n, k1)}');
  print('Result for k2 ${orderedLinearSearch(vector, n, k2)}');
}

int orderedLinearSearch(List<int> vector, int n, int k) {
  int esq = 1;
  int dir = n;
  while (esq <= dir) {
    print('iteração');

    int meio = ((esq + dir) / 2).round();

    if (vector[meio] == k) {
      return meio;
    } else if (k > vector[meio]) {
      esq = meio + 1;
    } else {
      dir = meio - 1;
    }
  }
  return -1;
}
