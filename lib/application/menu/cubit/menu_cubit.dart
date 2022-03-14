import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:pizza_app/domain/core/error/failure.dart';
import 'package:pizza_app/domain/menu/menu.dart';
import 'package:pizza_app/domain/menu/menu_repository.dart';

part 'menu_state.dart';

@singleton
class MenuCubit extends Cubit<MenuState> {
  final MenuRepository _menuRepository;

  MenuCubit(this._menuRepository) : super(MenuInitial());

  Future<void> loadMenu() async {
    emit(MenuLoading());

    final menuResult = await _menuRepository.loadMenu();

    emit(
      menuResult.fold(
        (failure) => MenuError(failure),
        (menu) => MenuLoaded(menu),
      ),
    );
  }
}
