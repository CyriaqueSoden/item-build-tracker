import 'dart:ffi';

class Profil {
  final String accountId;
  final int profileIconId;
  final String name;
  final String id;
  final String puuid;
  final int summonerLevel;
  const Profil(this.accountId, this.profileIconId, this.name, this.id,
      this.puuid, this.summonerLevel);

  Map<String, dynamic> toJson() {
    return {
      'accountId': accountId,
      'profileIconId': profileIconId,
      'name': name,
      'id': id,
      'puuid': puuid,
      'summonerLevel': summonerLevel,
    };
  }

  factory Profil.fromJson(Map<String, dynamic> json) {
    return Profil(json['accountId'], json['profileIconId'], json['name'],
        json['id'], json['puuid'], json['summonerLevel']);
  }
}
