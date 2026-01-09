import 'package:medication/models/gender_model.dart';
import 'package:uuid/uuid.dart';

class ChildModel {
  final String id;
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
    String? id,
  }) : id = id ?? const Uuid().v4();

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'birthDate': birthDate.toIso8601String(),
      'weight': weight,
      'allergies': allergies,
      'gender': gender.name,
    };
  }

  factory ChildModel.fromMap(Map<String, dynamic> map) {
    return ChildModel(
      id: map['id'],
      name: map['name'],
      birthDate: DateTime.parse(map['birthDate']),
      weight: map['weight'],
      allergies: map['allergies'],
      gender: Gender.values.firstWhere((g) => g.name == map['gender']),
    );
  }
}
