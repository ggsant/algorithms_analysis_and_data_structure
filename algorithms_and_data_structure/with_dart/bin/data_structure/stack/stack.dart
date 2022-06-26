void main() {
  Stack<String> stack = Stack<String>();
  stack.push('Livro 1');
  stack.push('Livro 2');
  stack.push('Livro 3');
  stack.push('Livro 4');
  stack.push('Livro 5');
  stack.push('Livro 6');
  print(stack.toString());
  print('Removendo');
  stack.pop();
  stack.pop();
  stack.pop();
  print(stack.toString());
}

class Stack<T> {
  Stack() : _storage = <T>[];

  Stack.of(Iterable<T> elements) : _storage = List<T>.of(elements);

  final List<T> _storage;

  void push(T element) => _storage.add(element);

  T pop() => _storage.removeLast();

  T get peek => _storage.last;

  bool get isEmpty => _storage.isEmpty;

  bool get isNotEmpty => !isEmpty;

  @override
  String toString() {
    return '--- Top ---\n'
        '${_storage.reversed.join('\n')}'
        '\n-----------';
  }
}
