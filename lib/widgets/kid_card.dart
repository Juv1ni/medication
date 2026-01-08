import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medication/models/child_model.dart';
import 'package:medication/models/gender_model.dart';

class KidCard extends StatelessWidget {
  final ChildModel child;
  final bool selected;
  final VoidCallback? onSelect;
  final VoidCallback? onEdit;
  final VoidCallback? onDelete;

  const KidCard({
    super.key,
    required this.child,
    required this.selected,
    this.onSelect,
    this.onEdit,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final isMale = child.gender == Gender.male;
    final primaryColor = isMale
        ? Theme.of(context).colorScheme.primary
        : Colors.pink.shade400;

    return Card(
      elevation: selected ? 6 : 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(
          color: selected ? primaryColor : Colors.transparent,
          width: 2,
        ),
      ),
      color: isMale
          ? Theme.of(context).colorScheme.onTertiary
          : Colors.pink.shade100,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// ÍCONE
            FaIcon(
              isMale ? FontAwesomeIcons.child : FontAwesomeIcons.childDress,
              color: primaryColor,
              size: 40,
            ),

            const SizedBox(width: 12),

            /// TEXTO (ocupa o espaço disponível)
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    child.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 22,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Peso: ${child.weight} kg',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
            ),

            /// AÇÕES
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: onSelect,
                  icon: FaIcon(
                    FontAwesomeIcons.arrowRightToBracket,
                    color: primaryColor,
                    size: 24,
                  ),
                ),
                IconButton(
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: onEdit,
                  icon: FaIcon(
                    FontAwesomeIcons.solidPenToSquare,
                    size: 24,
                    color: primaryColor,
                  ),
                ),
                IconButton(
                  visualDensity: VisualDensity.compact,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: onDelete,
                  icon: FaIcon(
                    FontAwesomeIcons.trash,
                    size: 24,
                    color: Colors.red.shade400,
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
