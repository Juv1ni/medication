import 'package:flutter/material.dart';
import 'package:medication/models/child_model.dart';
import 'package:medication/models/gender_model.dart';

class AddChildController {
  final nameController = TextEditingController();
  final birthController = TextEditingController();
  final allergiesController = TextEditingController();
  final weightController = TextEditingController();
  Gender? selectedGender;

  DateTime parseDate(String date) {
    final parts = date.split('/');
    return DateTime(
      int.parse(parts[2]),
      int.parse(parts[1]),
      int.parse(parts[0]),
    );
  }

  bool isValid() {
    return nameController.text.isNotEmpty &&
        birthController.text.isNotEmpty &&
        weightController.text.isNotEmpty &&
        selectedGender != null;
  }

  ChildModel buildChild() {
    return ChildModel(
      name: nameController.text,
      birthDate: parseDate(birthController.text),
      gender: selectedGender!,
      allergies: allergiesController.text,
      weight: double.parse(weightController.text),
    );
  }

  void dispose() {
    nameController.dispose();
    birthController.dispose();
    allergiesController.dispose();
    weightController.dispose();
  }
}
