import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../models/option_model.dart';
import '../../../../repos/base_repo.dart';
import '../../../../repos/repo_impl.dart';

part 'options_state.dart';

class OptionsCubit extends Cubit<OptionsState> {
  OptionsCubit() : super(OptionsInitial());
  BaseRepo repoImpl = RepoImpl();

  getOptions() async{
    var result = await repoImpl.options();
    if (result.isNotEmpty) {
      emit(OptionsSuccess(result));
    }
  }
}
