import 'package:api_riot/repositories/profil_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/player_cubite.dart';
import '../blocs/profil_cubite.dart';
import '../models/profil.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final TextEditingController _profilController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('API Riot'),
        ),
        body: BlocListener<ProfilCubit, Profil>(
            listener: (context, state) {
              if (state.summonerLevel > 0) {
                Navigator.of(context).pushNamed('/profil_view');
              } else {
                print('Profil doesnt exist');
              }
            },
            child: Column(
              children: [
                TextFormField(
                  controller: _profilController,
                ),
                ElevatedButton(
                    child: const Text('Search'),
                    onPressed: () {
                      context
                          .read<ProfilCubit>()
                          .loadProfil(_profilController.text);
                    }),
                ElevatedButton(
                    child: const Text('Add new account'),
                    onPressed: () async {
                      await Navigator.of(context).pushNamed('/add');
                    })
              ],
            )));
  }
}
