import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({super.key, required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: const Text("Generate"),
    );
  }
}
