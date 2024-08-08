import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localization_example/provider.dart';
import 'package:provider/provider.dart';
import 'localization.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyProvider(),
      child: Consumer<MyProvider>(
        builder: (context, provider, child){
          return MaterialApp(
            title: 'Localization Example',
            theme: ThemeData(useMaterial3: true,),
            debugShowCheckedModeBanner: false,
            locale: Locale(provider.language, '',),
            localizationsDelegates: const [
              AppLocale.delegate,
              GlobalMaterialLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate
            ],
            supportedLocales: const [
              Locale('en', ''), // English
              Locale('fr', ''), // French
              Locale('ar', ''), // Arabic

            ],
            home: const MyHomePage(title: 'Flutter Localization Example'),
          );
        },
      )
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<MyProvider>(
        builder: (context, provider, child){
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Text(translate(context, 'hi'),),

                const SizedBox(height: 100,),

                ElevatedButton(
                    onPressed: ()=> context.read<MyProvider>().changeAppLanguage('en'),
                    child: const Text('English'),
                ),

                ElevatedButton(
                  onPressed: ()=> context.read<MyProvider>().changeAppLanguage('fr'),
                  child: const Text('French'),
                ),

                ElevatedButton(
                  onPressed: ()=> context.read<MyProvider>().changeAppLanguage('ar'),
                  child: const Text('Arabic'),
                ),

              ],
            ),
          );
        },
      ),
    );
  }
}

