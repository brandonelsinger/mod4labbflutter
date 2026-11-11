import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'question.dart';

const List<Question> questions = [
  Question(
    text: 'What is the best way to stop a zombie?',
    options: ['Aim for the legs', 'Aim for the head', 'Offer it a snack', 'Ask nicely'],
    correctIndex: 1,
  ),
  Question(
    text: 'Which item is most useful in a zombie apocalypse?',
    options: ['A first-aid kit', 'A lava lamp', 'A hair dryer', 'Fresh flowers'],
    correctIndex: 0,
  ),
  Question(
    text: 'What should you NEVER do in a horror movie?',
    options: ['Stay with the group', 'Lock the doors', 'Split up to investigate', 'Keep the lights on'],
    correctIndex: 2,
  ),
  Question(
    text: 'How much water should you store per person, per day?',
    options: ['One cup', 'One glass', 'One soda can', 'One gallon'],
    correctIndex: 3,
  ),
  Question(
    text: 'Where is the safest place to hide?',
    options: ['A glass shopping mall', 'A fortified rooftop', 'A crowded stadium', 'A haunted carnival'],
    correctIndex: 1,
  ),
];

class QuizTab extends StatefulWidget {
  const QuizTab({super.key});

  @override
  State<QuizTab> createState() => _QuizTabState();
}

class _QuizTabState extends State<QuizTab> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  void _goToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: Text(
            'Question ${_currentPage + 1} of ${questions.length}',
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        Expanded(
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(
              dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
            ),
            child: PageView.builder(
              controller: _pageController,
              itemCount: questions.length,
              onPageChanged: (index) {
                setState(() => _currentPage = index);
              },
              itemBuilder: (context, index) => _buildQuestionCard(questions[index]),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                onPressed: _currentPage > 0 ? () => _goToPage(_currentPage - 1) : null,
                child: const Text('Previous'),
              ),
              ElevatedButton(
                onPressed: _currentPage < questions.length - 1
                    ? () => _goToPage(_currentPage + 1)
                    : null,
                child: const Text('Next'),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildQuestionCard(Question question) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                question.text,
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 22),
              ),
              const SizedBox(height: 24),
              for (final option in question.options)
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text(option),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}