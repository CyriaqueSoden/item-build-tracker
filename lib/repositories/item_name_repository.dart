// import 'dart:convert';

// import 'package:api_riot/models/item.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:http/http.dart';

// class ItemNameRepository {
//   Future<String> loadItem(id) async {
//     String name = '';
//     final Response response = await get(Uri.parse(
//         'http://ddragon.leagueoflegends.com/cdn/12.11.1/data/en_US/item.json'));
//     if (response.statusCode == 200) {
//       Map json = jsonDecode(response.body);

//       json['data'].forEach((String map) {
//         if (map == id) {
//           name = json['data'][id]['name'];
//         }
//       });
//       // for (Map map in json['data']) {
//       //   if (map == id) {
//       //     name = json['data'][id]['name'];
//       //   }

//     } else {
//       name = 'Error';
//     }
//     return name;
//   }
// }
