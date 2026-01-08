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

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'birthDate': birthDate.toIso8601String(),
      'weight': weight,
      'allergies': allergies,
      'gender': gender.name,
    };
  }

  factory ChildModel.fromMap(Map<String, dynamic> map) {
    return ChildModel(
      name: map['name'],
      birthDate: DateTime.parse(map['birthDate']),
      weight: map['weight'],
      allergies: map['allergies'],
      gender: Gender.values.firstWhere((g) => g.name == map['gender']),
    );
  }
}
