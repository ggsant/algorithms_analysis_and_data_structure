import '../stack.dart';

/// Check for balanced parentheses. Given a string, check if there are `(`
/// and `)` characters, and return `true` if the parentheses in the string
/// are balanced. For example:

void main() {
  print(checkParentheses('10 + 20 + 30 + (10 + 20)'));
  print(checkParentheses('10 + 20 + 30 + (10 + 20'));
  print(checkParentheses('10 + 20 + 30 + 10 + 20)'));
}

bool checkParentheses(String text) {
  var stack = Stack<int>();

  final open = '('.codeUnitAt(0);
  final close = ')'.codeUnitAt(0);

  for (int codeUnit in text.codeUnits) {
    if (codeUnit == open) {
      stack.push(codeUnit);
    } else if (codeUnit == close) {
      if (stack.isEmpty) {
        return false;
      } else {
        stack.pop();
      }
    }
  }
  return stack.isEmpty;
}
