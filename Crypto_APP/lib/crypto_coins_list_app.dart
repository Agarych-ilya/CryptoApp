import 'package:flutter/material.dart';
import 'package:flutter_application_1/Theme/theme.dart';
import 'package:flutter_application_1/router/router.dart';




class CryptoCurrenciesListApp extends StatelessWidget {
  const CryptoCurrenciesListApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoCurrenceList',
      theme: darkTheme,
      routes: routes,
    );
  }
}
