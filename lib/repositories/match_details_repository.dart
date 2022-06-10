import 'dart:convert';

import 'package:api_riot/blocs/recherche_cubite.dart';
import 'package:api_riot/models/item.dart';
import 'package:api_riot/repositories/item_repository.dart';
import 'package:http/http.dart';
import 'package:http/retry.dart';
import '../models/api_key.dart';
import '../models/match.dart';

class MatchDetailsRepository {
  Future<List<Match>> getDetails(listeMatchs, champName) async {
    ItemRepository itemRepository = ItemRepository();
    for (Match match in listeMatchs) {
      if (match.id != "Error") {
        final Response response = await get(Uri.parse(
            'https://europe.api.riotgames.com/lol/match/v5/matches/${match.id}?api_key=${ApiKey.key}'));
        if (response.statusCode == 200) {
          Map json = jsonDecode(response.body);
          for (int j = 0; j < 10; j++) {
            if (json['info']['participants'][j]['puuid'] ==
                match.profil.puuid) {
              if (json['info']['participants'][j]['championName'] ==
                  champName) {
                for (int i = 0; i < 6; i++) {
                  match.listItem.add(Item(
                      json['info']['participants'][j]['item${i}'],
                      await itemRepository.loadItem(
                          json['info']['participants'][j]['item${i}'])));
                }
                match.playerWin = json['info']['participants'][j]['win'];
                match.date = json['info']['gameCreation'];
              } else {
                for (int i = 0; i < 6; i++) {
                  match.listItem.add(Item(9999999999, ''));
                }
              }
            }
          }
        }
      }
    }
    listeMatchs.removeWhere((item) => item.listItem[0] == 9999999999);
    return listeMatchs;
  }
}
