part of 'menu_cubit.dart';

abstract class MenuState extends Equatable {
  const MenuState();

  @override
  List<Object> get props => [];
}

class MenuInitial extends MenuState {}

class MenuLoading extends MenuState {}

class MenuError extends MenuState {
  final Failure failure;

  const MenuError(this.failure);

  @override
  List<Object> get props => [failure];
}

class MenuLoaded extends MenuState {
  final Menu menu;
  final MenuLoadedState state;

  const MenuLoaded(this.menu, {this.state = MenuLoadedState.loaded});

  @override
  List<Object> get props => [menu, state];
}

enum MenuLoadedState { loaded, reloading, reloadingError }
