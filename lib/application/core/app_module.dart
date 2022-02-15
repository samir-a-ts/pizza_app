import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:pizza_app/application/core/constants.dart';

@module
abstract class AppModule {
  BaseOptions get _options => BaseOptions(
        baseUrl: EnvironmentHelper.getBaseUrl(Environment.dev),
      );

  @injectable
  Dio get dio => Dio(_options);
}
