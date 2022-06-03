import 'dart:convert';

import 'package:api_riot/models/champion.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChampionRepository {
  Future<void> saveChampion(List<Champion> champions) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> listJson = [];
    for (final Champion champion in champions) {
      listJson.add(jsonEncode(champion.toJson()));
    }
    prefs.setStringList('champions', listJson);
  }

  Future<List<Champion>> loadChampions() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<Champion> champions = [];
    final List<String> listJson = prefs.getStringList('champions') ?? [];
    for (final String json in listJson) {
      champions.add(Champion.fromJson(jsonDecode(json)));
    }

    return champions;
  }
}

