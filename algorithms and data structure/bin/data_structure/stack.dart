void main() {
  Stack<String> stack = Stack<String>();
  stack.setSizeMax(10);
  stack.push('Livro 1');
  stack.push('Livro 2');
  stack.push('Livro 3');
  stack.push('Livro 4');
  stack.push('Livro 5');
  stack.push('Livro 6');

  print(stack.length);
  stack.printStack();
  stack.peek();

  print('Removendo');
  stack.pop();
  stack.pop();
  stack.pop();
  print(stack.length);
  stack.printStack();
  stack.peek();
}

class Stack<T> {
  Stack();

  final List<T> _list = [];

  /// the maximum number of entries allowed on the stack.
  late int _sizeMax = 0;

  /// get the length of the stack.
  int get length => _list.length;

  /// check if the stack is empty.
  bool get isEmpty => _list.isEmpty;

  setSizeMax(int sizeMax) {
    if (sizeMax < 2) {
      print('Error: The stack size must be 2 entries or more ');
    } else {
      _sizeMax = sizeMax;
    }
  }

  /// push element in top of the stack.
  void push(T element) {
    if (_list.length < _sizeMax) {
      _list.add(element);
    } else {
      print('Error: cannot add element. Stack already at maximum size of: ${_sizeMax} elements');
    }
  }

  /// get the top of the stack and delete it.
  T pop() {
    if (isEmpty) {
      print('Can\'t use pop with empty stack\n consider checking for size or isEmpty before calling pop');
    }
    T result = _list.last;
    _list.removeLast();
    return result;
  }

  T peek() {
    if (isEmpty) {
      print('Can\'t use top with empty stack\n consider checking for size or isEmpty before calling top');
    }
    print('The top element is ${_list.last}');
    return _list.last;
  }

  void printStack() => print(_list);
}
