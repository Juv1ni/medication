import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyForm extends StatelessWidget {
  final String text;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final IconData? icon;

  const MyForm({
    super.key,
    this.hintText,
    this.labelText,
    this.keyboardType = TextInputType.text,
    this.icon = FontAwesomeIcons.user,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(text, style: Theme.of(context).textTheme.titleMedium),
        ),
        TextFormField(
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.only(top: 12, left: 5),
              child: FaIcon(icon),
            ),
            hintText: hintText,
            labelText: labelText,
            enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(
                  context,
                ).colorScheme.tertiary.withValues(alpha: 0.5),
              ),
            ),
            focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          keyboardType: keyboardType,
        ),
      ],
    );
  }
}
