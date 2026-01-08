import 'package:medication/models/gender_model.dart';

class ChildModel {
  final String name;
  final DateTime birthDate;
  final Gender gender;
  final String allergies;
  final double weight;

  ChildModel({
    required this.name,
    required this.birthDate,
    required this.gender,
    required this.allergies,
    required this.weight,
  });
}
