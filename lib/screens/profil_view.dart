import 'package:api_riot/blocs/recherche_cubite.dart';
import 'package:api_riot/models/champion.dart';
import 'package:api_riot/models/profil.dart';
import 'package:api_riot/repositories/match_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/champion_cubite.dart';

class ProfilView extends StatelessWidget {
  ProfilView({Key? key}) : super(key: key);
  List<List<String>> lebordel = [];
  MatchRepository matchRepository = MatchRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profil'),
        ),
        body: BlocBuilder<ChampionCubit, List<Champion>>(
            builder: (context, championState) {
          return BlocBuilder<RechercheCubit, String>(
              builder: (context, rechercheState) {
            lebordel = await matchRepository.loadMatch(championState, rechercheState)
            return Column(
              children: [
                for (List list in lebordel)
                  for (List list2 in list) Text("${list2[0]} ${list2[1]}")
              ],
            );
          });
        }));
  }
}
