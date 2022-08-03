import 'dart:convert';

import 'package:api_riot/models/item.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart';

class ItemNameRepository {
  Future<String> loadItem(id) async {
    String name = '';
    final Response response = await get(Uri.parse(
        'http://ddragon.leagueoflegends.com/cdn/12.11.1/data/en_US/item.json'));
    if (response.statusCode == 200) {
      Map json = jsonDecode(response.body);

      json["data"].keys.forEach((k) {
        if (k == id.toString()) {
          name = json["data"][k]["name"];
        }
      });
    } else {
      name = 'Error';
    }
    return name;
  }
}
