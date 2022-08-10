import 'dart:convert';

import 'package:api_riot/repositories/champion_repository.dart';
import 'package:api_riot/repositories/profil_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/champion_cubite.dart';
import '../models/champion.dart';

class Add extends StatefulWidget {
  Add({Key? key}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  final GlobalKey<FormState> _formKey = GlobalKey();

  final TextEditingController _addChampionController = TextEditingController();

  final TextEditingController _addNameController = TextEditingController();

  final ChampionRepository championRepository = ChampionRepository();

  final ProfilRepository profilRepository = ProfilRepository();
  List<bool> _isOpen = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profil'),
        ),
        body: BlocBuilder<ChampionCubit, List<Champion>>(
            builder: ((context, state) {
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 8.0),
                    child: TextFormField(
                      controller: _addNameController,
                      decoration: InputDecoration(
                          labelText: "Account name",
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
                      child: const Text('Add'),
                      onPressed: () {
                        validate(context);
                        _addNameController.clear();
                        setState(() {
                          BlocProvider.of<ChampionCubit>(context, listen: false)
                              .state;
                        });
                      }),
                  ExpansionPanelList.radio(
                      children:
                          BlocProvider.of<ChampionCubit>(context, listen: false)
                              .state
                              .map<ExpansionPanelRadio>((Champion champion) {
                    return ExpansionPanelRadio(
                      value: champion.champion,
                      headerBuilder: (BuildContext context, bool isExpanded) {
                        return ListTile(title: Text(champion.champion));
                      },
                      body: ListView.builder(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Text(champion.profils[index].name);
                          },
                          itemCount: champion.profils.length),
                    );
                  }).toList())
                ],
              ),
            ),
          );
        })));
  }

  void validate(BuildContext context) async {
    if (_formKey.currentState!.validate() &&
        _addChampionController.text != "" &&
        _addNameController.text != "") {
      for (Champion champion
          in BlocProvider.of<ChampionCubit>(context, listen: false).state) {
        if (champion.champion == _addChampionController.text) {
          champion.profils.add(
              await profilRepository.fetchAddresses(_addNameController.text));
          championRepository.saveChampion(
              BlocProvider.of<ChampionCubit>(context, listen: false).state);
        }
      }
    }
  }
}
