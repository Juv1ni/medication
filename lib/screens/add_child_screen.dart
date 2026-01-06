import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medication/widgets/gender_selector.dart';
import 'package:medication/widgets/my_form.dart';

enum Gender { male, female, other }

class AddChildScreen extends StatelessWidget {
  const AddChildScreen({super.key});

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
                style: Theme.of(context).textTheme.labelLarge,
              ),
              MyForm(labelText: 'Nome Completo'),
              SizedBox(height: 12),
              MyForm(
                labelText: 'Data de Nascimento',
                icon: FontAwesomeIcons.calendarDays,
                keyboardType: TextInputType.datetime,
              ),
              SizedBox(height: 12),
              GenderSelector(),
              SizedBox(height: 12),
              MyForm(
                labelText: 'Alergias',
                hintText: 'Dipirona, Benzetacil, etc...',
                icon: FontAwesomeIcons.prescriptionBottleMedical,
              ),
              SizedBox(height: 12),
              MyForm(labelText: 'Peso(kg)', keyboardType: TextInputType.number),
            ],
          ),
        ),
      ),
    );
  }
}
