import 'package:equatable/equatable.dart';

import 'package:pizza_app/domain/menu/items/menu_item.dart';

class Menu extends Equatable {
  final List<Pizza> pizzas;

  final List<Combo> combos;

  const Menu({
    required this.pizzas,
    required this.combos,
  });

  @override
  List<Object?> get props => [
        pizzas,
        combos,
      ];

  factory Menu.fromJson(Map<String, List<Map<String, dynamic>>> json) {
    final pizzas = <Pizza>[];

    final combos = <Combo>[];

    final pizzasJson = json["pizzas"];

    final combosJson = json["combos"];

    for (int i = 0; i < pizzasJson!.length; i++) {
      pizzas.add(Pizza.fromJson(pizzasJson[i]));
    }

    for (int i = 0; i < combosJson!.length; i++) {
      combos.add(Combo.fromJson(combosJson[i]));
    }

    return Menu(pizzas: pizzas, combos: combos);
  }
}
