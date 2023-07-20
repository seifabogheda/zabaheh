part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final List<SettingsModel> settings;
  final RequestState settingsState;
  const SettingsState({this.settings =  const [], this.settingsState = RequestState.init});
  SettingsState copyWith({
    List<SettingsModel>? settings,
     RequestState? settingsState,

  }) {
    return SettingsState(
      settings: settings ?? this.settings,
      settingsState: settingsState ?? this.settingsState,

    );
  }
  @override
  List<Object?> get props => [settingsState,settings];
}

