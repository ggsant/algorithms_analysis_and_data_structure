// Ideia: A cada iteração, consideramos que estamos procurando o elemento de chave K em A[esq…dir].
//Comparamos com a posição do meio desse vetor e atualizamos esq ou dir de acordo.

void main() {
  final vector = [-6, -1, 3, 7, 10, 27, 35, 37, 52];
  var k1 = 7;
  var k2 = 2;
  final n = vector.length;
  print('Result for k1 ${binarySearch(vector, 0, n - 1, k1)}');
  print('Result for k2 ${binarySearch(vector, 0, n - 1, k2)}');
}

/// [array] is the list of data on which the linear search will perform the operation.
///
/// [left] is the index of the first element at array.
///
/// [right] is the index of the last element at array.
///
/// [k] is the key that must be fetched in the array.
int binarySearch(List<int> array, int left, int right, int k) {
  if (right >= left) {
    int middle = (left + (right - left) / 2).toInt();

    //If the element is present at middle
    if (array[middle] == k) {
      return middle;
    }

    //If the element is smaller than middle
    if (array[middle] > k) {
      return binarySearch(array, left, middle - 1, k);
    }

    return binarySearch(array, middle + 1, right, k);
  }
  return -1;
}
