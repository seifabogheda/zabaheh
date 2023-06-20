import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/localization/app_localizations.dart';
import 'core/localization/lang_cubit/lang_cubit.dart';
import 'core/resource/navigation_service.dart';
import 'features/presentation/auth/screens/splash/view.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LangCubit, ChangeLangState>(
      builder: (context, state) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            // theme: MainData.defaultThem,
            title: "Base",
            supportedLocales: const [Locale("ar"), Locale("en")],
            locale: state.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],

            navigatorKey: navigatorKey,
            builder: (ctx, child) {
              child = FlutterEasyLoading(child: child); //do something
              return child;
            },
            home: Splash(),
        );
      },
    );
  }
}
