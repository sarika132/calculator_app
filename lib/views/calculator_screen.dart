import 'package:calculator_app/models/calculator_model.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  final CalculatorModel calculator = CalculatorModel();

  static const List<String> _buttons = [
    'C',
    'AC',
    '/',
    '<-',
    '1',
    '2',
    '3',
    '+',
    '4',
    '5',
    '6',
    '-',
    '7',
    '8',
    '9',
    '*',
    '%',
    '0',
    '.',
    '=',
  ];

  void _onButtonPressed(String label) {
    setState(() {
      // AC should work same as C (clear everything)
      if (label == 'AC') {
        calculator.buttonClick('C');
      } else {
        calculator.buttonClick(label);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator App'),
        centerTitle: true,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        leading: const BackButton(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            // Display Screen
            Container(
              width: double.infinity,
              height: 80,
              padding: const EdgeInsets.all(12),
              alignment: Alignment.centerRight,
              decoration: BoxDecoration(
                color: const Color(0xFFFAFAFA),
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(4),
              ),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                reverse: true,
                child: Text(
                  calculator.display,
                  style: const TextStyle(fontSize: 28, color: Colors.black),
                ),
              ),
            ),

            const SizedBox(height: 12),

            // Buttons Grid
            Expanded(
              child: GridView.count(
                crossAxisCount: 4,
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                childAspectRatio: 0.8,
                children: [
                  for (final label in _buttons)
                    ElevatedButton(
                      onPressed: () => _onButtonPressed(label),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFEDEDED),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                      child: Text(label, style: const TextStyle(fontSize: 28)),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
