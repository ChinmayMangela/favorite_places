import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: TextStyle(
        color: Theme.of(context).colorScheme.onSurface,
      ),
      controller: controller,
      decoration: const InputDecoration(
        labelText:  'title',
      ),
    );
  }
}
