part of 'contact_us_cubit.dart';

 class ContactUsState extends Equatable {
   final ContactModel? settings;
   final RequestState settingsState;

   const ContactUsState(
       {this.settings, this.settingsState = RequestState.init});

   ContactUsState copyWith({
     ContactModel? settings,
     RequestState? settingsState,

   }) {
     return ContactUsState(
       settings: settings ?? this.settings,
       settingsState: settingsState ?? this.settingsState,
     );
   }

   @override
   List<Object?> get props => [settings, settingsState];
 }

