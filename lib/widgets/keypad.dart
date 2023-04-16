import 'package:flutter/material.dart';
import 'package:simple_calculator_app/widgets/button.dart';

class KeyPadWidget extends StatelessWidget {
  const KeyPadWidget({super.key, required this.callback});
  final Function(String) callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border.all(width: 1)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                children: [
                  ButtonWidget(
                    text: '1',
                    callback: (val) => callback(val),
                  ),
                  ButtonWidget(
                    text: '2',
                    callback: (val) => callback(val),
                  ),
                  ButtonWidget(
                    text: '3',
                    callback: (val) => callback(val),
                  ),
                  ButtonWidget(
                    text: '+',
                    callback: (val) => callback(val),
                  ),
                ],
              ),
              Row(
                children: [
                  ButtonWidget(
                    text: '4',
                    callback: (val) => callback(val),
                  ),
                  ButtonWidget(
                    text: '5',
                    callback: (val) => callback(val),
                  ),
                  ButtonWidget(
                    text: '6',
                    callback: (val) => callback(val),
                  ),
                  ButtonWidget(
                    text: '-',
                    callback: (val) => callback(val),
                  ),
                ],
              ),
              Row(
                children: [
                  ButtonWidget(
                    text: '7',
                    callback: (val) => callback(val),
                  ),
                  ButtonWidget(
                    text: '8',
                    callback: (val) => callback(val),
                  ),
                  ButtonWidget(
                    text: '9',
                    callback: (val) => callback(val),
                  ),
                  ButtonWidget(
                    text: '*',
                    callback: (val) => callback(val),
                  ),
                ],
              ),
              Row(
                children: [
                  ButtonWidget(
                    text: '',
                    callback: (val) => callback(val),
                    status: false,
                  ),
                  ButtonWidget(
                    text: '0',
                    callback: (val) => callback(val),
                  ),
                  ButtonWidget(
                    text: '.',
                    callback: (val) => callback(val),
                  ),
                  ButtonWidget(
                    text: '/',
                    callback: (val) => callback(val),
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
