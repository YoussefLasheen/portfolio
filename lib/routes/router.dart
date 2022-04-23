import 'package:auto_route/auto_route.dart';
import 'package:portfolio/navigation/root.dart';

import 'package:portfolio/screens/about_screen/about_screen.dart';
import 'package:portfolio/screens/contact_screen/contact_screen.dart';
import 'package:portfolio/screens/projects_screen/projects_screen.dart';
import 'package:portfolio/screens/projects_screen/widgets/project_details_screen/project_details_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(path: '/', page: Root, children: [
      AutoRoute(
        path: 'about',
        name: 'AboutRouter',
        page: AboutScreen,
      ),
      AutoRoute(
          path: 'projects',
          name: 'ProjectsRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: ProjectsScreen),
            AutoRoute(path: ':id', name:'ProjectsDetailsRouter',page: ProjectDetailsScreen),
          ]),
      AutoRoute(
        path: 'contact',
        name: 'ContactRouter',
        page: ContactScreen,
      )
    ]),
  ],
)
class $AppRouter {}
