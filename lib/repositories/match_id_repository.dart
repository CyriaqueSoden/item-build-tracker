import 'dart:convert';
import 'dart:ffi';

import 'package:api_riot/models/profil.dart';
import 'package:api_riot/repositories/match_details_repository.dart';
import 'package:http/http.dart';

import '../models/api_key.dart';
import '../models/champion.dart';
import '../models/match.dart';

class MatchRepository {
  Future<List<Match>> loadMatch(List<Champion> liste, String champName) async {
    List<Match> listeMatchs = [];
    for (Champion champion in liste) {
      if (champion.champion == champName) {
        for (Profil profil in champion.profils) {
          final Response response = await get(Uri.parse(
              'https://europe.api.riotgames.com/lol/match/v5/matches/by-puuid/${profil.puuid}/ids?start=0&count=5&api_key=${ApiKey.key}'));
          if (response.statusCode == 200) {
            for (String matchId in jsonDecode(response.body).cast<String>()) {
              listeMatchs.add(Match(matchId, profil.puuid, true, []));
            }
          } else {
            listeMatchs.add(Match('Error', profil.puuid, true, []));
          }
        }
      }
    }
    return MatchDetailsRepository().getDetails(listeMatchs);
  }
}
