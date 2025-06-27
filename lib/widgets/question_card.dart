import 'package:flutter/material.dart';

class QuestionCard extends StatelessWidget {
  final String question;
  final String category;
  final String? imagePath;
  final int? currentValue;
  final ValueChanged<int> onChanged;
  final Function(String category, int value)? onOptionSelected;
  final int questionNumber; // Nuevo parámetro para el número de pregunta

  const QuestionCard({
    super.key,
    required this.question,
    required this.category,
    this.imagePath,
    required this.currentValue,
    required this.onChanged,
    this.onOptionSelected,
    required this.questionNumber, // Añadido
  });

  // Método para obtener las opciones basadas en el número de pregunta
  Map<int, String> _getOptionsForQuestion() {
    switch (questionNumber) {
      case 1:
        return {1: 'mucho', 2: 'poco', 3: 'nada'};
      case 2:
        return {1: 'mucho', 2: 'poco', 3: 'nada'};
      case 3:
        return {1: 'mucho', 2: 'poco', 3: 'nada'};
      case 4:
        return {1: 'mucho', 2: 'poco', 3: 'nada'};
      case 5:
        return {1: 'mucho', 2: 'poco', 3: 'nada'};
      case 6:
        return {1: 'Mucho', 2: 'Poco', 3: 'Nada'};
      case 7: // ¿Has visto a la tarántula de terciopelo negro?
        return {1: 'No', 2: 'No estoy seguro', 3: 'Sí'};
      case 8: // ¿Dónde la has visto?
        return {
          1: 'Dentro o cerca de mi casa',
          2: 'Cultivos (maíz, agave, otro)',
          3: 'En el bosque (monte, cerro)',
        };
      case 9: // ¿Dónde la has visto?
        return {1: 'nunca', 2: 'una vez al año', 3: 'mas de una vez al año'};
      case 10: // ¿Qué haces cuando te la encuentras?
        return {
          1: 'La mato',
          2: 'No hago nada',
          3: 'La dejo donde la encontré o la llevo al cerro',
        };
      case 11: // ¿Te afecta encontrarla en tus cultivos?
        return {
          1: 'sí, ya no trabajo y me voy a casa',
          2: 'trabajo, pero no con normalidad',
          3: 'no me afecta en nada',
        };
      case 12: // ¿Qué haces (tú o tu familia) si la encuentras en tu casa?
        return {
          1: 'la mato',
          2: 'no hago nada',
          3: 'la dejo donde la encontré o la llevo al cerro',
        };
      case 13: // ¿Conoces algún nombre en tu lengua materna para esta araña?
        return {1: 'no', 2: 'no estoy seguro', 3: 'sí, ¿cuál?'};
      case 14: // ¿Te dan miedo las tarántulas?
        return {1: 'mucho', 2: 'más o menos', 3: 'nada'};
      case 15: // ¿Crees que son venenosas para humanos?
        return {1: 'sí', 2: 'no estoy seguro', 3: 'no'};
      case 16: // ¿Crees que son venenosas para mascotas o ganado?
        return {1: 'sí', 2: 'no estoy seguro', 3: 'no'};
      case 17: // ¿Te ha picado, mordido o lastimado una tarántula?
        return {1: 'sí', 2: 'no estoy seguro', 3: 'no'};
      case 18: // ¿Qué has hecho cuando te ha mordido o picado?
        return {
          1: 'tomo algún remedio casero',
          2: 'nada, me recupero solo',
          3: 'voy al médico',
        };
      case 19: // ¿Sabes si las tarántulas tienen uso medicinal en la comunidad?
        return {1: 'no', 2: 'no estoy seguro', 3: 'sí, ¿cuál?'};
      case 20: // ¿Sabes si hay alguna representación cultural de la tarántula?
        return {1: 'no', 2: 'no estoy seguro', 3: 'sí, ¿cuál?'};
      case 21: // ¿Conoces proyectos de cuidado y preservación de la tarántula?
        return {1: 'no', 2: 'más o menos', 3: 'sí'};
      case 22: // ¿Conservar tarántulas puede generar ingresos económicos?
        return {1: 'no', 2: 'no estoy seguro', 3: 'sí'};
      case 23: // ¿Participarías en un proyecto de conservación sin pago?
        return {1: 'no', 2: 'tal vez', 3: 'sí'};
      case 24: // ¿Participarías en un proyecto de conservación con pago?
        return {1: 'no', 2: 'tal vez', 3: 'sí'};
      case 25: // ¿Un proyecto de conservación ayudaría a la comunidad?
        return {1: 'no', 2: 'tal vez', 3: 'sí, especificar'};
      case 26: // ¿Sabías que se pueden comprar tarántulas legalmente?
        return {1: 'no', 2: 'tal vez', 3: 'sí'};
      case 27: // ¿Sabías que hay personas que tienen tarántulas como mascotas?
        return {1: 'no', 2: 'tal vez', 3: 'sí'};
      case 28: // ¿Has visto tarántulas en tiendas de mascotas?
        return {1: 'no', 2: 'no estoy seguro', 3: 'sí'};
      case 29: // ¿Dónde se ubica la tienda donde la has visto?
        return {
          1: 'en la ciudad',
          2: 'en la comunidad',
          3: 'en internet u otro lugar',
        };
      case 30: // ¿Conoces a alguien que venda tarántulas en la comunidad?
        return {1: 'no', 2: 'no estoy seguro', 3: 'sí'};
      case 31: // ¿Alguien de tu comunidad extrae tarántulas para venderlas?
        return {1: 'no', 2: 'no estoy seguro', 3: 'sí'};
      case 32: // ¿Algún extranjero extrae tarántulas para venderlas?
        return {1: 'no', 2: 'no estoy seguro', 3: 'sí'};
      case 33: // ¿Apoyarías un reglamento comunitario para su conservación?
        return {1: 'no', 2: 'tal vez', 3: 'sí'};
      case 34: // ¿Te interesa conocer más sobre la tarántula?
        return {1: 'no', 2: 'tal vez', 3: 'sí'};

      default:
        return {1: 'Opción 1', 2: 'Opción 2', 3: 'Opción 3'};
    }
  }

  @override
  Widget build(BuildContext context) {
    final options = _getOptionsForQuestion();

    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (imagePath != null && imagePath!.isNotEmpty)
              Column(
                children: [
                  const SizedBox(height: 20),
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: SizedBox(
                        height: 220,
                        width: 220,
                        child: Image.asset(imagePath!, fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            Text(
              'Categoria $category', // Muestra la categoría
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Color(0xFF8BC34A),
                fontSize: 16,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              question,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2E7D32),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: options.entries
                  .map((entry) => _buildOption(entry.key, entry.value))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildOption(int value, String label) {
    final bool isSelected = currentValue == value;

    return Column(
      children: [
        GestureDetector(
          onTap: () {
            onChanged(value);
            if (onOptionSelected != null) {
              onOptionSelected!(category, value);
            }
          },
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: isSelected ? const Color(0xFF2E7D32) : Colors.transparent,
              border: Border.all(color: const Color(0xFF2E7D32), width: 2),
            ),
            child: Icon(
              Icons.circle,
              color: isSelected ? Colors.white : Colors.transparent,
              size: 20,
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          label,
          style: const TextStyle(color: Color(0xFF212121)),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
