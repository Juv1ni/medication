import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medication/controllers/add_child_controller.dart';
import 'package:medication/models/gender_model.dart';
import 'package:medication/widgets/my_button.dart';
import 'package:medication/widgets/my_form.dart';
import 'package:medication/widgets/my_select_button.dart';

class AddChildScreen extends StatefulWidget {
  const AddChildScreen({super.key});

  @override
  State<AddChildScreen> createState() => _AddChildScreenState();
}

class _AddChildScreenState extends State<AddChildScreen> {
  final controller = AddChildController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar Criança'),
        leading: IconButton(
          icon: FaIcon(FontAwesomeIcons.angleLeft, size: 26),
          onPressed: () {
            Navigator.popAndPushNamed(context, '/home');
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Text(
                'Preencha os dados da sua criança:',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(height: 8),
              MyForm(
                text: 'Nome Completo',
                hintText: 'Ex.: Ana Maria',
                controller: controller.nameController,
              ),
              SizedBox(height: 12),
              MyForm(
                text: 'Data de Nascimento',
                hintText: 'DD/MM/AAAA',
                icon: FontAwesomeIcons.calendarDays,
                keyboardType: TextInputType.datetime,
                mask: '##/##/####',
                controller: controller.birthController,
              ),
              SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Gênero',
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                ],
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: MySelectButton(
                      text: 'Masculino',
                      icon: FontAwesomeIcons.mars,
                      selected: controller.selectedGender == Gender.male,
                      onPressed: () {
                        setState(() {
                          controller.selectedGender = Gender.male;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: MySelectButton(
                      text: 'Feminino',
                      icon: FontAwesomeIcons.venus,
                      selected: controller.selectedGender == Gender.female,
                      onPressed: () {
                        setState(() {
                          controller.selectedGender = Gender.female;
                        });
                      },
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: MySelectButton(
                      text: 'Outro',
                      icon: FontAwesomeIcons.genderless,
                      selected: controller.selectedGender == Gender.other,
                      onPressed: () {
                        setState(() {
                          controller.selectedGender = Gender.other;
                        });
                      },
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12),
              MyForm(
                text: 'Alergias',
                hintText: 'Dipirona, Benzetacil, etc...',
                icon: FontAwesomeIcons.prescriptionBottleMedical,
                controller: controller.allergiesController,
              ),
              SizedBox(height: 12),
              MyForm(
                text: 'Peso(kg)',
                hintText: 'Ex.: 12.5',
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                icon: FontAwesomeIcons.weightScale,
                controller: controller.weightController,
                mask: '##.##',
              ),
              SizedBox(height: 20),
              MyButton(
                text: 'Salvar',
                icon: FontAwesomeIcons.floppyDisk,
                onPressed: () {
                  if (!controller.isValid()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Preencha todos os campos obrigatórios.'),
                      ),
                    );
                    return;
                  }
                  Navigator.pop(context, controller.buildChild());
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
