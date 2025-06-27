import 'package:aplicacion_biologia/screens/results_screen.dart';
import 'package:flutter/material.dart';
import '../widgets/question_card.dart';
import '../domain/list_questions.dart';
import '../screens/comments_screen.dart';
import '../domain/models.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen({super.key});

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  late List<SurveyCategory> categories;
  int currentCategoryIndex = 0;
  int currentQuestionIndex = 0;
  int totalQuestions = 0;
  int currentGlobalQuestionIndex = 1; // Contador global de preguntas (1-34)

  @override
  void initState() {
    super.initState();
    categories = ListQuestions.getSurveyCategories();
    // Calcular el total de preguntas
    totalQuestions = categories.fold(
      0,
      (sum, category) => sum + category.questions.length,
    );
  }

  Question get currentQuestion {
    return categories[currentCategoryIndex].questions[currentQuestionIndex];
  }

  void _saveAnswer(int value) {
    setState(() {
      categories[currentCategoryIndex]
              .questions[currentQuestionIndex]
              .selectedValue =
          value;
    });
  }

  void _nextQuestion() {
    setState(() {
      if (currentQuestionIndex <
          categories[currentCategoryIndex].questions.length - 1) {
        currentQuestionIndex++;
        currentGlobalQuestionIndex++;
      } else if (currentCategoryIndex < categories.length - 1) {
        currentCategoryIndex++;
        currentQuestionIndex = 0;
        currentGlobalQuestionIndex++;
      } else {
        // Navegar a pantalla de comentarios
        _navigateToComments();
      }
    });
  }

  void _previousQuestion() {
    setState(() {
      if (currentQuestionIndex > 0) {
        currentQuestionIndex--;
        currentGlobalQuestionIndex--;
      } else if (currentCategoryIndex > 0) {
        currentCategoryIndex--;
        currentQuestionIndex =
            categories[currentCategoryIndex].questions.length - 1;
        currentGlobalQuestionIndex--;
      }
    });
  }

  void _navigateToComments() {
    // Navegar directamente a CommentsScreen pasando las categorías
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CommentsScreen(categories: categories),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = currentQuestion;
    final category = categories[currentCategoryIndex];

    return Scaffold(
      backgroundColor: const Color(0xFFF1F8E9),
      appBar: AppBar(
        title: Text('Teero App', style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF2E7D32),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(
              'Pregunta $currentGlobalQuestionIndex de $totalQuestions',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2E7D32),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: QuestionCard(
                question: question.text,
                category: question.category,
                imagePath: category.imagePath,
                currentValue: question.selectedValue,
                onChanged: _saveAnswer,
                questionNumber: currentGlobalQuestionIndex,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF8BC34A),
                    foregroundColor: Colors.white,
                  ),
                  onPressed: _previousQuestion,
                  child: const Text('Anterior'),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: question.selectedValue == null
                        ? Colors.grey
                        : const Color(0xFFFFC107),
                    foregroundColor: const Color(0xFF212121),
                  ),
                  onPressed: question.selectedValue == null
                      ? null
                      : () {
                          if (currentGlobalQuestionIndex == totalQuestions) {
                            _navigateToComments();
                          } else {
                            _nextQuestion();
                          }
                        },
                  child: Text(
                    currentGlobalQuestionIndex == totalQuestions
                        ? 'Finalizar'
                        : 'Siguiente',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
