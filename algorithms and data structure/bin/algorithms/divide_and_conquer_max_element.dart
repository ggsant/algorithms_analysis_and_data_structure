/// Encontrar o elemento maximo em um vetor de inteiros positivos nao ordenados
/// usando dividir e conquistar, sem ordenar

void main() {
  final vector = [3, 27, 12, 55, 2, 36, 10, 19, 150];
  final n = vector.length;
  print('The max value in the array is ${findMaxValue(vector, 0, n - 1)}');
}

int findMaxValue(List<int> vector, int start, int end) {
  late int max;
  if (start == end) {
    return max = vector[start];
  } else if (start + 1 == end) {
    if (vector[start] < vector[end]) {
      return max = vector[end];
    } else {
      return max = vector[start];
    }
  } else {
    int middle = (start + (end - start) / 2).round();
    int left = findMaxValue(vector, start, middle);
    int right = findMaxValue(vector, middle + 1, end);
    if (left > right) {
      max = left;
    } else {
      max = right;
    }
  }
  return max;
}
