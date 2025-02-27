import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'core/localization/app_localizations.dart';
import 'core/localization/lang_cubit/lang_cubit.dart';
import 'core/resource/navigation_service.dart';
import 'features/presentation/animal_details/cubits/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'features/presentation/auth/blocs/auth_cubit/auth_cubit.dart';
import 'features/presentation/auth/blocs/user_cubit/user_cubit.dart';
import 'features/presentation/auth/screens/splash/view.dart';
import 'features/presentation/main_navigation_bar/cubits/main_navigation_cubit.dart';
import 'features/presentation/more/cubits/settings_cubit/settings_cubit.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthCubit>(
          create: (BuildContext context) => AuthCubit(),
        ), BlocProvider<BottomNavCubit>(
          create: (BuildContext context) => BottomNavCubit(),
        ),
        BlocProvider<UserCubit>(
          create: (BuildContext context) => UserCubit(),
        ),
        BlocProvider<AddToCartCubit>(
          create: (BuildContext context) => AddToCartCubit(),
        ),BlocProvider<SettingsCubit>(
          create: (BuildContext context) => SettingsCubit(),
        ),
      ],
      child: BlocBuilder<LangCubit, ChangeLangState>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            // theme: MainData.defaultThem,
            title: "ذبيحة اونلاين",
            supportedLocales: const [Locale("ar", "SA"), Locale("en", "US")],
            locale: state.locale,
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate
            ],
            localeResolutionCallback: (deviceLocale, supportedLocales) {
              for (var locale in supportedLocales) {
                if (deviceLocale != null &&
                    deviceLocale.languageCode == locale.languageCode) {
                  return deviceLocale;
                }
              }

              return supportedLocales.first;
            },
            navigatorKey: navigatorKey,
            builder: (ctx, child) {
              child = FlutterEasyLoading(child: child); //do something
              return child;
            },
            home: Splash(),
          );
        },
      ),
    );
  }
}
