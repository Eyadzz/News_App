import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:news_application/tabs//HomeScreen/HomeScreen.dart';
import 'package:news_application/tabs/CategoryScreen/CategoryScreen.dart';
import 'package:news_application/tabs/Settings/SettingsTab.dart';
import 'utility/AppConfigProvider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() {
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final Color primaryColor=Color.fromRGBO(57, 165, 82, 1.0);
    return ChangeNotifierProvider(create: (buildContext) => AppConfigProvider(),
      builder: (buildContext,widget){

        final provider = Provider.of<AppConfigProvider>(buildContext);

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          localizationsDelegates: [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: [
            Locale('en', ''),
            Locale('ar', ''),
          ],
          locale: Locale.fromSubtags(languageCode: provider.currentLocale),
          theme: ThemeData(
            primaryColor: primaryColor,
          ),
          routes: {
            HomeScreen.routeName: (context) =>HomeScreen(),
            SettingsTab.routeName: (context) => SettingsTab(),
            CategoryScreen.routeName: (context)=> CategoryScreen(),
          },
          initialRoute: CategoryScreen.routeName,
        );
      },
    );
  }
}