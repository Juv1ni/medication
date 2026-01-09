import 'package:flutter/material.dart';
import 'package:medication/models/child_model.dart';
import 'package:medication/models/gender_model.dart';

class ChildController {
  final nameController = TextEditingController();
  final birthController = TextEditingController();
  final allergiesController = TextEditingController();
  final weightController = TextEditingController();
  Gender? selectedGender;

  DateTime parseDate(String date) {
    try {
      final parts = date.split('/');
      return DateTime(
        int.parse(parts[2]),
        int.parse(parts[1]),
        int.parse(parts[0]),
      );
    } catch (_) {
      return DateTime.now();
    }
  }

  bool isValid() {
    return nameController.text.isNotEmpty &&
        birthController.text.isNotEmpty &&
        weightController.text.isNotEmpty &&
        selectedGender != null;
  }

  ChildModel buildChild({String? id}) {
    return ChildModel(
      id: id,
      name: nameController.text,
      birthDate: parseDate(birthController.text),
      gender: selectedGender!,
      allergies: allergiesController.text,
      weight: double.parse(weightController.text.replaceAll(',', '.')),
    );
  }

  void fillFromChild(ChildModel child) {
    nameController.text = child.name;
    birthController.text = child.birthDate
        .toIso8601String()
        .split('T')
        .first
        .split('-')
        .reversed
        .join('/');
    allergiesController.text = child.allergies;
    weightController.text = child.weight.toString();
    selectedGender = child.gender;
  }

  void dispose() {
    nameController.dispose();
    birthController.dispose();
    allergiesController.dispose();
    weightController.dispose();
  }
}
