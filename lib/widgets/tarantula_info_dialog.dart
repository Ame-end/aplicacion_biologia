import 'package:flutter/material.dart';

class TarantulaInfoDialog extends StatelessWidget {
  const TarantulaInfoDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFF1F8E9),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Tliltocatl schroederi',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2E7D32),
              ),
            ),
            const SizedBox(height: 15),
            const Text(
              'Trabecir activado el 4 cm, hablando de fuentes maduros las maneras entre 24-25 cm y los farrones 48 cm. Es como pasar a la mía bajo la cama en nuestro centro o negro, ya pues no nos conectamos de expresar altura. Pueden mirar nuevos, pero más precisos lo que es más más grande y de desarrollo siglos.',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, color: Color(0xFF212121)),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF2E7D32),
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Cerrar'),
            ),
          ],
        ),
      ),
    );
  }
}
