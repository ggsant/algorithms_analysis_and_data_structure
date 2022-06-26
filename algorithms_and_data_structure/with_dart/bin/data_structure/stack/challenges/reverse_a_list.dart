// Create a function that prints the contents of a list in reverse order.

import '../stack.dart';

void main() {
  printInReverse([1, 2, 3, 4, 5, 6]);
}

void printInReverse<T>(List<T> list) {
  var _stack = Stack<T>();
  Stack<T> _reversedStack = Stack<T>();

  for (T value in list) {
    _stack.push(value);
  }

  while (_stack.isNotEmpty) {
    _reversedStack.push(_stack.peek);
    _stack.pop();
  }

  print(_reversedStack.toString());
}
