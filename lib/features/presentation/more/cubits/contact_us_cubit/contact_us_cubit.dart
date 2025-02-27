import 'package:base_flutter/features/models/contact_us_model.dart';
import 'package:base_flutter/features/repos/base_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

import '../../../../../core/utils/enums.dart';
import '../../../../repos/repo_impl.dart';

part 'contact_us_state.dart';

class ContactUsCubit extends Cubit<ContactUsState> {
  ContactUsCubit() : super(ContactUsState());

  BaseRepo repo = RepoImpl();
  getSettings() async {
    emit(state.copyWith(settingsState: RequestState.loading));

    var result = await repo.contactUs();
    if (result != '') {

      emit(state.copyWith(
          settingsState: RequestState.loaded,settings: result));
    } else {
      emit(state.copyWith(settingsState: RequestState.error, settings:null));
    }
  }
}
