// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i7;

import '../navigation/root.dart' as _i1;
import '../screens/about_screen/about_screen.dart' as _i2;
import '../screens/contact_screen/contact_screen.dart' as _i4;
import '../screens/projects_screen/projects_screen.dart' as _i5;
import '../screens/projects_screen/widgets/project_details_screen/project_details_screen.dart'
    as _i6;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i7.GlobalKey<_i7.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    Root.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.Root());
    },
    AboutRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i2.AboutScreen());
    },
    ProjectsRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i3.EmptyRouterPage());
    },
    ContactRouter.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.ContactScreen());
    },
    ProjectsScreen.name: (routeData) {
      final queryParams = routeData.queryParams;
      final args = routeData.argsAs<ProjectsScreenArgs>(
          orElse: () =>
              ProjectsScreenArgs(queryTag: queryParams.optString('queryTag')));
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i5.ProjectsScreen(key: args.key, queryTag: args.queryTag));
    },
    ProjectsDetailsRouter.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<ProjectsDetailsRouterArgs>(
          orElse: () =>
              ProjectsDetailsRouterArgs(id: pathParams.optString('id')));
      return _i3.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.ProjectDetailsScreen(
              isInversed: args.isInversed, id: args.id));
    }
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(Root.name, path: '/', children: [
          _i3.RouteConfig(AboutRouter.name, path: 'about', parent: Root.name),
          _i3.RouteConfig(ProjectsRouter.name,
              path: 'projects',
              parent: Root.name,
              children: [
                _i3.RouteConfig(ProjectsScreen.name,
                    path: '', parent: ProjectsRouter.name),
                _i3.RouteConfig(ProjectsDetailsRouter.name,
                    path: ':id', parent: ProjectsRouter.name)
              ]),
          _i3.RouteConfig(ContactRouter.name,
              path: 'contact', parent: Root.name)
        ])
      ];
}

/// generated route for
/// [_i1.Root]
class Root extends _i3.PageRouteInfo<void> {
  const Root({List<_i3.PageRouteInfo>? children})
      : super(Root.name, path: '/', initialChildren: children);

  static const String name = 'Root';
}

/// generated route for
/// [_i2.AboutScreen]
class AboutRouter extends _i3.PageRouteInfo<void> {
  const AboutRouter() : super(AboutRouter.name, path: 'about');

  static const String name = 'AboutRouter';
}

/// generated route for
/// [_i3.EmptyRouterPage]
class ProjectsRouter extends _i3.PageRouteInfo<void> {
  const ProjectsRouter({List<_i3.PageRouteInfo>? children})
      : super(ProjectsRouter.name, path: 'projects', initialChildren: children);

  static const String name = 'ProjectsRouter';
}

/// generated route for
/// [_i4.ContactScreen]
class ContactRouter extends _i3.PageRouteInfo<void> {
  const ContactRouter() : super(ContactRouter.name, path: 'contact');

  static const String name = 'ContactRouter';
}

/// generated route for
/// [_i5.ProjectsScreen]
class ProjectsScreen extends _i3.PageRouteInfo<ProjectsScreenArgs> {
  ProjectsScreen({_i7.Key? key, String? queryTag})
      : super(ProjectsScreen.name,
            path: '',
            args: ProjectsScreenArgs(key: key, queryTag: queryTag),
            rawQueryParams: {'queryTag': queryTag});

  static const String name = 'ProjectsScreen';
}

class ProjectsScreenArgs {
  const ProjectsScreenArgs({this.key, this.queryTag});

  final _i7.Key? key;

  final String? queryTag;

  @override
  String toString() {
    return 'ProjectsScreenArgs{key: $key, queryTag: $queryTag}';
  }
}

/// generated route for
/// [_i6.ProjectDetailsScreen]
class ProjectsDetailsRouter
    extends _i3.PageRouteInfo<ProjectsDetailsRouterArgs> {
  ProjectsDetailsRouter({bool? isInversed, String? id})
      : super(ProjectsDetailsRouter.name,
            path: ':id',
            args: ProjectsDetailsRouterArgs(isInversed: isInversed, id: id),
            rawPathParams: {'id': id});

  static const String name = 'ProjectsDetailsRouter';
}

class ProjectsDetailsRouterArgs {
  const ProjectsDetailsRouterArgs({this.isInversed, this.id});

  final bool? isInversed;

  final String? id;

  @override
  String toString() {
    return 'ProjectsDetailsRouterArgs{isInversed: $isInversed, id: $id}';
  }
}
