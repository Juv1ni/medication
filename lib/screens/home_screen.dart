import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medication/models/child_model.dart';
import 'package:medication/widgets/my_button.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final List<ChildModel> children = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(title: const Text('MedKids')),

      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FaIcon(
                  FontAwesomeIcons.children,
                  size: 80,
                  color: Theme.of(context).colorScheme.secondary,
                ),
                SizedBox(height: 20),
                Text(
                  'De quem vamos cuidar hoje?',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(height: 20),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).colorScheme.tertiary,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Center(
                      child: Text(
                        'Nenhuma criança cadastrada.',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                MyButton(
                  text: 'Adicionar Criança',
                  onPressed: () async {
                    final result = await Navigator.pushNamed(
                      context,
                      '/add_child',
                    );

                    if (result != null) {
                      final child = result as ChildModel;
                      print(child.name);
                    }
                  },
                  icon: FontAwesomeIcons.child,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
