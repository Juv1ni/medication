import 'dart:convert';

import 'package:medication/models/child_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChildrenStorage {
  static const _key = 'children';

  static Future<void> save(List<ChildModel> children) async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = children.map((c) => jsonEncode(c.toMap())).toList();
    await prefs.setStringList(_key, jsonList);
  }

  static Future<List<ChildModel>> load() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonList = prefs.getStringList(_key);

    if (jsonList == null) return [];

    return jsonList.map((e) => ChildModel.fromMap(jsonDecode(e))).toList();
  }
}
