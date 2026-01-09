import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medication/models/sympton_model.dart';

class SymptomCard extends StatelessWidget {
  final SymptomModel symptom;
  final Color primaryColor;
  final bool isSelected;
  final VoidCallback onTap;

  const SymptomCard({
    super.key,
    required this.symptom,
    required this.primaryColor,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: isSelected
              ? primaryColor.withValues(alpha: 0.15)
              : Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: isSelected ? primaryColor : Colors.grey.shade300,
            width: 2,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FaIcon(
              symptom.icon,
              size: 28,
              color: isSelected ? primaryColor : Colors.grey,
            ),
            const SizedBox(height: 8),
            Text(
              symptom.label,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: isSelected ? primaryColor : Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
