import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:magnit_shop/features/navigation/domain/entity/coordinate.dart';
import 'package:magnit_shop/features/navigation/service/app_coordinate.dart';

/// [RouteInformationParser] implementation.
/// Passed in the routeInformationParser field in [MaterialApp.router].
class AppRouteInformationParser extends RouteInformationParser<Coordinate> {
  @override
  Future<Coordinate> parseRouteInformation(RouteInformation routeInformation) =>
      SynchronousFuture(AppCoordinates.initScreen);
}
