import 'package:flutter/foundation.dart';

class Match {
  final String id;
  final String idPlayer;
  bool playerWin;
  List<int> listItem;
  Match(this.id, this.idPlayer, this.playerWin, this.listItem);
}
