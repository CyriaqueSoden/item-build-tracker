import 'dart:convert';

import 'package:api_riot/models/profil.dart';
import 'package:http/http.dart';

import '../models/champion.dart';
import '../models/match.dart';

class MatchRepository {
  Future<List<List<String>>> loadMatch(
      List<Champion> liste, String champName) async {
    List<Match> listeMatchs = [];
    for (Champion champion in liste) {
      if (champion.champion == champName) {
        for (Profil profil in champion.profils) {
          final Response response = await get(Uri.parse(
              'https://europe.api.riotgames.com/lol/match/v5/matches/by-puuid/${profil.puuid}/ids?start=0&count=20&api_key=RGAPI-3c045ead-652c-4de9-8744-4caabccf6bda'));
          if (response.statusCode == 200) {
            listeMatchs.add(Match(profil.id, jsonDecode(response.body)));
          } else {
            listeMatchs.add(Match(profil.id, ["Error"]));
          }
        }
      }
    }
    List<List<String>> temp = [];
    for (Match match in listeMatchs) {
      for (String idMatch in match.stringMatchs) {
        if (idMatch != "Error") {
          final Response response = await get(Uri.parse(
              'https://europe.api.riotgames.com/lol/match/v5/matches/${idMatch}'));
          if (response.statusCode == 200) {
            temp.add([match.id, idMatch]);
          }
        }
      }
    }
    return temp;
  }
}
