void main() {
  final list = SinglyLinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(1);
  print('Before: $list');
  final firstNode = list.nodeAt(0);
  list.removeAfter(firstNode!);
  print('After: $list');
}

class Node<T> {
  Node(this.data, {this.refNext});
  T data;
  Node<T>? refNext;

  @override
  String toString() {
    if (refNext == null) return '$data';
    return '$data -> ${refNext.toString()}';
  }
}

class SinglyLinkedList<T> {
  Node<T>? head;
  Node<T>? tail;

  SinglyLinkedList() : head = null;

  bool get isEmpty => head == null;

  void push(T data) {
    final newNode = Node(data, refNext: head);
    head = newNode;
    tail ??= head;
  }

  void append(T data) {
    if (isEmpty) {
      push(data);
      return;
    }
    final newNode = Node(data);
    tail!.refNext = newNode;
    tail = newNode;
  }

  Node<T>? nodeAt(int index) {
    var currentNode = head;
    var currentIndex = 0;
    while (currentNode != null && currentIndex < index) {
      currentNode = currentNode.refNext;
      currentIndex += 1;
    }
    return currentNode;
  }

  void insertAfter(Node<T> node, T data) {
    if (tail == node) {
      append(data);
    }
    final newNode = Node(data, refNext: node.refNext);
    node.refNext = newNode;
  }

  void pop() {
    head = head?.refNext;
    if (isEmpty) {
      tail = null;
    }
  }

  void removeLast() {
    if (head?.refNext == null) pop();
    var current = head;
    while (current!.refNext != tail) {
      current = current.refNext;
    }
    tail = current;
    tail?.refNext = null;
  }

  void removeAfter(Node<T> node) {
    if (node.refNext == tail) {
      tail = node;
    }
    node.refNext = node.refNext?.refNext;
  }

  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return head.toString();
  }
}
