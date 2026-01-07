import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyButton extends StatelessWidget {
  final IconData? icon;
  final String text;
  final VoidCallback? onPressed;

  const MyButton({super.key, this.icon, required this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(icon, size: 16, color: Theme.of(context).colorScheme.surface),
          SizedBox(width: 8),
          Text(text, style: Theme.of(context).textTheme.labelLarge),
        ],
      ),
    );
  }
}
