import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:todo_app/main.dart';
import 'package:todo_app/router/app_path_information.dart';

class AppRouterDelegate extends RouterDelegate<AppPathInformation>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin<AppPathInformation> {
  final Map<String, VoidCallback> _popEvents = {};

  void onPopPage(String routeName, VoidCallback action) {
    _popEvents[routeName] = action;
  }

  @override
  Widget build(BuildContext context) {
    final List<Page<dynamic>> pages = [];
    pages.add(const MaterialPage(
      child: MyApp(),
    ));
    final navigator = Navigator(
      key: navigatorKey,
      pages: pages,
      onPopPage: _onPopPage,
    );

    return navigator;
  }

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    if (!route.didPop(result)) {
      return false;
    }

    final routeName = route.settings.name;
    final popAction = _popEvents[routeName];
    if (popAction != null) {
      log('execute pop event for $routeName', name: 'AppRouterDelegate');
      _popEvents.remove(routeName);
      popAction();
    }

    return true;
  }

  @override
  GlobalKey<NavigatorState>? navigatorKey = GlobalKey<NavigatorState>();

  @override
  AppPathInformation? get currentConfiguration => AppPathInformation();

  @override
  Future<void> setNewRoutePath(AppPathInformation configuration) async {}
}
