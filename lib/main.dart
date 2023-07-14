import 'package:flutter/material.dart';
import 'package:portfolio/pages/portfolio_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      //theme: ThemeData.dark(),
      theme: ThemeData(
        // appBarTheme: AppBarTheme(
        //     toolbarTextStyle: TextStyle(color: Colors.black),
        //     titleTextStyle: TextStyle(color: Colors.black)),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
        useMaterial3: true,
      ),
      home: const PortfolioPage(),
    );
  }
}
