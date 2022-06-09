import 'dart:convert';

import 'package:http/http.dart';
import 'package:http/retry.dart';
import '../models/api_key.dart';
import '../models/match.dart';

class MatchDetailsRepository {
  Future<List<Match>> getDetails(listeMatchs) async {
    for (Match match in listeMatchs) {
      if (match.id != "Error") {
        final Response response = await get(Uri.parse(
            'https://europe.api.riotgames.com/lol/match/v5/matches/${match.id}?api_key=${ApiKey.key}'));
        if (response.statusCode == 200) {
          Map json = jsonDecode(response.body);
          for (int j = 0; j < 10; j++) {
            if (json['info']['participants'][j]['puuid'] == match.idPlayer) {
              for (int i = 0; i < 6; i++) {
                match.listItem.add(json['info']['participants'][i]['item${i}']);
              }
            }
          }
        }
      }
    }
    return listeMatchs;
  }
}
