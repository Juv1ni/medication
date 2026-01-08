import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:medication/models/child_model.dart';
import 'package:medication/models/children_storage.dart';
import 'package:medication/widgets/delete_child_dialog.dart';
import 'package:medication/widgets/kid_card.dart';
import 'package:medication/widgets/my_button.dart';
import 'package:medication/widgets/no_kid.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ChildModel> children = [];
  ChildModel? selectedChild;

  @override
  void initState() {
    super.initState();
    loadChildren();
  }

  Future<void> loadChildren() async {
    final savedChildren = await ChildrenStorage.load();
    setState(() {
      children
        ..clear()
        ..addAll(savedChildren);
    });
  }

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
                children.isEmpty
                    ? NoKid()
                    : Column(
                        children: children.map((child) {
                          return KidCard(
                            child: child,
                            selected: selectedChild == child,
                            onSelect: () {
                              setState(() {
                                selectedChild = child;
                              });
                              Navigator.pushNamed(
                                context,
                                '/medications',
                                arguments: child,
                              );
                            },
                            onEdit: () async {
                              final result = await Navigator.pushNamed(
                                context,
                                '/edit_child',
                                arguments: child,
                              );
                              if (result != null && result is ChildModel) {
                                setState(() {
                                  final index = children.indexOf(child);
                                  children[index] = result;
                                });
                                await ChildrenStorage.save(children);
                              }
                            },
                            onDelete: () async {
                              final confirm = await showDialog<bool>(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) =>
                                    DeleteChildDialog(child: child),
                              );
                              if (confirm == true) {
                                setState(() {
                                  children.remove(child);
                                  if (selectedChild == child) {
                                    selectedChild = null;
                                  }
                                });
                                await ChildrenStorage.save(children);
                              }
                            },
                          );
                        }).toList(),
                      ),
                SizedBox(height: 20),
                MyButton(
                  text: 'Adicionar Criança',
                  onPressed: () async {
                    final result = await Navigator.pushNamed(
                      context,
                      '/add_child',
                    );

                    if (result != null && result is ChildModel) {
                      setState(() {
                        children.add(result);
                      });
                      await ChildrenStorage.save(children);
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
