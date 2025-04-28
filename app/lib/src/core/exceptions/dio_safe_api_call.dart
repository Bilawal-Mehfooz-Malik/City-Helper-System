// import 'package:app/src/core/exceptions/app_exceptions.dart';
// import 'package:dio/dio.dart';

// Future<T> dioSafeApiCall<T>(Future<T> Function() apiCall) async {
//   try {
//     return await apiCall();
//   } on DioException catch (e) {
//     switch (e.type) {
//       case DioExceptionType.connectionError:
//         throw NoInternetConnectionException();

//       case DioExceptionType.connectionTimeout:
//         throw ConnectionTimeoutException();

//       case DioExceptionType.sendTimeout:
//         throw SendTimeoutException();

//       case DioExceptionType.receiveTimeout:
//         throw ReceiveTimeoutException();

//       case DioExceptionType.badResponse:
//         final statusCode = e.response?.statusCode;
//         final message = e.response?.data?.toString() ?? 'Unknown error';
//         throw ResponseException(statusCode, message);

//       case DioExceptionType.cancel:
//         throw RequestCancelException();

//       case DioExceptionType.unknown:
//         throw NetworkException();

//       default:
//         throw UnknownException();
//     }
//   }
// }
