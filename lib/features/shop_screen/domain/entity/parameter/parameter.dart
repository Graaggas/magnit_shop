import 'package:hive/hive.dart';

part 'parameter.g.dart';

/// Parameter of product.
@HiveType(typeId: 1)
class Parameter {
  /// Parameter id.
  @HiveField(0)
  final int id;

  /// Parameter name.
  @HiveField(1)
  final String name;

  Parameter({
    required this.id,
    required this.name,
  });
}
