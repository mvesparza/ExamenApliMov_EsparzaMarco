class LogicaTriangulo {
  // Método para generar un triángulo como una lista de cadenas
  List<String> generarTriangulo(int altura) {
    // Se crea una lista vacía que almacenará las filas del triángulo
    List<String> triangulo = [];

    // Bucle para generar cada fila del triángulo
    for (int i = 1; i <= altura; i++) {
      // Se agrega una nueva fila al triángulo con la cantidad adecuada de asteriscos
      // '*' * i genera una cadena con 'i' asteriscos
      triangulo.add('*' * i);
    }

    // Se retorna la lista con todas las filas del triángulo
    return triangulo;
  }
}
