void main() {
  final vector = [3, 6, 2, 12, 4, 9, 10, 1, 5];
  print('Result for insertionSort ${insertionSort(vector)}');
}

List<int> insertionSort(List<int> array) {
  for (var i = 1; i < array.length; i++) {
    var currentValue = array[i];
    for (var j = i - 1; j > 0 && array[i] > currentValue; j--) {
      array[j + 1] = array[j];
      array[j + 1] = currentValue;
    }
  }
  return array;
}
