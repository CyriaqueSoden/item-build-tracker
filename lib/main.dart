import 'package:api_riot/blocs/champion_cubite.dart';
import 'package:api_riot/blocs/profil_cubite.dart';
import 'package:api_riot/blocs/recherche_cubite.dart';
import 'package:api_riot/repositories/champion_repository.dart';
import 'package:api_riot/repositories/profil_repository.dart';
import 'package:api_riot/screens/add.dart';
import 'package:api_riot/screens/home.dart';
import 'package:api_riot/screens/profil_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  final ProfilRepository preferencesRepository = ProfilRepository();
  final ProfilCubit profilCubit = ProfilCubit(preferencesRepository);
  final ChampionRepository championRepository = ChampionRepository();
  final ChampionCubit championCubit = ChampionCubit(championRepository);
  final RechercheCubit rechercheCubit = RechercheCubit();
  runApp(BlocProvider<ProfilCubit>(
    create: (context) => profilCubit,
    child: BlocProvider<ChampionCubit>(
      create: (context) => championCubit,
      child: BlocProvider<RechercheCubit>(
        create: (context) => rechercheCubit,
        child: MyApp(),
      ),
    ),
  ));
  championCubit.loadChampion();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/home',
      routes: {
        '/home': (context) => Home(),
        '/profil_view': (context) => ProfilView(),
        '/add': (context) => Add(),
      },
      title: 'API Riot',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
