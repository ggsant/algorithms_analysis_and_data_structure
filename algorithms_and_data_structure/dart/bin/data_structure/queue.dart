// Queues use FIFO (first-in-first-out) ordering, meaning the first element that was
// added will always be the first to be removed. Queues are handy when you need to
// maintain the order of your elements to process later.

// These are the meanings of the core operations:
// • enqueue: Insert an element at the back of the queue. Return true if the operation
// was successful.
// • dequeue: Remove the element at the front of the queue and return it.
// • isEmpty: Check if the queue is empty.
// • peek: Return the element at the front of the queue without removing it.
// Notice that the queue only cares about removal from the front and insertion at the
// back. You don’t need to know what the contents are in between. If you did, you
// would probably just use a list.

import 'doubly_linked_list.dart';
import 'ring_buffer.dart';

abstract class Queue<T> {
  bool enqueue(T element);
  T? dequeue();
  bool get isEmpty;
  T? get peek;
}

//! List-Based Implementation
// The Dart core library comes with a set of highly optimized data structures that you
// can use to build higher-level abstractions. One of them that you’re already familiar
// with is List, the data structure that stores a contiguous, ordered collection of
// elements. In this section, you’ll use a list to create a queue.

class QueueList<T> implements Queue<T> {
  final _list = <T>[];

  /// Remove the element at the front of the queue and return it.
  ///
  /// Removing an element from the beginning of a list is always a linear-time operation
  /// because it requires all the remaining elements in the list to be shifted in memory.
  @override
  T? dequeue() => isEmpty ? null : _list.removeAt(0);

  /// Insert an element at the back of the queue. Return true if the operation was successful.
  ///
  /// Enqueuing an element is, on average, an O(1) operation. This is because the list has empty space at the back.
  @override
  bool enqueue(T element) {
    _list.add(element);
    return true;
  }

  ///  Check if the queue is empty.
  @override
  bool get isEmpty => _list.isEmpty;

  /// Return the element at the front of the queue without removing it.
  @override
  T? get peek => isEmpty ? null : _list.first;

  @override
  String toString() => _list.toString();
}

//! Doubly Linked List Implementation
// One of the main problems with QueueList was that dequeuing an item took linear
// time. With the linked list implementation, you reduced it to a constant operation,
// O(1). All you needed to do was update the node’s pointers.
// The main weakness with QueueLinkedList is not apparent from the table. Despite
// O(1) performance, it suffers from high overhead. Each element has to have extra
// storage for the forward and back references. Moreover, every time you create a new
// element, it requires a relatively expensive dynamic allocation of memory for the new
// node. By contrast, QueueList does bulk allocation, which is faster.

class QueueLinkedList<T> implements Queue<T> {
  final _list = DoublyLinkedList<T>();
  @override
  T? dequeue() => _list.pop();

  @override
  bool enqueue(T element) {
    _list.append(element);
    return true;
  }

  @override
  bool get isEmpty => _list.isEmpty;

  @override
  T? get peek => _list.head?.value;

  @override
  String toString() => _list.toString();
}

//! Ring Buffer Implementation
// A ring buffer, also known as a circular buffer, is a fixed-size list. This data structure
// strategically wraps around to the beginning when there are no more items to remove
// at the end

// There are a couple of points to pay attention to:
// • You must include a length parameter since the ring buffer has a fixed size.
// • isEmpty and peek are already implemented. Both of these are O(1) operations

// The ring-buffer-based queue has the same time complexity for enqueue and dequeue
// as the linked-list implementation. The space complexity for a ring-buffer-based
// queue, while still O(n), doesn’t require new memory allocation internally when
// enqueuing new elements like the linked-list implementation does. However, the ring
// buffer has a fixed size, which means that enqueue can fail.

class QueueRingBuffer<E> implements Queue<E> {
  QueueRingBuffer(int length) : _ringBuffer = RingBuffer<E>(length);

  final RingBuffer<E> _ringBuffer;

  // To append an element to the queue, you simply call write on the _ringBuffer. This
  // increments the write pointer by one.
  // Since the queue has a fixed size, you must now return true or false to indicate
  // whether the element has been successfully added. enqueue is still an O(1) operation.
  @override
  bool enqueue(E element) {
    if (_ringBuffer.isFull) {
      return false;
    }
    _ringBuffer.write(element);
    return true;
  }

  //To remove an item from the front of the queue, you simply call read on the
  // _ringBuffer. Behind the scenes, it checks if the ring buffer is empty and, if so,
  // returns null. If not, it returns the item at the read index of the buffer and then
  // increments the index by one.
  @override
  E? dequeue() => _ringBuffer.read();

  @override
  bool get isEmpty => _ringBuffer.isEmpty;

  @override
  E? get peek => _ringBuffer.peek;

  @override
  String toString() => _ringBuffer.toString();
}

//!Double-Stack Implementation
// The idea behind using two stacks is simple. Whenever you enqueue an element, it
// goes in the right stack. When you need to dequeue an element, you reverse the right stack, place it in the
// left stack, and remove the top element. This reversing operation is only required when the left stack is empty, making most
// enqueue and dequeue operations constant-time.

class QueueStack<E> implements Queue<E> {
  final _leftStack = <E>[];
  final _rightStack = <E>[];

  // Recall that the right stack is used to enqueue elements.
  // You simply push to the stack by appending to the list. From implementing the
  // QueueList previously, you know that appending an element is an O(1) operation.
  @override
  bool enqueue(E element) {
    _rightStack.add(element);
    return true;
  }

  // Removing an item in a two-stack-based implementation of a queue is tricky
  @override
  E? dequeue() {
    if (_leftStack.isEmpty) {
      // If the left stack is empty, set it as the reverse of the right stack:
      _leftStack.addAll(_rightStack.reversed);
      // Invalidate your right stack. Since you have transferred everything to the left, just
      // clear the right:
      _rightStack.clear();
    }
    if (_leftStack.isEmpty) return null;
    // Remove the last element from the left stack:
    return _leftStack.removeLast();
  }

  //To check if the queue is empty, simply check that both the left and right stacks are
  // empty. This means that there are no elements left to dequeue and no new elements
  // have been enqueued.
  @override
  bool get isEmpty => _leftStack.isEmpty && _rightStack.isEmpty;
  // You know that peeking looks at the top element. If the left stack is not empty, the
  // element on top of this stack is at the front of the queue. If the left stack is empty, the
  // right stack will be reversed and placed in the left stack. In this case, the element at
  // the bottom of the right stack is next in the queue.
  @override
  E? get peek => _leftStack.isNotEmpty ? _leftStack.last : _rightStack.first;

  @override
  String toString() {
    final combined = [
      ..._leftStack.reversed,
      ..._rightStack,
    ].join(', ');
    return '[$combined]';
  }
}

void main() {
  //! List-Based Implementation
  final queue = QueueList<String>();
  queue.enqueue('Gabriela');
  queue.enqueue('Rafaela');
  queue.enqueue('Monica');
  print(queue);
  queue.dequeue();
  print(queue);
  queue.peek;
  print(queue);
//! Doubly Linked List Implementation

  final queueLinked = QueueLinkedList<String>();
  queueLinked.enqueue('Antonio');
  queueLinked.enqueue('Bruna');
  queueLinked.enqueue('Bruno');
  print(queueLinked); // [Ray, Brian, Eric]
  queueLinked.dequeue();
  print(queueLinked); // [Brian, Eric]
  queueLinked.peek;
  print(queueLinked); // [Brian, Eric]
//! Ring Buffer Implementation

  final queueRing = QueueRingBuffer<String>(10);
  queueRing.enqueue("Mateus");
  queueRing.enqueue("Leandro");
  queueRing.enqueue("Paulo");
  print(queueRing); // [Ray, Brian, Eric]
  queueRing.dequeue();
  print(queueRing); // [Brian, Eric]
  queueRing.peek;
  print(queueRing); // [Brian, Eric]

//!Double-Stack Implementation
  final queueDouble = QueueStack<String>();
  queueDouble.enqueue("Victor");
  queueDouble.enqueue("Michel");
  queueDouble.enqueue("Joana");
  print(queueDouble); // [Ray, Brian, Eric]
  queueDouble.dequeue();
  print(queueDouble); // [Brian, Eric]
  queueDouble.peek;
  print(queueDouble); // [Brian, Eric]
}
