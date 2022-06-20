// Imagine that you are playing a game of Monopoly with your friends. The problem is
// that everyone always forgets whose turn it is! Create a Monopoly organizer that
// always tells you whose turn it is. Below is an extension method that you can
// implement:

import '../../data_structure/queue.dart';

void main(List<String> args) {
  final queueRing = QueueRingBuffer<String>(3);
  queueRing.enqueue("Mateus");
  queueRing.enqueue("Leandro");
  queueRing.enqueue("Paulo");
  print(queueRing.nextPlayer());
  print(queueRing.nextPlayer());
  print(queueRing.nextPlayer());
  print(queueRing.nextPlayer());
}

extension BoardGameManager<E> on QueueRingBuffer {
  String? nextPlayer() {
    final nextPlayer = dequeue();
    if (nextPlayer != null) {
      enqueue(nextPlayer);
    }
    return nextPlayer;
  }
}
