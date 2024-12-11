import 'package:flutter/material.dart';

import '../l10n/generated/l10n.dart';
import 'views/screens/todo_screen/todo_screen.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateTitle: (context) => Lt.of(context).title,
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      localizationsDelegates: Lt.localizationsDelegates,
      supportedLocales: Lt.supportedLocales,
      locale: Locale("bn"),
      home: TodoScreen(),
    );
  }
}
