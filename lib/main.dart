import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:portfolio/UI/providers/providers.dart';
import 'package:portfolio/config/router/app_router.dart';
import 'package:portfolio/config/theme/app_theme.dart';
import 'package:portfolio/utils/local_storage.dart';
import 'package:provider/provider.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.configPrefs();
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (context) => LanguageProvider())],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<LanguageProvider>().loadLanguage();
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'KCH PORTFOLIO',
      routerConfig: appRouter,
      theme: AppTheme.darkTheme(),
      locale: Locale(context.watch<LanguageProvider>().language),
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      supportedLocales: const [
        Locale('en'),
        Locale('es'),
      ],
    );
  }
}
