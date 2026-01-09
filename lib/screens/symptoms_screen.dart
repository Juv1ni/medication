import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medication/models/child_model.dart';
import 'package:medication/models/gender_model.dart';
import 'package:medication/models/sympton_model.dart';
import 'package:medication/widgets/my_button.dart';
import 'package:medication/widgets/symptom_card.dart';

class SymptomsScreen extends StatefulWidget {
  final ChildModel child;

  const SymptomsScreen({super.key, required this.child});

  @override
  State<SymptomsScreen> createState() => _SymptomsScreenState();
}

class _SymptomsScreenState extends State<SymptomsScreen> {
  final Set<String> selectedSymptoms = {};

  final List<SymptomModel> symptoms = [
    SymptomModel('Febre', FontAwesomeIcons.temperatureArrowUp),
    SymptomModel('Dor', FontAwesomeIcons.bandage),
    SymptomModel('Tosse', FontAwesomeIcons.headSideCough),
    SymptomModel('Nariz escorrendo', FontAwesomeIcons.boxTissue),
    SymptomModel('Vômito', FontAwesomeIcons.faceDizzy),
    SymptomModel('Diarreia', FontAwesomeIcons.pooStorm),
    SymptomModel('Dor de garganta', FontAwesomeIcons.lungsVirus),
  ];

  @override
  Widget build(BuildContext context) {
    final isMale = widget.child.gender == Gender.male;
    final primaryColor = isMale
        ? Theme.of(context).colorScheme.primary
        : Colors.pink.shade400;

    return Scaffold(
      appBar: AppBar(
        title: Text('Sintomas'),
        leading: IconButton(
          icon: FaIcon(FontAwesomeIcons.angleLeft, size: 26),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'O que ${widget.child.name.split(' ').first} está sentindo hoje?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  'Selecione um ou mais sintomas abaixo:',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[700],
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 12),
                GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: symptoms.length,
                  itemBuilder: (context, index) {
                    final symptom = symptoms[index];
                    final isSelected = selectedSymptoms.contains(symptom.label);

                    return SymptomCard(
                      symptom: symptom,
                      isSelected: isSelected,
                      primaryColor: primaryColor,
                      onTap: () {
                        setState(() {
                          isSelected
                              ? selectedSymptoms.remove(symptom.label)
                              : selectedSymptoms.add(symptom.label);
                        });
                      },
                    );
                  },
                ),
                SizedBox(height: 16),
                MyButton(
                  text: 'Selecionar Sintomas',
                  icon: FontAwesomeIcons.viruses,
                  backgroundColor: primaryColor,
                  onPressed: selectedSymptoms.isEmpty
                      ? null
                      : () {
                          print(selectedSymptoms);
                        },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
