import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    this.text = '',
    this.status = true,
    required this.callback,
  });
  final String text;
  final bool status;
  final Function(String) callback;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(fixedSize: const Size(64, 64)),
        onPressed: status ? () => callback(text) : null,
        child: Text(text),
      ),
    );
  }
}
