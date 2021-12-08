// dado um vator A = (a1, a2, ...., an) com n numeros, obter uma permutação
// (a1', a2', ..., an') desses numero de modo que a1' <= a2' <= ... <= an'.

void main() {
  final vector = [3, 6, 2, 12, 4, 9, 10, 1, 5];
  print('Result for insertionSort ${insertionSort(vector)}');

  print('Result for insertionSort2 ${insertionSort2(vector)}');
}

List<int> insertionSort(List<int> array) {
  for (int j = 1; j < array.length; j++) {
    int key = array[j];

    int i = j - 1;

    while (i >= 0 && array[i] > key) {
      array[i + 1] = array[i];
      i = i - 1;
      array[i + 1] = key;
    }
  }
  return array;
}

List<int> insertionSort2(List<int> array) {
  for (var i = 0; i < array.length - 1; i++) {
    var temp = array[i];
    for (var j = i - 1; j > -1 && array[i] > temp; j--) {
      array[j + 1] = array[j];
      array[j + 1] = temp;
    }
  }
  return array;
}
