import 'package:api_riot/repositories/profil_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/profil.dart';

class ProfilCubit extends Cubit<Profil> {
  final ProfilRepository _profilRepository;

  ProfilCubit(this._profilRepository)
      : super(Profil('', 0, 'profil doesnt exist', '', '', 0));

  Future<void> loadProfil(query) async {
    final Profil profil = await _profilRepository.fetchAddresses(query);
    emit(profil);
  }
}
