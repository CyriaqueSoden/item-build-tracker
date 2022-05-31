import 'package:api_riot/models/profil.dart';

class Player {
  final Profil profil;
  final List<String> champion;
  const Player(this.profil, this.champion);

  Map<String, dynamic> toJson() {
    return {
      'profil': profil.toJson(),
      'champion': champion,
    };
  }

  factory Player.fromJson(Map<String, dynamic> json) {
    return Player(Profil.fromJson(json['profil']), json['champion']);
  }
}
