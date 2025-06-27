import 'package:aplicacion_biologia/screens/results_screen.dart';
import 'package:flutter/material.dart';
import '../domain/models.dart';
import '../domain/list_questions.dart';

class CommentsScreen extends StatefulWidget {
  final List<SurveyCategory> categories;

  const CommentsScreen({super.key, required this.categories});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  final TextEditingController _commentsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8E9),
      appBar: AppBar(
        title: const Text('Comentarios', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF2E7D32),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    const Text(
                      'Comentarios Adicionales',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2E7D32),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Nos gustaría saber tu opinión respecto al tema',
                      style: TextStyle(fontSize: 16, color: Color(0xFF212121)),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: _commentsController,
                  maxLines: 8,
                  decoration: InputDecoration(
                    hintText: 'Escribe tus comentarios aquí...',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 10),
                  ),
                  style: const TextStyle(color: Color(0xFF212121)),
                ),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFFFC107),
                foregroundColor: const Color(0xFF212121),
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                elevation: 5,
              ),
              onPressed: () {
                // Calcular resultados y navegar directamente a ResultsScreen
                final Map<String, int> categoryTotals = {
                  for (var cat in widget.categories)
                    cat.name: cat.questions
                        .where((q) => q.selectedValue != null)
                        .fold<int>(0, (sum, q) => sum + (q.selectedValue ?? 0)),
                };

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        ResultsScreen(categoryResults: categoryTotals),
                  ),
                );
              },
              child: const Text(
                'Ver Resultados',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
