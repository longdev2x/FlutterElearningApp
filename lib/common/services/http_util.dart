import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:ulearning_app/common/utils/constants.dart';
import 'package:ulearning_app/global.dart';

class HttpUtil {
  late Dio dio;
  HttpUtil._internal() {
    BaseOptions options = BaseOptions(
      baseUrl: AppConstants.serverApiUrl,
      connectTimeout: const Duration(seconds: 5),
      receiveTimeout: const Duration(seconds: 5),
      headers: {},
      contentType: 'application/json: charset=utf-8',
      responseType: ResponseType.json,
    );
    dio = Dio(options);

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) => handler.next(options),
        onResponse: (response, handler) => handler.next(response),
        onError: (DioException error, handler) {
          ErrorEntity errorInfo = createErrorEntity(error);
          onError(errorInfo);
        } ,
      ),
    );
  }

  static final HttpUtil _instance = HttpUtil._internal();

  factory HttpUtil() {
    return _instance;
  }

  Map<String, dynamic>? getAuthorizationHeader() {
    var headers = <String, dynamic>{};
    var accessToken = Global.storageService.getUserToken();
    if (accessToken.isNotEmpty) {
      headers['Authorization'] = 'Bearer $accessToken';
    }
    return headers;
  }

  Future post(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
    Options? options,
  }) async {

    Options requestOptions = options?? Options(); //Options() sẽ lấy dữ liêu từ BaseOptions nếu ta k đưa options cho hàm
    requestOptions.headers = requestOptions.headers?? {}; // BaseOptions để {} nên có thể null, trường hợp đó thì gán cho {}

    Map<String, dynamic>? authorization = getAuthorizationHeader();
    if(authorization!=null) {
      requestOptions.headers!.addAll(authorization);
    }

    var response = await dio.post(
      path,
      data: data, 
      queryParameters: queryParameters,
      options: requestOptions,
    );


    return response.data;
  }
}

class ErrorEntity implements Exception{
  int code = -1;
  String message = '';
  ErrorEntity({required this.code, required this.message});
  
  @override
  String toString() {
    if(message == '') {
      return "Exception";
    }
    return "Exception code -- $code, message -- $message";
  }
}

ErrorEntity createErrorEntity(DioException dioException) {
  switch(dioException.type) {
    case DioExceptionType.badResponse:
      switch(dioException.response!.statusCode){
        case 400:
          return ErrorEntity(code: 400, message: 'Bad request');
        case 401:
          return ErrorEntity(code: 401, message: 'Permission deniend');
        case 500:
          return ErrorEntity(code: 500, message: 'Sever internal error');
      }
      return ErrorEntity(code: dioException.response!.statusCode!, message: dioException.response!.statusMessage!);
    case DioExceptionType.connectionTimeout:
      return ErrorEntity(code: -1, message: 'Connected timeout');
    case DioExceptionType.badCertificate:
      return ErrorEntity(code: -1, message: 'Bad SSL certificates');
    case DioExceptionType.sendTimeout:
      return ErrorEntity(code: -1, message: 'Send timeout');
    case DioExceptionType.receiveTimeout:
      return ErrorEntity(code: -1, message: 'Receive Timeout');
    case DioExceptionType.cancel:
      return ErrorEntity(code: -1, message: 'Cancel');
    case DioExceptionType.connectionError:
      return ErrorEntity(code: -1, message: 'Connection Error');
    case DioExceptionType.unknown:
      return ErrorEntity(code: -1, message: 'Unknow');
  }
}

void onError(ErrorEntity errorEntity) {
  switch(errorEntity.code) {
    case 400:
      if (kDebugMode) {
        print("Server syntax error");
      }
      break;
    case 401:
      if (kDebugMode) {
        print("You are denied to continue");
      }
      break;
    case 500:
      if (kDebugMode) {
        print("Server internal error");
      }
      break;
    default:
      if (kDebugMode) {
        print("Unknown error");
      }
      break;
  }
}