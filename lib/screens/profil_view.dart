import 'package:api_riot/blocs/recherche_cubite.dart';
import 'package:api_riot/models/champion.dart';
import 'package:api_riot/models/profil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/champion_cubite.dart';

class ProfilView extends StatelessWidget {
  ProfilView({Key? key}) : super(key: key);

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
            return Column(
              children: [
                for (Champion champion in championState)
                  if (champion.champion == rechercheState)
                    for (Profil profil in champion.profils) Text(profil.name)
              ],
            );
          });
        }));
  }
}
