import 'package:api_riot/blocs/recherche_cubite.dart';
import 'package:api_riot/models/champion.dart';
import 'package:api_riot/models/match.dart';
import 'package:api_riot/repositories/match_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/champion_cubite.dart';

class ProfilView extends StatelessWidget {
  ProfilView({Key? key}) : super(key: key);
  List<Match> listMatch = [];
  MatchRepository matchRepository = MatchRepository();
  RechercheCubit rechercheCubit = RechercheCubit();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
              BlocProvider.of<RechercheCubit>(context, listen: false).state),
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
                        listMatch = snapshot.data!;
                        listMatch.sort((a, b) => b.date.compareTo(a.date));
                        return Flexible(
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return Card(
                                    child: Row(children: [
                                  if (listMatch[index].playerWin == "Win") ...[
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Text(
                                            '${listMatch[index].profil.name}, ${listMatch[index].playerWin} ',
                                            style: const TextStyle(
                                              color: Colors.green,
                                              fontSize: 15,
                                            ))),
                                  ] else ...[
                                    Padding(
                                        padding:
                                            EdgeInsets.fromLTRB(10, 0, 0, 0),
                                        child: Text(
                                            '${listMatch[index].profil.name}, ${listMatch[index].playerWin} ',
                                            style: const TextStyle(
                                              color: Colors.red,
                                              fontSize: 15,
                                            ))),
                                  ],
                                  Flexible(
                                      child: Container(
                                    height: 50,
                                    width: 1000,
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index2) {
                                        return Container(
                                          child: LayoutBuilder(
                                              builder: (context, constraints) {
                                            if (listMatch[index]
                                                    .listItem[index2]
                                                    .name !=
                                                "empty") {
                                              return Tooltip(
                                                  message: listMatch[index]
                                                      .listItem[index2]
                                                      .name,
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.fromLTRB(
                                                              5, 5, 5, 5),
                                                      child: Image(
                                                          image: NetworkImage(
                                                              'http://ddragon.leagueoflegends.com/cdn/12.11.1/img/item/${listMatch[index].listItem[index2].id}.png'))));
                                            } else {
                                              return Padding(
                                                  padding:
                                                      const EdgeInsets.fromLTRB(
                                                          5, 5, 5, 5),
                                                  child: Container(
                                                    height: 48,
                                                    width: 40,
                                                    decoration:
                                                        const BoxDecoration(
                                                            shape: BoxShape
                                                                .rectangle,
                                                            color: Colors.grey),
                                                    child: const Text(""),
                                                  ));
                                            }
                                            ;
                                          }),
                                        );
                                      },
                                      itemCount:
                                          listMatch[index].listItem.length,
                                    ),
                                  ))
                                ]));
                              },
                              itemCount: listMatch.length),
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
