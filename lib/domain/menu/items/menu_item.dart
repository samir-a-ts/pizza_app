part "pizza.dart";
part "combo.dart";

abstract class MenuItem {
  final String id;

  final String positionName;

  final String imageUrl;

  final String description;

  const MenuItem({
    required this.id,
    required this.positionName,
    required this.imageUrl,
    required this.description,
  });
}
