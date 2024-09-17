void main() {
  final vector = [3, 6, 2, 12, 4, 9, 10, 1, 5];
  print('Result for ascendingInsertionSort ${ascendingInsertionSort(vector)}');
  print('Result for descendingInsertionSort ${descendingInsertionSort(vector)}');
}

List<int> ascendingInsertionSort(List<int> array) {
  for (var i = 1; i < array.length; i++) {
    final key = array[i];
    int j = i - 1;

    // Move os elementos maiores que key uma posição à frente
    while (j >= 0 && array[j] > key) {
      array[j + 1] = array[j];
      j--;
    }

    // Coloca o key na posição correta
    array[j + 1] = key;
  }
  return array;
}

List<int> descendingInsertionSort(List<int> array) {
  for (var i = 1; i < array.length; i++) {
    final key = array[i]; //
    int j = i - 1;

    // Move os elementos maiores que key uma posição à frente
    while (j >= 0 && array[j] < key) {
      array[j + 1] = array[j];
      j--;
    }

    // Coloca o key na posição correta
    array[j + 1] = key;
  }
  return array;
}
