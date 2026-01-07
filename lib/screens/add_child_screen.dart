import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medication/widgets/my_button.dart';
import 'package:medication/widgets/my_form.dart';
import 'package:medication/widgets/my_select_button.dart';

class AddChildScreen extends StatefulWidget {
  const AddChildScreen({super.key});

  @override
  State<AddChildScreen> createState() => _AddChildScreenState();
}

class _AddChildScreenState extends State<AddChildScreen> {
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
              MyForm(text: 'Nome Completo', hintText: 'Ex.: Ana Maria'),
              SizedBox(height: 12),
              MyForm(
                text: 'Data de Nascimento',
                hintText: 'DD/MM/AAAA',
                icon: FontAwesomeIcons.calendarDays,
                keyboardType: TextInputType.datetime,
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
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: MySelectButton(
                      text: 'Feminino',
                      icon: FontAwesomeIcons.venus,
                      onPressed: () {},
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: MySelectButton(
                      text: 'Outro',
                      icon: FontAwesomeIcons.genderless,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),

              SizedBox(height: 12),
              MyForm(
                text: 'Alergias',
                hintText: 'Dipirona, Benzetacil, etc...',
                icon: FontAwesomeIcons.prescriptionBottleMedical,
              ),
              SizedBox(height: 12),
              MyForm(
                text: 'Peso(kg)',
                hintText: 'Ex.: 12.5',
                keyboardType: TextInputType.number,
                icon: FontAwesomeIcons.weightScale,
              ),
              SizedBox(height: 20),
              MyButton(
                text: 'Salvar',
                icon: FontAwesomeIcons.floppyDisk,
                onPressed: () {
                  Navigator.popAndPushNamed(context, '/home');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
