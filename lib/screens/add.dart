import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/player_cubite.dart';
import '../models/player.dart';


class Add extends StatelessWidget {
  const Add({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profil'),
        ),
        body:
            BlocBuilder<PlayerCubit, List<Player>>(builder: ((context, state) {
          return Column(
            children: [Text('${state[0].profil}')],
          );
        })));
  }
}