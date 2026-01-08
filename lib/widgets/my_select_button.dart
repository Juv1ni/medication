import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MySelectButton extends StatelessWidget {
  final IconData? icon;
  final String text;
  final VoidCallback? onPressed;
  final bool selected;

  const MySelectButton({
    super.key,
    this.icon,
    required this.text,
    this.onPressed,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: selected
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).colorScheme.tertiary,
        padding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        elevation: selected ? 2 : 0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(height: 4),
          FaIcon(icon, size: 16, color: Theme.of(context).colorScheme.surface),
          Text(
            text,
            style: Theme.of(context).textTheme.labelMedium,
            textAlign: TextAlign.center,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
