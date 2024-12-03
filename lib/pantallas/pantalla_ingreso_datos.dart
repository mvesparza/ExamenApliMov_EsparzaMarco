import 'package:flutter/material.dart';
import 'pantalla_resultados.dart'; // Importa la pantalla de resultados, donde se mostrará el triángulo.

class PantallaIngresoDatos extends StatefulWidget {
  const PantallaIngresoDatos({Key? key}) : super(key: key);

  @override
  State<PantallaIngresoDatos> createState() => _PantallaIngresoDatosState();
}

class _PantallaIngresoDatosState extends State<PantallaIngresoDatos> {
  // Controlador para el campo de texto de ingreso de datos.
  final TextEditingController _controladorNumero = TextEditingController();
  // Clave global para el formulario para validar los campos.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // Variable para controlar el estado del hover sobre el botón.
  bool _isButtonHovered = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ingreso de Datos'), // Título de la barra superior.
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            // Lógica para regresar a la pantalla anterior.
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        // Fondo con un gradiente de colores.
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A82FB), Color(0xFFFC5C7D)], // Gradiente de azul a rosa.
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0), // Espaciado alrededor del formulario.
            child: SingleChildScrollView(
              child: Form(
                key: _formKey, // Asocia el formulario con la clave global.
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // Centra el contenido en la pantalla.
                  children: [
                    const Text(
                      'Ingrese un número',
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white, // Color del texto en blanco.
                      ),
                    ),
                    const SizedBox(height: 20), // Espaciado entre el título y el campo de texto.
                    TextFormField(
                      controller: _controladorNumero, // Asocia el controlador al campo de texto.
                      keyboardType: TextInputType.number, // Solo permite números.
                      decoration: InputDecoration(
                        labelText: 'Número entero',
                        labelStyle: const TextStyle(color: Colors.white70),
                        hintText: 'Ejemplo: 5', // Sugerencia de formato.
                        filled: true,
                        fillColor: Colors.white24, // Color de fondo del campo de texto.
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10), // Bordes redondeados.
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white54),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(color: Colors.white),
                        ),
                      ),
                      style: const TextStyle(color: Colors.white), // Estilo del texto ingresado.
                      validator: (value) {
                        // Valida que el valor ingresado sea un número entero válido.
                        if (value == null || value.isEmpty) {
                          return 'Este campo no puede estar vacío.';
                        }
                        final numero = int.tryParse(value);
                        if (numero == null) {
                          return 'Ingrese un número válido.';
                        }
                        if (numero < 0) {
                          return 'El número no puede ser negativo.';
                        }
                        if (numero < 2 || numero > 20) {
                          return 'El número debe estar en el rango de 2 a 20.';
                        }
                        return null; // Si todo es válido, retorna null.
                      },
                    ),
                    const SizedBox(height: 30), // Espaciado entre el campo de texto y el botón.
                    InkWell(
                      // Detecta el hover sobre el botón.
                      onHover: (hovering) {
                        setState(() {
                          _isButtonHovered = hovering; // Actualiza el estado al pasar el ratón.
                        });
                      },
                      onTap: () {
                        // Acción cuando el botón es presionado.
                        if (_formKey.currentState!.validate()) {
                          // Si el formulario es válido, navega a la pantalla de resultados.
                          final numero = int.parse(_controladorNumero.text);
                          Navigator.push(
                            context,
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                  PantallaResultados(altura: numero),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                // Define la animación de deslizamiento para la transición.
                                const begin = Offset(0.0, 1.0);
                                const end = Offset.zero;
                                const curve = Curves.easeInOut;

                                final tween = Tween(begin: begin, end: end)
                                    .chain(CurveTween(curve: curve));
                                final offsetAnimation = animation.drive(tween);

                                return SlideTransition(
                                  position: offsetAnimation, // Aplica la animación de deslizamiento.
                                  child: child,
                                );
                              },
                            ),
                          );
                        }
                      },
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 300), // Duración de la animación de cambio de color.
                        padding: const EdgeInsets.symmetric(
                          vertical: 15,
                          horizontal: 30,
                        ),
                        decoration: BoxDecoration(
                          // Cambia el color del botón al pasar el ratón.
                          color: _isButtonHovered
                              ? Colors.white
                              : Colors.white.withOpacity(0.8),
                          borderRadius: BorderRadius.circular(30), // Bordes redondeados.
                          boxShadow: [
                            // Sombra alrededor del botón.
                            BoxShadow(
                              color: Colors.black26,
                              blurRadius: 10,
                              offset: Offset(4, 4),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min, // El tamaño del Row solo ocupará lo necesario.
                          children: const [
                            Text(
                              'Mostrar Triángulo', // Texto del botón.
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF6A82FB), // Color azul para el texto.
                              ),
                            ),
                            SizedBox(width: 10), // Espacio entre el texto y el ícono.
                            Icon(
                              Icons.arrow_forward, // Ícono de flecha hacia adelante.
                              color: Color(0xFF6A82FB),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
