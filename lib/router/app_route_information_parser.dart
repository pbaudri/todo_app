import 'package:flutter/material.dart';
import 'package:todo_app/router/app_path_information.dart';

class AppRouteInformationParser
    extends RouteInformationParser<AppPathInformation> {
  const AppRouteInformationParser();

  @override
  Future<AppPathInformation> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    return AppPathInformation();
  }

  @override
  RouteInformation? restoreRouteInformation(AppPathInformation configuration) {
    const String location = '';

    return const RouteInformation(location: location);
  }
}
