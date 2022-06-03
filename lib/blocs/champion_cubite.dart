import 'dart:ui';

import 'package:api_riot/models/champion.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/profil.dart';
import '../repositories/champion_repository.dart';

class ChampionCubit extends Cubit<List<Champion>> {
  final ChampionRepository championRepository;
  ChampionCubit(this.championRepository)
      : super([Champion([], "")]);

  Future<void> loadChampion() async {
    final List<Champion> champions =
        await championRepository.loadChampions();
    emit(champions);
  }

  
  
}
