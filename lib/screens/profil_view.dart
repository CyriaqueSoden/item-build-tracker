import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/profil_cubite.dart';
import '../models/profil.dart';

class ProfilView extends StatelessWidget {
  const ProfilView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profil'),
        ),
        body: BlocBuilder<ProfilCubit, Profil>(builder: ((context, state) {
          return Column(
            children: [Text('${state.name}  -  lvl .${state.summonerLevel}')],
          );
        })));
  }
}
