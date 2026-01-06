import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medication/screens/add_child_screen.dart';

class GenderSelector extends StatefulWidget {
  const GenderSelector({super.key});

  @override
  State<GenderSelector> createState() => _GenderSelectorState();
}

class _GenderSelectorState extends State<GenderSelector> {
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<Gender>(
      initialValue: selectedGender,
      decoration: InputDecoration(
        labelText: 'Gênero',
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
        prefixIcon: const Padding(
          padding: EdgeInsets.only(top: 12),
          child: FaIcon(FontAwesomeIcons.venusMars),
        ),
      ),
      items: const [
        DropdownMenuItem(
          value: Gender.male,
          child: Text('Masculino', style: TextStyle(color: Colors.blue)),
        ),
        DropdownMenuItem(
          value: Gender.female,
          child: Text('Feminino', style: TextStyle(color: Colors.pink)),
        ),
        DropdownMenuItem(
          value: Gender.other,
          child: Text('Outro', style: TextStyle(color: Colors.deepPurple)),
        ),
      ],
      onChanged: (value) {
        setState(() {
          selectedGender = value;
        });
      },
    );
  }
}
