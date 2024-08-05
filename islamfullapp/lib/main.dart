import 'package:flutter/material.dart';
import 'package:islami/layout/layout_view.dart';
import 'package:islami/modules/Splash/splash_view.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'core/app_provider.dart';
import 'core/application_theme_manager.dart';
import 'modules/hadeeth/hadeeth_daetails.dart';
import 'modules/quran/quran_verses.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
        create: (BuildContext context) => Settingprovider(), child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<Settingprovider>(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ApplicationThemeManager.lighttheme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: Locale(provider.selectedlanguage),
      darkTheme: ApplicationThemeManager.darktheme,
      themeMode: provider.currentmode,
      initialRoute: "/",
      routes: {
        Splash_view.routename: (context) => const Splash_view(),
        Home_view.routename: (context) => const Home_view(),
        QuranVerses.route: (context) => QuranVerses(),
        hadeethdetails.route: (context) => const hadeethdetails(),
      },
    );
  }
}
