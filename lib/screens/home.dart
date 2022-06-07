import 'package:api_riot/blocs/recherche_cubite.dart';
import 'package:api_riot/repositories/champion_repository.dart';
import 'package:api_riot/repositories/profil_repository.dart';
import 'package:api_riot/screens/profil_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/champion_cubite.dart';
import '../blocs/profil_cubite.dart';
import '../models/profil.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final TextEditingController _championController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('API Riot'),
        ),
        body: BlocListener<ProfilCubit, Profil>(
            listener: (context, state) {
              Navigator.of(context).pushNamed('/profil_view');
            },
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 8.0, horizontal: 8.0),
                  child: TextFormField(
                    controller: _championController,
                    decoration: InputDecoration(
                        labelText: "Champion",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10))),
                  ),
                ),
                ElevatedButton(
                    child: const Text('Search'),
                    onPressed: () {
                      context
                          .read<RechercheCubit>()
                          .emiteRecherche(_championController.text);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProfilView(),
                        ),
                      );
                    }),
                ElevatedButton(
                    child: const Text('Add new account'),
                    onPressed: () async {
                      await Navigator.of(context).pushNamed('/add');
                    }),
                ElevatedButton(
                    child: const Text('Delete all acount'),
                    onPressed: () async {
                      ChampionRepository().clearAll();
                    })
              ],
            )));
  }
}
