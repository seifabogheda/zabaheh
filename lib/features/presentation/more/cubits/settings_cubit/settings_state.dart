part of 'settings_cubit.dart';

class SettingsState extends Equatable {
  final String? settings;
  final RequestState settingsState;
  const SettingsState({this.settings, this.settingsState = RequestState.init});
  SettingsState copyWith({
    String? settings,
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

