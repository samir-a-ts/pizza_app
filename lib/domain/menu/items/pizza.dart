part of "menu_item.dart";

class Pizza extends MenuItem {
  Pizza({
    required this.priceDictionary,
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

  final Map<String, int> priceDictionary;

  factory Pizza.fromJson(Map<String, dynamic> json) {
    return Pizza(
      priceDictionary: json["priceDictionary"],
      id: json["objectId"],
      positionName: json["name"],
      imageUrl: json["imageUrl"],
      description: json["description"],
    );
  }
}
