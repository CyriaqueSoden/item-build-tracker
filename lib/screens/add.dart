import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/champion_cubite.dart';
import '../models/champion.dart';

class Add extends StatelessWidget {
  Add({Key? key}) : super(key: key);

  final TextEditingController _addPlayerController = TextEditingController();
  final TextEditingController _addChampionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profil'),
        ),
        body:
            BlocBuilder<PlayerCubit, List<Player>>(builder: ((context, state) {
          return Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                child: TextFormField(
                  controller: _addPlayerController,
                  decoration: InputDecoration(
                      labelText: "Nom du compte",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: TextFormField(
                  controller: _addChampionController,
                  decoration: InputDecoration(
                      labelText: "Champion",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
              ElevatedButton(
                  child: const Text('Ajouter'),
                  onPressed: () {
                    context
                        .read<ProfilCubit>()
                        .loadProfil(_championController.text);
                  }),
            ],
          );
        })));
  }
}
