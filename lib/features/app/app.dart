import 'package:flutter/material.dart';
import 'package:magnit_shop/features/app/di/app_scope.dart';
import 'package:magnit_shop/features/common/widgets/di_scope/di_scope.dart';
import 'package:magnit_shop/features/navigation/domain/delegate/app_router_delegate.dart';
import 'package:magnit_shop/features/navigation/domain/parser/app_route_information_parser.dart';
import 'package:magnit_shop/features/navigation/service/app_coordinate.dart';
import 'package:magnit_shop/features/navigation/service/coordinator.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  late IAppScope _scope;

  @override
  void initState() {
    super.initState();

    _scope = AppScope();
    _setupRouting(_scope.coordinator);
  }

  @override
  Widget build(BuildContext context) {
    return DiScope<IAppScope>(
      factory: () {
        return _scope;
      },
      child: MaterialApp.router(
        routeInformationParser: AppRouteInformationParser(),
        routerDelegate: AppRouterDelegate(_scope.coordinator),
      ),
    );
  }

  void _setupRouting(Coordinator coordinator) {
    coordinator
      ..initialCoordinate = AppCoordinates.initScreen
      ..registerCoordinates('/', appCoordinates);
  }
}
