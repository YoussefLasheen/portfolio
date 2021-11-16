import 'package:flutter/material.dart';
import 'package:portfolio/navigation/root.dart';
import 'package:portfolio/routes/router.gr.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "Youssef Lasheen's Portfolio",
      theme: ThemeData.dark(),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
