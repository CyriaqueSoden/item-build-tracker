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
                                return Row(children: [
                                  Text(
                                      '${listMatch[index].profil.name}, ${listMatch[index].playerWin}'),
                                  Flexible(
                                    child: ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index2) {
                                        return Flexible(
                                            child: Image(
                                                width: 100,
                                                height: 100,
                                                image: NetworkImage(
                                                    'http://ddragon.leagueoflegends.com/cdn/12.11.1/img/item/${listMatch[index].listItem[index2].id}.png')));
                                      },
                                      itemCount:
                                          listMatch[index].listItem.length,
                                    ),
                                  )
                                ]);
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
