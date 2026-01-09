import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MyForm extends StatelessWidget {
  final String text;
  final String? hintText;
  final String? labelText;
  final TextInputType? keyboardType;
  final IconData? icon;
  final String? mask;
  final TextEditingController? controller;

  const MyForm({
    super.key,
    this.hintText,
    this.labelText,
    this.keyboardType = TextInputType.text,
    this.icon = FontAwesomeIcons.user,
    required this.text,
    this.mask,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final inputFormatters = mask != null
        ? [
            MaskTextInputFormatter(mask: mask, filter: {"#": RegExp(r'[0-9]')}),
          ]
        : <TextInputFormatter>[];

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(text, style: Theme.of(context).textTheme.titleMedium),
        ),
        TextFormField(
          controller: controller,
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
          inputFormatters: inputFormatters,
        ),
      ],
    );
  }
}
