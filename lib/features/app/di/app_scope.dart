import 'package:magnit_shop/features/navigation/service/coordinator.dart';

/// Scope of dependencies which need through all app's life.
class AppScope implements IAppScope {
  late final Coordinator _coordinator;

  @override
  Coordinator get coordinator => _coordinator;

  /// Constructor for [AppScope].
  AppScope() {
    _coordinator = Coordinator();
  }
}

/// App dependencies.
abstract class IAppScope {
  /// Class that coordinates navigation for the whole app.
  Coordinator get coordinator;
}
