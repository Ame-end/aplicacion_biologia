import 'package:flutter/material.dart';

class ResultsScreen extends StatelessWidget {
  final Map<String, int> categoryResults;

  static const Map<String, IconData> categoryIcons = {
    'Avistamientos': Icons.remove_red_eye,
    'Comercio': Icons.shopping_cart,
    'Comportamiento': Icons.psychology,
    'Conocimientos': Icons.school,
    'Conservacion': Icons.eco,
    'Contaminacion': Icons.water_drop,
    'Cultural': Icons.architecture,
    'Deforestacion': Icons.park,
    'Peligro': Icons.warning,
    'Remedios': Icons.medical_services,
  };

  const ResultsScreen({super.key, required this.categoryResults});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Resultados'), centerTitle: true),
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
                          color: Theme.of(context).primaryColor,
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
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Funcionalidad de PDF deshabilitada.'),
                    ),
                  );
                },
                icon: const Icon(Icons.picture_as_pdf),
                label: const Text('Generar PDF'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
