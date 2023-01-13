import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:portfolio/navigation/root.dart';
import 'package:portfolio/screens/about_screen/about_screen.dart';
import 'package:portfolio/screens/contact_screen/contact_screen.dart' deferred as contact_screen;
import 'package:portfolio/screens/projects_screen/projects_screen.dart' deferred as projects_screen;
import 'package:portfolio/screens/projects_screen/widgets/project_details_screen/project_details_screen.dart' deferred as project_details;

import 'firebase_options.dart';
import 'screens/projects_screen/models/project.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _router = GoRouter(initialLocation: '/about', routes: [
    ShellRoute(
      builder: (BuildContext context, GoRouterState state, Widget child) {
        return Root(child: SelectionArea(child: child));
      },
      routes: [
        GoRoute(
          path: '/about',
          pageBuilder: (
            context,
            state,
          ) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: AboutScreen(),
              transitionDuration: Duration.zero,
              transitionsBuilder: (_, __, ___, child) => child,
            );
          },
        ),
        GoRoute(
          path: '/projects',
          pageBuilder: (
            context,
            state,
          ) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: FutureBuilder(
                future: projects_screen.loadLibrary(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return projects_screen.ProjectsScreen(queryTag: state.queryParams['tag']);
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
              transitionDuration: Duration.zero,
              transitionsBuilder: (_, __, ___, child) => child,
            );
          },
          routes: [
            GoRoute(
              path: ':id',
              pageBuilder: (
                context,
                state,
              ) {
                return CustomTransitionPage(
                  key: state.pageKey,
                  child: FutureBuilder(
                    future: project_details.loadLibrary(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return project_details.ProjectDetailsScreen(
                          id: state.params['id'],
                          project: state.extra as Project?,
                        );
                      } else {
                        return SizedBox.shrink();
                      }
                    },
                  ),
                  transitionDuration: Duration.zero,
                  transitionsBuilder: (_, __, ___, child) => child,
                );
              },
            ),
          ],
        ),
        GoRoute(
          path: '/contact',
          pageBuilder: (
            context,
            state,
          ) {
            return CustomTransitionPage(
              key: state.pageKey,
              child: FutureBuilder(
                future: contact_screen.loadLibrary(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return contact_screen.ContactScreen();
                  } else {
                    return SizedBox.shrink();
                  }
                },
              ),
              transitionDuration: Duration.zero,
              transitionsBuilder: (_, __, ___, child) => child,
            );
          },
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
