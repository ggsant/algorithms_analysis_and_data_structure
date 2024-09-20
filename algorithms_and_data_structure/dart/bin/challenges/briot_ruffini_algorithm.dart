import 'dart:developer';

void main() {
  final roots1 = calculateRootByBriotRuffini(equationIndexes: [1, -3, 2], independentTerm: 0);
  final roots2 = calculateRootByBriotRuffini(equationIndexes: [1, -2, -1, 2], independentTerm: 2);

  log(roots1.toString()); // Saída esperada: [0, 1, 2]
  log(roots2.toString()); // Saída esperada: [1, 2, -1]
}

// Função para calcular as raízes de um polinômio usando o método de Briot-Ruffini
List<int> calculateRootByBriotRuffini({required List<int> equationIndexes, required int independentTerm}) {
  List<int> roots = [];
  List<int> divisorsOfIndependentTerm = [];

  // Se o termo independente é 0, uma das raízes é 0
  if (independentTerm == 0) {
    roots.add(0);
    // Calcula os divisores do último coeficiente
    divisorsOfIndependentTerm = calculateDivisors(equationIndexes.last);
  } else {
    // Calcula os divisores do termo independente fornecido
    divisorsOfIndependentTerm = calculateDivisors(independentTerm);
  }

  // Verifica cada divisor como possível raiz do polinômio
  for (var divisor in divisorsOfIndependentTerm) {
    int sum = 0;

    // Aplique o método de Briot-Ruffini para testar se o divisor é raiz
    for (var j = 0; j < equationIndexes.length - 1; j++) {
      // Se for o primeiro termo, inicializa a soma
      if (j == 0) {
        sum = (equationIndexes[j] * divisor) + equationIndexes[j + 1];
      } else {
        // Continua o cálculo de Briot-Ruffini
        sum = (sum * divisor) + equationIndexes[j + 1];
      }

      // Se a última soma for 0, significa que o divisor é uma raiz
      if (j == equationIndexes.length - 2 && sum == 0) {
        roots.add(divisor);
      }
    }
  }

  return roots;
}

// Função para calcular os divisores de um número (positivos e negativos)
List<int> calculateDivisors(int number) {
  List<int> divisors = [];

  // Calcula divisores apenas até a raiz quadrada do número para evitar duplicatas
  for (int i = 1; i <= number.abs(); i++) {
    if (number % i == 0) {
      divisors.add(i);
      divisors.add(-i);
    }
  }

  return divisors;
}
