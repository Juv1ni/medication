import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medication/models/child_model.dart';
import 'package:medication/models/gender_model.dart';

class DeleteChildDialog extends StatelessWidget {
  final ChildModel child;

  const DeleteChildDialog({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final isMale = child.gender == Gender.male;
    final primaryColor = isMale
        ? Theme.of(context).colorScheme.primary
        : Colors.pink.shade400;

    return Dialog(
      backgroundColor: isMale
          ? Colors.blue.shade100
          : const Color.fromARGB(255, 255, 204, 222),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CircleAvatar(
              radius: 32,
              backgroundColor: isMale
                  ? Colors.blue.shade200
                  : Colors.pink.shade200,
              child: FaIcon(
                FontAwesomeIcons.triangleExclamation,
                color: primaryColor,
                size: 28,
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Excluir criança?',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                style: TextStyle(color: primaryColor, fontSize: 18),
                children: [
                  const TextSpan(text: 'Tem certeza que deseja excluir '),
                  TextSpan(
                    text: child.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const TextSpan(text: '? Esta ação não poderá ser desfeita.'),
                ],
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context, false),
                    style: OutlinedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Cancelar'),
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => Navigator.pop(context, true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade400,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Excluir'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
