import 'package:base_flutter/core/utils/enums.dart';
import 'package:base_flutter/features/repos/base_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../models/settings_model.dart';
import '../../../../repos/repo_impl.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsState());

  BaseRepo repo = RepoImpl();
  getSettings(String pageName) async {
    emit(state.copyWith(settingsState: RequestState.loading));

    var result = await repo.settings(pageName);
    if (result != '') {

      emit(state.copyWith(
          settingsState: RequestState.loaded,settings: result));
    } else {
      emit(state.copyWith(settingsState: RequestState.error, settings:''));
    }
  }

}
