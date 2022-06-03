import 'package:api_riot/models/profil.dart';

class Champion {
  final List<Profil> profils;
  final String champion;
  const Champion(this.profils, this.champion);

  Map<String, dynamic> toJson() {
    return {
      "champion": champion,
      "profils": List<dynamic>.from(profils.map((x) => x.toJson())),
    };
  }

  factory Champion.fromJson(Map<String, dynamic> json) {
    return Champion(
        List<Profil>.from(json["profils"].map((x) => Profil.fromJson(x))),
        json['champion']);
  }

  factory Champion.createChampion(Map<String, dynamic> json) {
    return Champion(
        [],
        json['data']['name']);
  }


}
