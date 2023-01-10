import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/navigation/root.dart';
import 'package:portfolio/screens/about_screen/about_screen.dart';
import 'package:portfolio/screens/contact_screen/contact_screen.dart';
import 'package:portfolio/screens/projects_screen/projects_screen.dart';
import 'package:portfolio/screens/projects_screen/widgets/project_details_screen/project_details_screen.dart';

import 'firebase_options.dart';
import 'screens/projects_screen/models/project.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ProviderScope(
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  final _router = GoRouter(
    initialLocation: '/about',
    routes: [
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return Root(child: child);
      },
      routes: [
        GoRoute(
          path: '/about',
          builder: (context, state) => AboutScreen(),
        ),
        GoRoute(
          path: '/projects',
          builder: (context, state) =>
              ProjectsScreen(queryTag: state.queryParams['filter']),
          routes: [
            GoRoute(
              path: ':id',
              builder: (context, state) {
                return ProjectDetailsScreen(
                  id: state.params['id'],
                  project: state.extra as Project,
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: '/contact',
          builder: (context, state) => ContactScreen(),
        ),
      ],
    )
  ]);
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
        title: "Portfolio", theme: ThemeData.dark(), routerConfig: _router);
  }
}
