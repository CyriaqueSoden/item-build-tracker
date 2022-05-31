import 'dart:convert';

import 'package:api_riot/models/player.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PlayerRepository {
  Future<void> savePlayer(List<Player> players) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String> listJson = [];
    for (final Player player in players) {
      listJson.add(jsonEncode(player.toJson()));
    }
    prefs.setStringList('players', listJson);
  }

  Future<List<Player>> loadPlayers() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<Player> players = [];
    final List<String> listJson = prefs.getStringList('players') ?? [];
    for (final String json in listJson) {
      players.add(Player.fromJson(jsonDecode(json)));
    }

    return players;
  }
}

