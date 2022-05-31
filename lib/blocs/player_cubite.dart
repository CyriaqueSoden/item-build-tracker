import 'dart:ui';

import 'package:api_riot/models/player.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/profil.dart';
import '../repositories/player_repository.dart';

class PlayerCubit extends Cubit<Player> {
  final PlayerRepository playerRepository;
  PlayerCubit(this.playerRepository)
      : super(Player(Profil('', 0, 'profil doesnt exist', '', '', 0), []));

  Future<void> loadProfil(query) async {
    final Future<List<Player>> player = playerRepository.loadPlayers();
    emit(player);
  }

  
  
}
