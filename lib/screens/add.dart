import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Add extends StatelessWidget {
  const Add({Key? key}) : super(key: key);

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
                    onPressed: () {
                      context
                          .read<ProfilCubit>()
                          .loadProfil(_profilController.text);
                    })
              ],
            ))
  }
}