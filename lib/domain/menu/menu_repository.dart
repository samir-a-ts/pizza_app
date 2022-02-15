import 'package:dartz/dartz.dart';
import 'package:pizza_app/domain/core/error/failure.dart';
import 'package:pizza_app/domain/menu/menu.dart';

abstract class MenuRepository {
  Future<Either<Failure, Menu>> loadMenu();
}
