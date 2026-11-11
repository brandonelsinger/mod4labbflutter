import 'package:flutter/material.dart';

class QuizTab extends StatefulWidget {
  const QuizTab({super.key});

  @override
  State<QuizTab> createState() => _QuizTabState();
}

class _QuizTabState extends State<QuizTab> {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text('Quiz coming soon'),
    );
  }
}