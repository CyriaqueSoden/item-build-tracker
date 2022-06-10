import 'package:api_riot/blocs/recherche_cubite.dart';
import 'package:api_riot/models/champion.dart';
import 'package:api_riot/models/match.dart';
import 'package:api_riot/repositories/match_id_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/champion_cubite.dart';

class ProfilView extends StatelessWidget {
  ProfilView({Key? key}) : super(key: key);
  List<Match> lebordel = [];
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
            return Column(
              children: [
                FutureBuilder<List<Match>>(
                    future: matchRepository.loadMatch(
                        championState, rechercheState),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        lebordel = snapshot.data!;
                        lebordel.sort((a, b) => b.date.compareTo(a.date));
                        return Flexible(
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ListTile(
                                    onTap: () {},
                                    title: Text(""),
                                    subtitle: Text(
                                        '${lebordel[index].listItem[0].name}, ${lebordel[index].profil.name}'));
                              },
                              itemCount: lebordel.length),
                        );
                      } else {
                        return Text('waiting');
                      }
                    }),
              ],
            );
          });
        }));
  }
}
