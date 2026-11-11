import 'package:flutter/material.dart';
import 'bmi_tab.dart';
import 'morse_tab.dart';
import 'alcohol_tab.dart';
import 'quiz_tab.dart';

void main() {
  runApp(const HelloWorldApp());
}

class HelloWorldApp extends StatelessWidget {
  const HelloWorldApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello World',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override 
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<String> _titles = [
    'BMI Calculator',
    'Morse Code Translator',
    'When Can I Buy Alcohol',
    'Quiz',
  ];

  static const List<Widget> _pages = [
    BmiTab(),
    MorseTab(),
    AlcoholTab(),
    QuizTab(),
  ];

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titles[_selectedIndex])),
      body: IndexedStack(index: _selectedIndex, children: _pages),
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedIndex,
        onDestinationSelected: (index) {
          setState(() => _selectedIndex = index);
        },
        destinations: const [
          NavigationDestination(icon: Icon(Icons.monitor_weight), label: 'BMI'),
          NavigationDestination(icon: Icon(Icons.more_horiz), label: 'Morse'),
          NavigationDestination(icon: Icon(Icons.local_bar), label: 'Alcohol'),
          NavigationDestination(icon: Icon(Icons.quiz), label: 'Quiz'),
        ],
      ),
    );
  }
}