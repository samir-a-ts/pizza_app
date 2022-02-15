import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pizza_app/domain/menu/menu.dart';
import 'package:pizza_app/domain/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:pizza_app/domain/menu/menu_repository.dart';

@Injectable(as: MenuRepository)
class MenuRepositoryImpl extends MenuRepository {
  final Dio _dio;

  MenuRepositoryImpl(this._dio);

  @override
  Future<Either<Failure, Menu>> loadMenu() async {
    try {
      final request =
          await _dio.get<Map<String, List<Map<String, dynamic>>>>("/menu");

      final menu = Menu.fromJson(request.data!);

      return right(menu);
    } on DioError catch (e) {
      return left(Failure.fromError(e));
    }
  }
}
