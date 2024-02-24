import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:quiz/api/services.dart';
import 'package:provider/provider.dart';
import 'package:quiz/routes.dart';
import 'package:quiz/wrapper.dart';

void main() {
  // WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => Services(),
      child: const MaterialAppChanger(),
    );
  }
}

class MaterialAppChanger extends StatefulWidget {
  const MaterialAppChanger({super.key});
  // static void setLocale(BuildContext context, Locale newLocale) {
  //   // _MaterialAppChangerState state =
  //   //     context.findAncestorStateOfType<_MaterialAppChangerState>();
  //   // state.setLocale(newLocale);
  // }

  @override
  MaterialAppChangerState createState() => MaterialAppChangerState();
}

class MaterialAppChangerState extends State<MaterialAppChanger> {
  // Locale _locale;
  // String _page;
  // setLocale(Locale locale) {
  //   setState(() {
  //     _locale = locale;
  //   });
  // }

  // @override
  // void didChangeDependencies() async {
  //   await getStringValue('lang').then((locale) {
  //     setState(() {
  //       this._locale = (locale == null) ? Locale('en', '') : Locale(locale, '');
  //     });
  //   });
  //   await getIntValue('intro').then((v) {
  //     setState(() {
  //       this._page = (v == 1) ? Wrapper.routeName : SplashScreen.routeName;
  //     });
  //   });
  //   super.didChangeDependencies();
  // }

  // @override
  // void dispose() {
  //   getStringValue('lang').then((locale) {
  //     setState(() {
  //       this._locale = (locale == null) ? Locale('en', '') : Locale(locale, '');
  //     });
  //   });
  //   getIntValue('intro').then((v) {
  //     setState(() {
  //       this._page = (v == 1) ? Wrapper.routeName : SplashScreen.routeName;
  //     });
  //   });
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // if (this._locale == null)
    //   return Center(child: CircularProgressIndicator());
    // else
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Quiz',
      // theme: theme(),
      home: const Wrapper(),
      routes: routes,
      initialRoute: Wrapper.routeName,
      // localizationsDelegates: [
      //   AppLocale.delegate,
      //   GlobalMaterialLocalizations.delegate,
      //   GlobalWidgetsLocalizations.delegate
      // ],
      // supportedLocales: [
      //   Locale("en", ""),
      //   Locale("ar", ""),
      //   Locale("fr", ""),
      // ],
      // locale: _locale,
      // localeResolutionCallback: (currentLang, supportLang) {
      //   if (currentLang != null) {
      //     for (Locale locale in supportLang) {
      //       if (locale.languageCode == currentLang.languageCode) {
      //         return currentLang;
      //       }
      //     }
      //   }
      //   return supportLang.first;
      // },
    );
  }
}
