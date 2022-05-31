import 'dart:ui';

import 'package:api_riot/models/player.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/profil.dart';
import '../repositories/player_repository.dart';

class PlayerCubit extends Cubit<List<Player>> {
  final PlayerRepository playerRepository;
  PlayerCubit(this.playerRepository)
      : super([Player(Profil('', 0, 'profil doesnt exist', '', '', 0), [])]);

  Future<void> loadPlayer() async {
    final List<Player> players =
        await playerRepository.loadPlayers();
    emit(players);
  }

  
  
}
