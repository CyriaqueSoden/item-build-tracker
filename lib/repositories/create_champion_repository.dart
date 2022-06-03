// import 'dart:convert';

// import 'package:http/http.dart';

// import '../models/champion.dart';

// class CreateChampionRepository {
//   Future<List<Champion>> createChampion() async {
//     final Response response = await get(Uri.parse(
//         'http://ddragon.leagueoflegends.com/cdn/12.10.1/data/en_US/champion.json'));
//     if (response.statusCode == 200) {
//       Champion champion = Champion.createChampion(jsonDecode(response.body));
//       return champion;
//       }
//     } else {
//       print("Ca marche pas");
//       return [];
//     }
//   }
