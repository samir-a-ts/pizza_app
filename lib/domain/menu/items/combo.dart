part of "menu_item.dart";

class Combo extends MenuItem {
  Combo({
    required this.inclusions,
    required this.price,
    required String id,
    required String positionName,
    required String imageUrl,
    required String description,
  }) : super(
          id: id,
          positionName: positionName,
          imageUrl: imageUrl,
          description: description,
        );

  final List<String> inclusions;

  final int price;

  factory Combo.fromJson(Map<String, dynamic> json) {
    return Combo(
      inclusions: (json["inclusions"] as List<dynamic>).cast<String>(),
      price: json["price"],
      id: json["objectId"],
      positionName: json["name"],
      imageUrl: json["imageUrl"],
      description: json["description"],
    );
  }
}
