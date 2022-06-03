import 'package:api_riot/models/champion.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/champion_cubite.dart';
import '../blocs/profil_cubite.dart';
import '../models/profil.dart';

class ProfilView extends StatelessWidget {
  ProfilView({Key? key, required String nom}) : super(key: key);

  String nom = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profil'),
        ),
        body: BlocBuilder<ChampionCubit, List<Champion>>(
            builder: ((context, state) {
          return Column(
            children: [
              for (Champion champion in state)
                if (champion.champion == "Aatrox")
                  Text(champion.profils[0].name)
            ],
          );
        })));
  }
}
