import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  final Map<String, int> categoryResults;

  static const Map<String, IconData> categoryIcons = {
    'Avistamientos': Icons.visibility,
    'Comercio': Icons.storefront,
    'Comportamiento': Icons.psychology,
    'Conocimientos': Icons.menu_book,
    'Conservacion': Icons.nature,
    'Contaminacion': Icons.smoke_free,
    'Cultural': Icons.diversity_3,
    'Deforestacion': Icons.forest,
    'Peligro': Icons.report_problem,
    'Remedios': Icons.healing,
  };

  const ResultsScreen({super.key, required this.categoryResults});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF1F8E9),
      appBar: AppBar(
        title: const Text('Resultados'),
        centerTitle: true,
        backgroundColor: const Color(0xFF2E7D32),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: categoryResults.length,
                separatorBuilder: (context, index) => const SizedBox(height: 8),
                itemBuilder: (context, index) {
                  final entry = categoryResults.entries.elementAt(index);
                  return Card(
                    elevation: 2,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: ListTile(
                        leading: Icon(
                          categoryIcons[entry.key] ?? Icons.category,
                          color: const Color(0xFF2E7D32),
                          size: 28,
                        ),
                        title: Text(
                          entry.key,
                          style: const TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                        ),
                        trailing: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.green[50],
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            entry.value.toString(),
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E7D32),
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 15,
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                // Navegar de vuelta al inicio limpiando toda la pila
                Navigator.popUntil(context, (route) => route.isFirst);
              },
              child: const Text(
                'Volver al Inicio',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
