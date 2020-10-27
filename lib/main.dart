import 'package:flutter/material.dart';
import 'package:hooks_riverpod/all.dart';
import 'package:whotsapp/screens/home_screen.dart';

void main() => runApp(ProviderScope(child: MyApp()));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'mMoney Merchant',
      theme: ThemeData(
        primaryColor: Colors.orange[800],
      ),
      routes: {
        '/': (BuildContext context) => HomeScreen(),
        // '/main': (BuildContext context) => CommonScreen(),
        // '/currency': (BuildContext context) => CurrencyDetail(),
        // '/merchants': (BuildContext context) => Billers(),
        // '/services': (BuildContext context) => Services(),
        // '/settings': (BuildContext context) => Settings(),
      },
    );
  }
}
