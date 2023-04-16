import 'package:flutter/material.dart';
import 'package:simple_calculator_app/widgets/display.dart';
import 'package:simple_calculator_app/widgets/keypad.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String value = '';

  void setValue(val) {
    setState(() {
      value += val;
    });
  }

  void calculate() {
    final multiplicationRe = RegExp(r'[\d]+[.]?[\d]*[*][\d]+[.]?[\d]*');
    final divisionRe = RegExp(r'[\d]+[.]?[\d]*[/][\d]+[.]?[\d]*');
    final plusRe = RegExp(r'[\d]+[.]?[\d]*[+][\d]+[.]?[\d]*');
    final minusRe = RegExp(r'[\d]+[.]?[\d]*[-][\d]+[.]?[\d]*');
    final numberRe = RegExp(r'[\d]+[.]?[\d]*');

    while (multiplicationRe.stringMatch(value) != null) {
      final regexValue = multiplicationRe.stringMatch(value) ?? '';
      final numbers = numberRe.allMatches(regexValue);
      final num1 = double.parse(numbers.elementAt(0).group(0) ?? '0');
      final num2 = double.parse(numbers.elementAt(1).group(0) ?? '0');
      setState(() {
        value = value.replaceFirst(multiplicationRe, (num1 * num2).toString());
      });
    }

    while (divisionRe.stringMatch(value) != null) {
      final regexValue = divisionRe.stringMatch(value) ?? '';
      final numbers = numberRe.allMatches(regexValue);
      final num1 = double.parse(numbers.elementAt(0).group(0) ?? '0');
      final num2 = double.parse(numbers.elementAt(1).group(0) ?? '0');
      setState(() {
        value = value.replaceFirst(divisionRe, (num1 / num2).toString());
      });
    }

    while (plusRe.stringMatch(value) != null) {
      final regexValue = plusRe.stringMatch(value) ?? '';
      final numbers = numberRe.allMatches(regexValue);
      final num1 = double.parse(numbers.elementAt(0).group(0) ?? '0');
      final num2 = double.parse(numbers.elementAt(1).group(0) ?? '0');
      setState(() {
        value = value.replaceFirst(plusRe, (num1 + num2).toString());
      });
    }

    while (minusRe.stringMatch(value) != null) {
      final regexValue = minusRe.stringMatch(value) ?? '';
      final numbers = numberRe.allMatches(regexValue);
      final num1 = double.parse(numbers.elementAt(0).group(0) ?? '0');
      final num2 = double.parse(numbers.elementAt(1).group(0) ?? '0');
      setState(() {
        value = value.replaceFirst(minusRe, (num1 - num2).toString());
      });
    }
  }

  void clear() {
    setState(() {
      value = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DisplayWidget(
            value: value,
          ),
          Column(
            children: [
              KeyPadWidget(
                callback: (val) => setValue(val),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.all(12),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(128, 64)),
                      onPressed: () => clear(),
                      child: const Text('Clear'),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(12),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(128, 64)),
                      onPressed: () => calculate(),
                      child: const Text('Equal'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
