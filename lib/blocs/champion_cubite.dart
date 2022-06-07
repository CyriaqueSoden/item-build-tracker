import 'dart:convert';
import 'dart:ui';

import 'package:api_riot/data.dart';
import 'package:api_riot/models/champion.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';

import '../models/profil.dart';
import '../repositories/champion_repository.dart';

class ChampionCubit extends Cubit<List<Champion>> {
  final ChampionRepository championRepository;
  ChampionCubit(this.championRepository) : super([Champion([], "")]);

  void addChampion(Champion champion) {
    emit([...state, champion]);
    championRepository.saveChampion(state);
  }

  Future<void> loadChampion() async {
    List<Champion> champions = await championRepository.loadChampions();
    if (champions.length < 10) {
      champions = BigData().createData();
    }
    emit(champions);
  }
}
