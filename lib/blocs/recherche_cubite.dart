import 'package:flutter/gestures.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/champion.dart';
import '../repositories/champion_repository.dart';

class RechercheCubit extends Cubit<String> {
  RechercheCubit() : super("");

  emiteRecherche(recherche) {
    emit(recherche);
  }
}
