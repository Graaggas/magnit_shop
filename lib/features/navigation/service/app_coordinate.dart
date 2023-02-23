import 'package:magnit_shop/features/navigation/domain/entity/coordinate.dart';
import 'package:magnit_shop/features/shop_screen/screen/shop_screen.dart';

/// A set of routes for the entire app.
class AppCoordinates implements Coordinate {
  /// Initialization screens([InitScreen]).
  static const initScreen = AppCoordinates._('profile');

  /// Widget screen with personal data about user(surname, name,
  /// second name(optional), birthday).
  static const personalDataScreen = AppCoordinates._('personal_data');

  /// Widget screen with users place of residence.
  static const placeResidenceScreen = AppCoordinates._('place_residence');

  /// Widget screen with users interests.
  static const interestsScreen = AppCoordinates._('interests_screen');

  /// Widget screen with information about yourself.
  static const aboutMeScreen = AppCoordinates._('about_me');

  final String _value;

  const AppCoordinates._(this._value);

  @override
  String toString() => _value;
}

/// List of main routes of the app.
final Map<AppCoordinates, CoordinateBuilder> appCoordinates = {
  AppCoordinates.initScreen: (_, __) => const ShopScreen(),
};
