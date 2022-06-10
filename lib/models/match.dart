import 'package:api_riot/models/item.dart';
import 'package:api_riot/models/profil.dart';
import 'package:flutter/foundation.dart';

class Match {
  final String id;
  final Profil profil;
  bool playerWin;
  int date;
  List<Item> listItem;
  Match(this.id, this.profil, this.playerWin, this.date, this.listItem);
}
