import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pizza_app/application/core/constants.dart';

/// Class for dependecies registration
/// in injection container.
///
/// All getter, would be registered
/// in container.
///
/// Way it would be registered in container
/// based on decorators.
@module
abstract class AppModule {
  BaseOptions get _options => BaseOptions(
        baseUrl: EnvironmentHelper.getBaseUrl(Environment.dev),
      );

  @injectable
  Dio get dio => Dio(_options);
}
