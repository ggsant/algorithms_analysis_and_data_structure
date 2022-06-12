import 'dart:collection';

import '../data_structure/stack.dart';

void main() {
  final calculator = CalculatorImpl(expression: '10 + 20 + (100 - 20)-30');
  print('Result: ${calculator.calculate()}');
}

abstract class Calculator {
  final String simpleMathExpression;

  Calculator({required this.simpleMathExpression});

  String calculate();

  String get expression => simpleMathExpression;

  EvaluateStringImpl get evaluateStringIntance => EvaluateStringImpl(expression);

  bool isValidExpression() => expression.contains(RegExp(r'^[\d\(\)\-+ ]+$')) && evaluateStringIntance.isBracketsBalenced(expression);
}

class CalculatorImpl extends Calculator {
  CalculatorImpl({required String expression}) : super(simpleMathExpression: expression);

  @override
  String calculate() {
    if (isValidExpression()) {
      final postfixExpression = evaluateStringIntance.infixToPostfix(expression);
      var expressionTree = ExpressionHelpers.buildExpressionTree(postfixExpression);
      var result = expressionTree.interpret();
      return result.toString();
    } else {
      return 'You have entered an invalid expression. Enter only integers and addition and subtraction operations.';
    }
  }
}

abstract class EvaluateString {
  final String expression;

  EvaluateString(this.expression);

  int precedence(String operator);
  String infixToPostfix(String expression);
  bool isBracketsBalenced(String expression);
}

class EvaluateStringImpl extends EvaluateString {
  EvaluateStringImpl(String expression) : super(expression);

  @override
  bool isBracketsBalenced(String expression) {
    var stack = Queue<String>();

    for (var i = 0; i < expression.length; i++) {
      var caractere = expression[i];
      if (caractere == '(') {
        stack.addFirst(caractere);
      } else if (caractere == ')') {
        if (stack.isEmpty) {
          return false;
        }
        stack.removeFirst();
      }
    }
    if (stack.isNotEmpty) {
      return false;
    }

    return true;
  }

  @override
  int precedence(String operator) {
    switch (operator) {
      case '+':
      case '-':
        return 1;
      default:
        return -1;
    }
  }

  @override
  String infixToPostfix(String expression) {
    String result = "";
    Stack<String> stack = Stack<String>();
    stack.setSizeMax(expression.length);
    for (int i = 0; i < expression.length; i++) {
      final caractere = expression[i];

      if (precedence(caractere) > 0) {
        while (!stack.isEmpty && precedence(stack.peek()) >= precedence(caractere)) {
          result += stack.pop();
        }
        stack.push(caractere);
      } else if (caractere == ')') {
        var x = stack.pop();
        while (x != '(') {
          result += x;
          x = stack.pop();
        }
      } else if (caractere == '(') {
        stack.push(caractere);
      } else {
        result += caractere;
      }
    }
    for (int i = 0; i <= stack.length; i++) {
      result += stack.pop();
    }
    return result;
  }
}

// An interface that defines the interpret()
// method to be implemented by the terminal and nonterminal expression classes.
abstract class ExpressionInterpreter {
  int interpret();
}

// A helper class is used by the Client to build the
// expression tree from the provided postfix expression input.
class ExpressionHelpers {
  const ExpressionHelpers._();

  static final List<String> _operators = ['+', '-'];

  static List<String> convertPostfixExpressionToList(String postfixExpression) {
    final convertedPostFix = postfixExpression //
        .replaceAll('+', ' + ')
        .replaceAll('-', ' - ')
        .replaceAll('  ', ' ')
        .replaceAll(' ', '|')
        .split('|');

    convertedPostFix.removeLast();

    return convertedPostFix;
  }

  static ExpressionInterpreter buildExpressionTree(String postfixExpression) {
    final expressionStack = ListQueue<ExpressionInterpreter>();
    final convertedPostFix = convertPostfixExpressionToList(postfixExpression);

    for (final caractere in convertedPostFix) {
      if (_isOperator(caractere)) {
        final rightExpression = expressionStack.removeLast();
        final leftExpression = expressionStack.removeLast();
        final nonterminalExpression = _getNonterminalExpression(caractere, leftExpression, rightExpression);
        expressionStack.addLast(nonterminalExpression);
      } else {
        final numberExpression = NumberInt(int.parse(caractere));
        expressionStack.addLast(numberExpression);
      }
    }

    return expressionStack.single;
  }

  static bool _isOperator(String symbol) => _operators.contains(symbol);

  static ExpressionInterpreter _getNonterminalExpression(
    String operator,
    ExpressionInterpreter value1,
    ExpressionInterpreter value2,
  ) {
    ExpressionInterpreter expression;

    switch (operator) {
      case '+':
        expression = Sum(value1, value2);
        break;
      case '-':
        expression = Subtract(value1, value2);
        break;
      default:
        throw Exception('Expression is not defined.');
    }

    return expression;
  }
}

class NumberInt implements ExpressionInterpreter {
  final int number;

  const NumberInt(this.number);

  @override
  int interpret() => number;
}

class Sum implements ExpressionInterpreter {
  final ExpressionInterpreter value1;
  final ExpressionInterpreter value2;

  const Sum(this.value1, this.value2);

  @override
  int interpret() {
    final a = value1.interpret();
    final b = value2.interpret();
    return a + b;
  }
}

class Subtract implements ExpressionInterpreter {
  final ExpressionInterpreter value1;
  final ExpressionInterpreter value2;

  const Subtract(this.value1, this.value2);

  @override
  int interpret() {
    final a = value1.interpret();
    final b = value2.interpret();
    return a - b;
  }
}
