void main() {
  final list = DoublyLinkedList<int>();
  list.push(3);
  list.push(2);
  list.push(1);
  print(list);
  final list2 = DoublyLinkedList<int>();
  list2.append(4);
  list2.append(5);
  list2.append(6);
  print(list2);
  final list3 = DoublyLinkedList<int>();
  list3.push(3);
  list3.push(2);
  list3.push(1);
  print('Before: $list3');
  var middleNode = list3.nodeAt(1)!;
  list3.insertAfter(middleNode, 42);
  print('After: $list3');
  final list4 = DoublyLinkedList<int>();
  list4.push(3);
  list4.push(2);
  list4.push(1);
  print('Before: $list4');
  var middleNodee = list4.nodeAt(1)!;
  print('middleNodee: ${middleNodee.data}');

  list4.insertBefore(middleNodee, 42);
  print('After: $list4');

  final list5 = DoublyLinkedList<int>();
  list5.push(3);
  list5.push(2);
  list5.push(1);
  print('Before: $list5');
  list5.pop();
  print('After: $list5');

  final list6 = DoublyLinkedList<int>();
  list6.push(3);
  list6.push(2);
  list6.push(1);
  print('Before: $list6');
  list6.removeLast();
  print('After: $list6');
}

class Node<T> {
  Node(this.data, {this.refNext, this.refPrevious});
  T data;
  Node<T>? refNext;
  Node<T>? refPrevious;

  @override
  String toString() {
    if (refPrevious == null) return '$data ';
    return '$refPrevious -> $data ';
  }
}

class DoublyLinkedList<T> {
  Node<T>? head;
  Node<T>? tail;

  DoublyLinkedList() : head = null;

  bool get isEmpty => head == null;

  void push(T data) {
    final newNode = Node(data, refNext: head);
    if (head != null) {
      head!.refPrevious = newNode;
    }
    head = newNode;
    tail ??= head;
  }

  void append(T data) {
    if (isEmpty) {
      push(data);
      return;
    }
    final newNode = Node(data, refPrevious: tail);
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

  void insertAfter(Node<T> prevNode, T data) {
    if (tail == prevNode) {
      append(data);
    }

    final newNode = Node(data, refNext: prevNode.refNext);

    prevNode.refNext = newNode;
    newNode.refPrevious = prevNode;
    if (newNode.refNext != null) {
      newNode.refNext!.refPrevious = newNode; // atualiza o refPrev do nó que vem depois do novo nó
    }
  }

  void insertBefore(Node<T> nextNode, T data) {
    if (head == nextNode) {
      push(data);
    }

    final newNode = Node(data, refNext: nextNode);

    newNode.refPrevious = nextNode.refPrevious;
    nextNode.refPrevious = newNode;

    if (newNode.refNext != null) {
      newNode.refPrevious!.refNext = newNode; // atualiza o refPrev do nó que vem antes do novo nó
    }
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

  void removeBefore(Node<T> node) {
    if (node.refPrevious == head) {
      head = node;
    }
    node.refPrevious = node.refPrevious?.refPrevious;
  }

  @override
  String toString() {
    if (isEmpty) return 'Empty list';
    return tail.toString();
  }
}
