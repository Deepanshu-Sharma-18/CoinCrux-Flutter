import "dart:io";
import 'package:coincrux/firebase_options.dart';
import 'package:coincrux/resources/resources.dart';
import 'package:coincrux/routes/app_pages.dart';
import 'package:coincrux/routes/app_routes.dart';
import 'package:coincrux/screens/auth/provider/auth_provider.dart';
import 'package:coincrux/screens/dashboard/news_feed/provider/news_provider.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthProvider()),
        ChangeNotifierProvider(create: (_) => NewsProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);
  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState? state = context.findRootAncestorStateOfType<_MyAppState>();
    state?.setLocale(locale);
  }

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  void setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Platform.isIOS
    ? CupertinoApp(
            color: R.colors.whiteColor,
            debugShowCheckedModeBanner: false,
            locale: _locale,
            supportedLocales: const [
              Locale('en', 'US'),
              Locale('ar', 'SA'),
              Locale('fr', 'FR'),
            ],
            localeResolutionCallback:
                (Locale? deviceLocale, Iterable<Locale> supportedLocales) {
              for (var locale in supportedLocales) {
                if (locale.languageCode == deviceLocale?.languageCode &&
                    locale.countryCode == deviceLocale?.countryCode) {
                  return deviceLocale;
                }
              }
              return supportedLocales.first;
            },
            initialRoute: Routes.splash,
            title: "CoinCrux",
            
          )
    :GetMaterialApp(
      color: R.colors.whiteColor,
      debugShowCheckedModeBanner: false,
      locale: _locale,
      fallbackLocale: Locale('en', 'US'),
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ar', 'SA'),
        Locale('fr', 'FR'),
      ],
      localeResolutionCallback:
          (Locale? deviceLocale, Iterable<Locale> supportedLocales) {
        for (var locale in supportedLocales) {
          if (locale.languageCode == deviceLocale?.languageCode &&
              locale.countryCode == deviceLocale?.countryCode) {
            return deviceLocale;
          }
        }
        return supportedLocales.first;
      },
      getPages: AppPages.pages,

      initialRoute: Routes.splash,
      title: "CoinCrux",
    );
  }
}
