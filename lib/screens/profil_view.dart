import 'package:api_riot/blocs/recherche_cubite.dart';
import 'package:api_riot/models/champion.dart';
import 'package:api_riot/models/profil.dart';
import 'package:api_riot/repositories/match_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/retry.dart';
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
            return Column(
              children: [
                FutureBuilder<List<List<String>>>(
                    future: matchRepository.loadMatch(
                        championState, rechercheState),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        lebordel = snapshot.data!;
                        return Flexible(
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return ListTile(
                                    onTap: () {},
                                    title: Text(""),
                                    subtitle: Text(
                                        '${lebordel[index][0]} ${lebordel[index][1]}'));
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
