import 'dart:convert';

import 'package:api_riot/blocs/recherche_cubite.dart';
import 'package:api_riot/models/item.dart';
import 'package:api_riot/repositories/item_name_repository.dart';
import 'package:http/http.dart';
import 'package:http/retry.dart';
import '../models/api_key.dart';
import '../models/match.dart';

class MatchDetailsRepository {
  Future<List<Match>> getDetails(listeMatchs, champName) async {
    ItemNameRepository itemNameRepository = ItemNameRepository();
    for (Match match in listeMatchs) {
      if (match.id != "Error") {
        final Response response = await get(Uri.parse(
            'https://europe.api.riotgames.com/lol/match/v5/matches/${match.id}?api_key=${ApiKey.key}'));
        if (response.statusCode == 200) {
          Map json = jsonDecode(response.body);
          if (json['info']['gameMode'] == 'CLASSIC' &&
              json['info']['gameType'] == 'MATCHED_GAME') {
            for (int j = 0; j < 10; j++) {
              if (json['info']['participants'][j]['puuid'] ==
                  match.profil.puuid) {
                if (json['info']['participants'][j]['championName'] ==
                    champName) {
                  for (int i = 0; i < 6; i++) {
                    if (json['info']['participants'][j]['item$i'] != 0) {
                      match.listItem.add(Item(
                          json['info']['participants'][j]['item$i'],
                          await itemNameRepository.loadItem(
                              json['info']['participants'][j]['item$i'])));
                    }
                  }
                  if (json['info']['participants'][j]['win'] == true) {
                    match.playerWin = "Win";
                  } else {
                    match.playerWin = "Lose";
                  }
                  match.date = json['info']['gameCreation'];
                } else {
                  match.listItem.add(Item(9999999999, ''));
                }
              }
            }
          } else {
            match.listItem.add(Item(9999999999, ''));
          }
        }
      }
    }
    listeMatchs.removeWhere((item) => item.listItem[0].id == 9999999999);
    return listeMatchs;
  }
}
