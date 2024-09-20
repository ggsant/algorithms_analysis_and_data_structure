void main() {
  final vector = [3, 6, 2, 12, 4, 9, 10, 1, 5];
  final ascending = insertionSort(vector, (a, b) => a - b);
  final descending = insertionSort(vector, (a, b) => b - a);
  print('Resultado da ordenação crescente: $ascending');
  print('Resultado da ordenação decrescente: $descending');
}

List<int> insertionSort(List<int> array, int Function(int a, int b) compare) {
  final sortedArray = List<int>.from(array); // Evita modificar a lista original
  for (var i = 1; i < sortedArray.length; i++) {
    final key = sortedArray[i];
    int j = i - 1;

    // Move os elementos de acordo com o comparador
    while (j >= 0 && compare(sortedArray[j], key) > 0) {
      sortedArray[j + 1] = sortedArray[j];
      j--;
    }

    // Coloca a chave na posição correta
    sortedArray[j + 1] = key;
  }
  return sortedArray;
}
