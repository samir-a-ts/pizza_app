import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class Failure extends Equatable {
  final FailureCode code;

  factory Failure.fromError(DioError error) {
    FailureCode? code = error.type.toCode();

    if (code != null) return Failure(code);

    final responseCode = error.error["code"] as int;

    switch (responseCode) {
      case 500:
        code = FailureCode.serverError;
        break;
      case 400:
        code = FailureCode.badRequest;
        break;
      default:
        code = FailureCode.other;
    }

    return Failure(code);
  }

  const Failure(this.code);

  @override
  List<Object?> get props => [code];
}

enum FailureCode {
  connectTimeout,
  sendTimeout,
  receiveTimeout,
  cancel,
  serverError,
  badRequest,
  other
}

extension DioErrorTypeExt on DioErrorType {
  FailureCode? toCode() {
    switch (this) {
      case DioErrorType.connectTimeout:
        return FailureCode.connectTimeout;
      case DioErrorType.sendTimeout:
        return FailureCode.sendTimeout;
      case DioErrorType.receiveTimeout:
        return FailureCode.receiveTimeout;
      case DioErrorType.cancel:
        return FailureCode.cancel;
    }
  }
}
