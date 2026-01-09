import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class EditChildScreen extends StatelessWidget {
  const EditChildScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar Criança'),
        leading: IconButton(
          icon: FaIcon(FontAwesomeIcons.angleLeft, size: 26),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Center(child: Text('Tela de Edição de Criança')),
    );
  }
}
