import 'dart:convert';

import 'package:api_riot/models/profil.dart';
import 'package:http/http.dart';

class ProfilRepository {
  Future<Profil> fetchAddresses(String query) async {
    final Response response = await get(Uri.parse(
        'https://euw1.api.riotgames.com/lol/summoner/v4/summoners/by-name/$query?api_key='));
    if (response.statusCode == 200) {
      Profil profil = Profil.fromJson(jsonDecode(response.body));
      return profil;
    } else {
      Profil profil = Profil('', 0, 'profil doesnt exist', '', '', 0);
      return profil;
    }
  }
}
