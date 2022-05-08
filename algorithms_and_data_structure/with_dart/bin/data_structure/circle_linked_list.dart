void main(List<String> args) {
  LinkedListCycle<int> list = LinkedListCycle();
  list.push(3);
  list.push(4);
  list.push(5);
  list.display();
  list.append(2);
  list.append(1);
  list.append(0);
  list.display();
  list.addAfter(10, Node(3));
  list.display();
  list.deleteNode(10);
  list.deleteNode(4);
  list.display();
}

class Node<T> {
  Node(this.data, {this.next});
  T data;
  Node<T>? next;

  @override
  String toString() {
    if (next == null) return '$data';
    return '$data -> ${next.toString()}';
  }
}

class LinkedListCycle<T> {
  Node<T>? last;
  int length;

  LinkedListCycle()
      : last = null,
        length = 0;

  bool get isEmpty => last == null;

  void push(T data) {
    final newNode = Node(data);
    if (isEmpty) {
      last = newNode;
      last?.next = newNode;
    } else {
      final oldHead = last?.next; // referencia ao primeiro nó
      newNode.next = oldHead;
      last?.next = newNode;
    }
  }

  void append(T data) {
    final newNode = Node(data);

    if (isEmpty) {
      push(data);
    } else {
      newNode.next = last?.next;
      last?.next = newNode;
      last = newNode;
    }
  }

  void addAfter(T data, Node<T>? nodeBefore) {
    if (nodeBefore == null) {
      return;
    }
    if (isEmpty) {
      push(data);
    }
    final lastNext = last?.next;

    Node<T> newNode;
    // Transverse the List from last Node onwards.
    Node<T> transversalNode = lastNext!;
    do {
      if (transversalNode.data == nodeBefore.data) {
        // We found the node.
        newNode = Node(data);
        newNode.next = transversalNode.next;
        transversalNode.next = newNode;

        if (transversalNode == last) {
          // If the nodeBefore was LastNode itself, meaning we are inserting this node at the end,
          // adjust the last pointer to point to this node now.
          last = newNode;
        }
      }
      transversalNode = transversalNode.next!;
    } while (transversalNode !=
        lastNext); // Keep transversing until we reach the Node after which the new node has to be inserted.
  }

  Node? deleteNode(T data) {
    // if Circular Linked List is empty
    if (last == null) {
      return null;
    }

    // If the Circular Linked List contains only a single node
    if (last!.data == data && last!.next == last) {
      // If Circular Linked List has only one Node, last.next will point to last,
      // as last is itself the starting node in this case.
      last = null;
      return last;
    }

    Node<T>? temp = last;

    // If last is to be deleted --  Scenario 2.
    if (last!.data == data) {
      // find the node before the last node
      while (temp!.next != last) {
        temp = temp.next;
      }

      // point temp node to the next of last i.e. first node
      temp.next = last!.next;
      last = temp.next;
    }

    // travel to the node to be deleted
    while (temp!.next != last && temp.next!.data != data) {
      temp = temp.next;
    }

    // If node to be deleted was found -- Scenario 3.
    if (temp.next!.data == data) {
      Node<T>? toDelete = temp.next;
      temp.next = toDelete!.next;
    }
    return last;
  }

  void display() {
    Node<T>? temp = last;
    String a = '[...';

    if (last != null) {
      do {
        a += temp!.next!.data.toString() + '->';
        temp = temp.next;
      } while (temp!.next != last);
    }
    a += temp!.next!.data.toString() + '...]';
    print(a);
  }
}
