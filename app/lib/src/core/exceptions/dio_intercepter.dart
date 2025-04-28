// import 'package:dio/dio.dart';
// import 'package:app/src/core/exceptions/app_logger.dart';

// class CustomInterceptors extends Interceptor {
//   @override
//   void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
//     AppLogger.logInfo("📤 REQUEST [${options.method}] => URL: ${options.uri}");

//     // * Logs headers and body if present
//     if (options.headers.isNotEmpty) {
//       AppLogger.logInfo("🔹 Headers: ${options.headers}");
//     }
//     if (options.data != null) {
//       AppLogger.logInfo("📦 Body: ${options.data}");
//     }

//     super.onRequest(options, handler);
//   }

//   @override
//   void onResponse(
//       Response<dynamic> response, ResponseInterceptorHandler handler) {
//     AppLogger.logSuccess(
//         "✅ RESPONSE [${response.statusCode}] => URL: ${response.requestOptions.uri}");

//     if (response.data != null) {
//       AppLogger.logInfo("📥 Response Data: ${response.data}");
//     }

//     super.onResponse(response, handler);
//   }

//   @override
//   Future<dynamic> onError(
//       DioException err, ErrorInterceptorHandler handler) async {
//     AppLogger.logError(
//         "❌ ERROR [${err.response?.statusCode}] => URL: ${err.requestOptions.uri}",
//         error: err,
//         stackTrace: err.stackTrace);

//     if (err.response?.data != null) {
//       AppLogger.logError("📄 Error Response: ${err.response?.data}");
//     }

//     super.onError(err, handler);
//   }
// }
