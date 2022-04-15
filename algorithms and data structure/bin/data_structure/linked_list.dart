void main() {
  final list = LinkedList<int>();
  list.insertAt(0, 1);
  list.insertAt(1, 2);
  list.insertAt(2, 3);
  print('Before: $list');
  list.insertAt(1, 10);
  print('After: $list');
  list.removeAt(3);
  print(list);
  for (final element in list) {
    print('nó: $element');
  }
}

class Node<T> {
  Node(this.data, {this.refNext});
  T data;
  Node<T>? refNext;
}

class LinkedList<T> extends Iterable<T> {
  Node<T>? head;
  Node<T>? tail;

  LinkedList() : head = null;

  @override
  bool get isEmpty => head == null;

  void insertAt(int index, T value) {
    if (isEmpty) {
      head = Node(value);
    } else {
      final node = findNodeAt(index - 1);

      if (tail == node) {
        tail!.refNext = Node(value);
        tail = tail!.refNext;
      }
      if (node == null) {
        throw Exception('Unable to add node to list');
      }

      node.refNext = Node(value, refNext: node.refNext);
    }
  }

  Node<T>? findNodeAt(int index) {
    var currentNode = head;
    var currentIndex = 0;
    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.refNext;
      currentIndex += 1;
    }
    return currentNode;
  }

  T? removeAt(int index) {
    final node = findNodeAt(index - 1);
    if (node == null) {
      throw Exception('Unable to remove node to list');
    }
    final value = node.refNext?.data;
    if (node.refNext == tail) {
      tail = node;
    }
    node.refNext = node.refNext?.refNext;
    return value;
  }

  @override
  Iterator<T> get iterator => _LinkedListIterator(this);
}

class _LinkedListIterator<T> implements Iterator<T> {
  _LinkedListIterator(LinkedList<T> list) : _list = list;
  final LinkedList<T> _list;
  Node<T>? _currentNode;
  bool _firstPass = true;
  @override
  T get current => _currentNode!.data;

  @override
  bool moveNext() {
    if (_list.isEmpty) return false;
    if (_firstPass) {
      _currentNode = _list.head;
      _firstPass = false;
    } else {
      _currentNode = _currentNode?.refNext;
    }
    return _currentNode != null;
  }
}
